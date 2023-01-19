import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class CustomTextfeild extends HookWidget {
  const CustomTextfeild({
    Key? key,
    this.hinttext,
    this.validator,
    this.focusNode,
    required this.controller,
    this.maxLength,
    this.textInputFormatter,
    this.isPasswordField,
    this.textInputType,
    this.onFieldSubmitted,
    this.prefix,
    this.containercolor,
    this.textStyle,
    this.border,
    this.fillcolor,
    this.hintStyle,
    this.maxLines,
    this.containerborder,
    this.gradient,
    this.borderRadius,
    this.contentPadding,
    this.height,
    this.enabled,
    required this.textCapitalization,
    // this.gradientone,
    // this.gradienttwo,
    required this.blurRadius,
    required this.offset,
    bool? isObscure,
  }) : super(key: key);
  final String? hinttext;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? isPasswordField;
  final TextInputType? textInputType;
  final Function(String)? onFieldSubmitted;
  final InputBorder? border;
  final Color? fillcolor;
  final Color? containercolor;
  final Widget? prefix;
  final BoxBorder? containerborder;
  final int? maxLines;
  final double blurRadius;
  final Offset offset;
  final Gradient? gradient;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadiusGeometry? borderRadius;
  final bool? enabled;
  final TextCapitalization textCapitalization;
  // final Color? gradientone;
  // final Color? gradienttwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: containercolor,
        border: containerborder,
        boxShadow: [
          BoxShadow(
              color: Colors.black26, blurRadius: blurRadius, offset: offset),
        ],
        gradient: gradient,
      ),
      child: TextFormField(
        textCapitalization: textCapitalization,
        enabled: enabled,
        style: textStyle,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType,
        maxLength: maxLength,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: textInputFormatter,
        maxLines: maxLines,
        decoration: InputDecoration(
            counterText: '',
            contentPadding: contentPadding,
            hintStyle: hintStyle,
            hintText: hinttext,
            border: InputBorder.none,
            prefixIcon: prefix,
            labelStyle: TextStyle(
                color: Color(0xFF898989),
                fontSize: 13,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

customeFormTextField({
  String? name,
  int? maxLength,
  int? maxLines,
  double? height,
  Color? borderColor,
  required BuildContext context,
  TextEditingController? controller,
  var validation,
  TextInputType? keyboardType,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (name != null) ...[
        Text("$name*"),
        Gap(10),
      ],
      Container(
        height: height,
        child: TextFormField(
          maxLength: maxLength,
          maxLines: maxLines,
          controller: controller,
          validator: validation,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: borderColor ?? Color(0xFF9FB9ED)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: borderColor ?? Color(0xFF9FB9ED),
              ),
            ),
            counter: Offstage(),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          ),
        ),
      ),
    ],
  );
}
