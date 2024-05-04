
import 'package:flutter/material.dart';

import '../../utils/widgets/colors_customs.dart';


class UIWhiteDialog extends StatefulWidget {
  final List<Widget>? content;
  const UIWhiteDialog({super.key, this.content});

  @override
  State<UIWhiteDialog> createState() => _UIWhiteDialogState();
}

class _UIWhiteDialogState extends State<UIWhiteDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Stack(alignment:Alignment.topCenter,children: [
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .8,
            decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.only(top: 104.0, bottom: 24),
              child: SingleChildScrollView(controller: ScrollController(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.content!,
                ),
              ),
            ),
          ),
        ),
        Material(
          elevation: 0.2,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: Container(

            width: MediaQuery.of(context).size.height * .2,
            height: MediaQuery.of(context).size.height * .2,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.white,
            ),
            child: Image.asset('assets/logo_losangulo.png'),
          ),
        ),

      ]),
    );
  }
}
