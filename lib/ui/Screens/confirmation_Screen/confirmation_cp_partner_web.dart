import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';

import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';

import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';

import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class CPPartnerConfirmationWeb extends HookConsumerWidget {
  const CPPartnerConfirmationWeb({Key? key,}) : super(key: key);

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
                Text(confirmation ,style: GoogleFonts.bonaNova (textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),),
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

            Center(
              child: Text(otpVeSuc,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
            ),

            Gap(80),

            GestureDetector(
              onTap: (){
                navigationService.push(routeStartPartnerWithWeb);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));

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
