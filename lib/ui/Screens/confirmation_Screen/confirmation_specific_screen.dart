import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';

class ConfirmationSpecific extends HookConsumerWidget {
  const ConfirmationSpecific({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    return Scaffold(
      appBar: CustomAppBar(
          title: 'Confirmation',
          // backonTap: () {
          //   Navigator.pop(context);
          // },
          notionTap: (){}
      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [

            SizedBox(height: Utils.getHeight(context) *0.05 ,),

            Text(yaayYourPaymentFor,
              style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

            SizedBox(height: Utils.getHeight(context) *0.05 ,),

            Image.asset(righticon,scale: 4,),

            SizedBox(height: Utils.getHeight(context) *0.03 ,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: Utils.getWidth(context),
              color: lowwhite,
              child:  Column(
                children: [
                  SizedBox(height: Utils.getHeight(context) *0.025 ,),
                  Image.asset(icLogo,scale: 6,),

                  SizedBox(height: Utils.getHeight(context) *0.025 ,),
                  Text(quotation,style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 0.6),),

                  SizedBox(height: Utils.getHeight(context) *0.006  ,),
                  Text(pleaseCheckYourEmail,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),),

                  SizedBox(height: Utils.getHeight(context) *0.03 ,),
                ],
              ),
            ),

            SizedBox(height: Utils.getHeight(context) *0.05 ,),

            Container(
              child: RichText(textAlign: TextAlign.center,
                text: TextSpan(

                  children: const <TextSpan>[
                    TextSpan(text: youWillReceive, style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo)),
                    TextSpan(text: theQuotation, style: TextStyle(fontWeight: FontWeight.bold,color: blue,),),
                    TextSpan(text: workingDays, style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo)),
                  ],

                ),
              ),
            ),

            SizedBox(height: Utils.getHeight(context) *0.07,),

            InkWell(
              onTap: () {


                navigationService.push(routeCustomBottomNavigationBar);

                // navigationService.push(routeCheckInformationScreen);

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13,horizontal: 50),
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.08), //New
                        blurRadius: 2.0,
                        offset: Offset(-3, 5))
                  ],
                ),
                child: Text(continuee,style: TextStyle(color: white,fontSize: 12),),
              ),
            ),




          ],
        ),
      ),

    );
  }
}
