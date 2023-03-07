import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';


class CustomSelect extends StatelessWidget {
  CustomSelect(
      {Key? key,
      required this.items,
      required this.hint,
      this.selectedIndex,
      this.validator,
      this.focusNode,
      this.prefix,
      this.title,
        this.colors = white,
        this.height,
        this.onChanged,
        this.selectedValue,
        this.isRequired = false,
        this.isColorBox = false,
        this.dropdownHeight = 200})
      : super(key: key);

  final String hint;
  final String? title;
  final String? selectedValue;
  final int? selectedIndex;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Widget? prefix;
  final List<String> items;
  final controller = DropdownEditingController<String>();
  final double? dropdownHeight;
  final double? height;
  final Color? colors;
  final bool isRequired;
  final bool isColorBox;
  final void Function(dynamic item)? onChanged;
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(7.0));
    var border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: blue,
        width: 1.0,
      ),
    );
//    Colors.blue;

    // useEffect(() {
    controller.value = hint;
    // }, []);

    if (selectedIndex != null && selectedIndex != -1 && items.isNotEmpty) {
      controller.value = items[selectedIndex ?? 0];
    }

    if(selectedValue != null && selectedValue != ''){
      controller.value = selectedValue;
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: isColorBox == true ? blue : colors ,
        borderRadius: BorderRadius.circular(isColorBox == true ? 7 : 7),
      ),

      child: TextDropdownFormField(
        controller: controller,

        validator: validator,
        // onChanged: (str) {
        //   // onChanged!(str, items.indexOf(str));
        // },
        onChanged: onChanged,
        dropdownHeight: dropdownHeight,
        options: items,
        decoration: InputDecoration(iconColor: white,
          labelStyle: TextStyle(fontSize: 13,color: isColorBox == true ? white : greenjerry,),
          prefixStyle: TextStyle(fontSize: 13,color: isColorBox == true ? white : greenjerry,),
          suffixStyle: TextStyle(fontSize: 13,color:  white,),
          helperStyle: TextStyle(fontSize: 13,color:  white,),
          errorStyle: TextStyle(fontSize: 13,color:  white,),
          floatingLabelStyle: TextStyle(fontSize: 13,color:  white,),
          counterStyle: TextStyle(fontSize: 13,color:  white,),
          focusColor: Colors.white,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 11,right: 11,top: 10,bottom: 10),
          prefix:prefix,
          // Padding(padding: EdgeInsets.only(top: 0,right: 15,),
          //   child: Image.asset(cityicon,scale: 3.8,),
          // ),

          suffix: Padding(padding: EdgeInsets.only(top: 10),
            child: Image.asset(downarrow,scale: 3.5,color: isColorBox == true ? white : blue,),
          ),

          enabledBorder: border,
          focusedBorder: border,
          errorBorder: const OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
         isDense: true,


          border: border,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13,color:Colors.white,fontWeight: FontWeight.w400,
            decorationColor: Colors.white,
          ),
        ),
      ),
    );
  }
}


class CustomSelectState extends StatelessWidget {
  CustomSelectState(
      {Key? key,
        required this.items,
        required this.hint,
        this.selectedIndex,
        this.validator,
        this.focusNode,
        this.prefix,
        this.title,
        this.onChanged,
        this.selectedValue,
        this.isRequired = false,
        this.isColorBox = false,
        this.dropdownHeight = 200})
      : super(key: key);

  final String hint;
  final String? title;
  final String? selectedValue;
  final int? selectedIndex;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Widget? prefix;
  final List<String> items;
  final controller = DropdownEditingController<String>();
  final double? dropdownHeight;
  final bool isRequired;
  final bool isColorBox;
  final void Function(dynamic item)? onChanged;
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(7.0));
    var border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: blue,
        width: 1.0,
      ),
    );
//    Colors.blue;

    // useEffect(() {
    controller.value = hint;
    // }, []);

    if (selectedIndex != null && selectedIndex != -1 && items.isNotEmpty) {
      controller.value = items[selectedIndex ?? 0];
    }

    if(selectedValue != null && selectedValue != ''){
      controller.value = selectedValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(isRequired ? title! : title!,
            style:  TextStyle(
              // color: darkPrimaryColor,
              fontSize: 16,color:  isColorBox == true ? white : greenjerry,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(6),
        ],
        Container(
          decoration: BoxDecoration(
            color: isColorBox == true ? blue : white ,
            borderRadius: BorderRadius.circular(isColorBox == true ? 5 : 0),
          ),

          child: TextDropdownFormField(
            controller: controller,

            validator: validator,
            // onChanged: (str) {
            //   // onChanged!(str, items.indexOf(str));
            // },
            onChanged: onChanged,
            dropdownHeight: dropdownHeight,
            options: items,

            decoration: InputDecoration(iconColor: white,

              labelStyle: TextStyle(fontSize: 13,color: isColorBox == true ? white : greenjerry,),
              prefixStyle: TextStyle(fontSize: 13,color: isColorBox == true ? white : greenjerry,),
              suffixStyle: TextStyle(fontSize: 13,color:  white,),
              helperStyle: TextStyle(fontSize: 13,color:  white,),
              errorStyle: TextStyle(fontSize: 13,color:  white,),
              floatingLabelStyle: TextStyle(fontSize: 13,color:  white,),
              counterStyle: TextStyle(fontSize: 13,color:  white,),
              focusColor: Colors.white,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 11,right: 11,top: 10,bottom: 10),
              prefix:prefix,
              // Padding(padding: EdgeInsets.only(top: 0,right: 15,),
              //   child: Image.asset(cityicon,scale: 3.8,),
              // ),

              suffix: Padding(padding: EdgeInsets.all(5),
                child: Image.asset(downarrow,scale: 3.5,color: isColorBox == true ? white : blue,),
              ),

              enabledBorder: border,
              focusedBorder: border,
              errorBorder: const OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              isDense: true,


              border: border,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 13,color:Colors.white,fontWeight: FontWeight.w400,
                decorationColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class CustomSelectWeb extends StatelessWidget {
  CustomSelectWeb(
      {Key? key,
        required this.items,
        required this.hint,
        this.selectedIndex,
        this.validator,
        this.focusNode,
        this.prefix,
        this.textStyle,
        this.title,
        this.onChanged,
     required   this.boxShadow,
        this.iconColor,
        required this.borderCon,
        this.selectedValue,
        this.isRequired = false,
        this.color,
        this.dropdownHeight = 200})
      : super(key: key);

  final String hint;
  final String? title;
  final String? selectedValue;
  final TextStyle? textStyle;
  final int? selectedIndex;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Color? color;
  final Color? iconColor;
  final BorderSide borderCon;
  final List<String> items;
  final List<BoxShadow> boxShadow;
  final controller = DropdownEditingController<String>();
  final double? dropdownHeight;
  final bool isRequired;
  final void Function(dynamic item)? onChanged;
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(9.0));

    // useEffect(() {
    controller.value = hint;
    // }, []);

    if (selectedIndex != null && selectedIndex != -1 && items.isNotEmpty) {
      controller.value = items[selectedIndex ?? 0];
    }

    if(selectedValue != null && selectedValue != ''){
      controller.value = selectedValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(isRequired ? title! : title!,
            style: textStyle),
          const Gap(6),
        ],
        Container(
          height: 50,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: color,
            // border: Border.all(color: blue),
            boxShadow: boxShadow,
          ),
          child: TextDropdownFormField(

            controller: controller,
            validator: validator,
            // onChanged: (str) {
            //   // onChanged!(str, items.indexOf(str));
            // },
            onChanged: onChanged,
            dropdownHeight: dropdownHeight,
            options: items,
            decoration:  InputDecoration(

              labelStyle: TextStyle(fontSize: 18,color: black,),
              // contentPadding: EdgeInsets.only(left: 11,right: 11,top: 10,bottom: 10),
              prefix:prefix,

              suffix: Padding(padding: EdgeInsets.only(left: 5,right: 5),
                child: Image.asset(downarrow,scale: 3.5,color:  iconColor ,),
              ),

              enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: borderCon
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: borderCon
              ),
              errorBorder:  OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: borderCon
              ),
             ///
              //isDense: true,

              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 12,color: greenjerry,fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ],
    );
  }
}







