import 'package:flutter/material.dart';

import '../../../utils/contantes.dart';


class ContainerDescricao extends StatelessWidget {
final Widget widget;

  const ContainerDescricao({super.key, required this.widget, });

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,
      height:  height(context: context, size: 2),
      width: double.infinity,child:widget,

    );
  }
}

