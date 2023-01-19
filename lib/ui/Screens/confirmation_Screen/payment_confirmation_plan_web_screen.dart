import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/check_your_information_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class PaymentConfirPlanWeb extends HookConsumerWidget {
  const PaymentConfirPlanWeb({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LogoBackButton(),

            Gap(20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).orientation == Orientation.landscape ? 350 : 15,
                ),
                Text(paymentConfi,style: GoogleFonts.bonaNova (textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),),
              ],
            ),

            Gap(30),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).orientation == Orientation.landscape ? 350 : 15,
                ),
                Text(yaayYourSub,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              ],
            ),

            Gap(50),

            Image.asset(righticon,scale: 3,),

            Gap(60),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).orientation == Orientation.landscape ? Utils.getWidth(context) * 0.55 : Utils.getWidth(context),
              color: lowwhite,
              child:  Column(
                children: [
                  Gap(20),
                  Image.asset(icLogoS,scale: 4,),
                  Gap(20),
                  Text(goldPlan,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,letterSpacing: 0.6),),
                  Gap(20),
                  Text(vaildUpto,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  Gap(30),
                ],
              ),
            ),

            Gap(80),

            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).orientation == Orientation.landscape ? 350 : 15,
                ),

                RichText(
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(text: 'Please Proceed Further By Filling By The ', style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo,fontSize: 18)),
                      TextSpan(text: '"E- Kyc" ', style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 18),),
                      TextSpan(text: 'Details.', style: TextStyle(fontWeight: FontWeight.w400,color: deepindigo,fontSize: 18)),

                    ],
                  ),
                ),
              ],
            ),

            Gap(80),

            GestureDetector(
              onTap: (){
                    navigationService.push(routeCheckYourInfoWeb);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                child:
                Text(continuee, style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),
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
                      color: Colors.grey,
                      // spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    )
                  ],

                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Gap(60),

            CustomWebBottomBar(bgColor: true,),
          ],
        ),
      ),
    );
  }
}
