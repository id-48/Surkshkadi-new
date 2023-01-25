import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomButton extends HookWidget {
  final Function() onTap;
  final String title;
  final EdgeInsetsGeometry? padding;
  const   CustomButton({Key? key,required this.onTap,required this.title,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        child:
        Text(title, style: TextStyle(color: Colors.white ),textAlign: TextAlign.center,),
        decoration: BoxDecoration(
          // color: blue,
          gradient: LinearGradient(
              colors: [
                Color(0xff3C87E0).withOpacity(0.9),
                Color(0xff0E3563).withOpacity(0.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.5,
              blurRadius: 1.5,
              offset: const Offset(0, 2),
            )
          ],

          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
