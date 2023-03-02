import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/res_plan_chatbot.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';


class ConfirmationPlanScreen extends HookConsumerWidget {
  final ResPlanChatBot chatBotData;
  const ConfirmationPlanScreen({Key? key,required this.chatBotData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: CustomAppBar(
          title: 'Confirmation',
          backonTap: () {
            Navigator.pop(context);
          },
        notificationIcon: false,

      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [

            SizedBox(height: Utils.getHeight(context) *0.05 ,),

            Text('Yaay!! Your Subscription Has\nBeen Confirmed',
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
                  Text('${getString(prefPlanTitle)} Plan',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 0.6),),

                  SizedBox(height: Utils.getHeight(context) *0.006  ,),
                  Text('Vaild upto 31st Aug, 2023',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11),),

                  SizedBox(height: Utils.getHeight(context) *0.03 ,),
                ],
              ),
            ),

            SizedBox(height: Utils.getHeight(context) *0.05 ,),

            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => KYC_Screen() ));
              //  navigationService.push(routeKycScreen);
              },
              child: Container(
                child: RichText(textAlign: TextAlign.center,
                  text: TextSpan(

                    children: const <TextSpan>[
                      TextSpan(text: 'Please Proceed Further By Filling By The\n', style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo)),
                      TextSpan(text: '"e-KYC" ', style: TextStyle(fontWeight: FontWeight.bold,color: blue,),),
                      TextSpan(text: 'Details.', style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo)),

                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: Utils.getHeight(context) *0.07,),

            InkWell(
              onTap: () {

                navigationService.push(routeCheckYourInformation,arguments: {navCIChatBotDF: chatBotData});

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
                child: Text('Next',style: TextStyle(color: white,fontSize: 12),),
              ),
            ),




          ],
        ),
      ),

    );
  }
}
