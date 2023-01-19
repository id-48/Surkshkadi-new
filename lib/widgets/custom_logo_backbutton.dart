import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';

class LogoBackButton extends HookWidget {
  final bool? backButton;
  const LogoBackButton({Key? key,this.backButton = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
            Image.asset(icLogo,scale: 4,),
            Spacer(),


          backButton == true
              ?
          InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text(back,style: TextStyle(fontSize: 18,color: textColor),))
              :
            Row(
              children: [
                Text(faq,style: TextStyle(fontSize: 18,color: textColor),),
                Gap(10),
                Text(myAccount,style: TextStyle(fontSize: 18,color: textColor),),
                Gap(40),
                Image.asset(info,scale: 4,),
                Gap(6),
                Text('Hi Avinash',style: TextStyle(fontSize: 18,color: navyblue),),
              ],
            ),



            SizedBox(width: MediaQuery.of(context).size.width * 0.14,),
          ],
        ),
        Gap(20),
        Divider(color: navyblue,height: 2),
      ],
    );
  }
}
