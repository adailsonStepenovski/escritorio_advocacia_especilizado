import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdi/mdi.dart';
import '../../../../widgets/widgets/colors_customs.dart';
import '../../../../widgets/widgets/custom_text.dart';
import '../../website/widgets/ui_dialog.dart';

Future<String?> uploadToFirebaseStorage(XFile file, String path) async {
  String? url;
  var ref = FirebaseStorage.instance
      .ref(path)
      .child("${DateTime.now().millisecondsSinceEpoch}.jpg");
  var uploadTask = ref.putData(await file.readAsBytes());
  return uploadTask.whenComplete(() => null).then((data) async {
    var uploadedUrl = await data.ref.getDownloadURL();
    url = uploadedUrl.toString();
    return url;
  }).catchError((err) {
    return null;
  });
}

Future getImage(bool isCamera) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery);

  if (pickedFile != null) {
    return pickedFile;
  } else {
    return null;
  }
}

class GetImageDialog extends StatefulWidget {
  final String title, descriptions, text;
  final String code = 'Get Image Dialog';

  const GetImageDialog(
      {super.key,
      required this.title,
      required this.descriptions,
      required this.text});

  @override
  State<GetImageDialog> createState() => _GetImageDialogState();
}

class _GetImageDialogState extends State<GetImageDialog> {
  @override
  Widget build(BuildContext context) {
    return UiDialog(
      content: [
        TextBold(
          text: widget.title,
          fontSize: 40,
        ),
        const SizedBox(
          height: 32,
        ),
        TextRegular(
          text: widget.descriptions,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                width: 300,
                height: 100,
                color: CustomColors.primary,
                child: const Center(
                  child: TextRegular(
                    text: 'Galeria',
                    fontColor: CustomColors.white,
                  ),
                ),
              ),
              onTap: () {
                getImage(false).then((value) {
                  if (value != null) {
                    Navigator.of(context).pop(value);
                  }
                });
              },
            ),
            const SizedBox(width: 35),
            InkWell(
              child: Container(
                width: 300,
                height: 100,
                color: CustomColors.primary,
                child: const Center(
                  child: TextRegular(
                    text: 'Camera',
                    fontColor: CustomColors.white,
                  ),
                ),
              ),
              onTap: () {
                getImage(true).then((value) {
                  if (value != null) {
                    Navigator.of(context).pop(value);
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ImagemGetUi extends StatelessWidget {
  final String foto;
  final Function() onPress;

  const ImagemGetUi({super.key, required this.foto, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.textLightGrey),
          borderRadius: BorderRadius.circular(30)),
      height: 200,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(24),
              child: foto != ''
                  ? CachedNetworkImage(
                      imageUrl: foto,
                      fit: BoxFit.contain,
                    )
                  : Container()),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 144,
              width: 144,
              child: GestureDetector(
                onTap: onPress,
                child: const Icon(Mdi.cameraPlus),
              ),
            ),
          )
        ],
      ),
    );
  }
}
