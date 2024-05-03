
import 'package:flutter/material.dart';

import '../../../utils/widgets/colors_customs.dart';

class UiDialog extends StatefulWidget {
  const UiDialog({
    super.key,
    required this.content,
  });

  final List<Widget>? content;

  @override
  State<UiDialog> createState() => _UiDialogState();
}

class _UiDialogState extends State<UiDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Stack(alignment:Alignment.topCenter,children: [
        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Container(
            width: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.all(42),
            child: Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.content!,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .31),
          child: Container(
           color:  Colors.transparent,
            child: Image.asset('assets/logo_sem_fundo.png',height: 130,width: 130,fit: BoxFit.contain,),
          ),
        ),
      ]),
    );
  }
}