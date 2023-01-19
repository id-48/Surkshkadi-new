import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:surakshakadi/utils/color_utils.dart';

class Custom_Dottedborder extends StatelessWidget {
  const Custom_Dottedborder({
    Key? key,
    required this.child,
    required this.padding,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
   return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        color: oreng,
        strokeWidth: 1.5,
        dashPattern: [5,5],
        child: child,
        padding: padding,

    );
  }
}
