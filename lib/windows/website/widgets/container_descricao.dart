import 'package:flutter/material.dart';

import '../../../utils/contantes.dart';


class ContainerDescricao extends StatelessWidget {
final List<Widget>widget;

  const ContainerDescricao({super.key, required this.widget, });

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,
      height:  height(context: context, size: .9),
      width: double.infinity,child: Column(children: widget,),

    );
  }
}

