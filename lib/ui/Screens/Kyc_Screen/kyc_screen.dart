import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';

import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';

class KYCScreen extends HookConsumerWidget {
  const KYCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: (){
        navigationService.push(routeCustomeBottomNavigationBar);
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          height: Utils.getHeight(context),
          width: Utils.getWidth(context),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(bgcolor),
            scale: 4,
            fit: BoxFit.fill,
          )
          ),

          child: Column(
            children: [

              SizedBox(height: Utils.getHeight(context) *0.05 ,),

              GestureDetector(
                onTap: (){
                 navigationService.push(routeCustomeBottomNavigationBar);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding:  EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_ios,size: 25,color: black,),
                ),
              ),

              SizedBox(height: Utils.getHeight(context) *0.07 ,),

              Text(verifyYour,style: GoogleFonts.bonaNova(
                  textStyle: TextStyle(fontSize: 20,color: black,fontWeight: FontWeight.bold, height: 1.3)),textAlign: TextAlign.center,),

              SizedBox(height: Utils.getHeight(context) *0.01 ,),

              Container(
                height:  Utils.getHeight(context) * 0.0048,
                width: Utils.getWidth(context) * 0.18,
                decoration: BoxDecoration(
                  color: Color(0xfffA9836),

                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              SizedBox(height: Utils.getHeight(context) *0.025 ,),


              Text(letBeginYourKYC,
              style: GoogleFonts.nunitoSans(fontSize: 15,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),

              SizedBox(height: Utils.getHeight(context) *0.065 ,),

              Container(
                child: Image.asset(kycimage,scale: 4,),
              ),

              SizedBox(height: Utils.getHeight(context) *0.02 ,),

              Text(keepTheFollowing,
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),

              SizedBox(height: Utils.getHeight(context) *0.05 ,),

              GestureDetector(
                onTap: () {

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => KYC_Identity()));
                  navigationService.push(routeDigiLockerWebView);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Utils.getWidth(context),
                  padding: EdgeInsets.symmetric(vertical: 13,),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.4), //New
                          blurRadius: 4.0,
                          offset: Offset(-1, 4))
                    ],
                    borderRadius: BorderRadius.circular(18),
                    color: white,
                  ),

                  child: Text(digiLockerKYC,style: TextStyle(color: navyblue,fontWeight: FontWeight.bold,letterSpacing: 0.2),),

                ),
              ),

              SizedBox(height: Utils.getHeight(context) *0.03 ,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Utils.getWidth(context) * 0.07),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: yourDataIs, style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w400,color: black,fontSize: 10)),
                      TextSpan(text: privacyPolicyDot, style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600,
                          color: navyblue,
                          decoration: TextDecoration.underline,fontSize: 10,
                        // height: 2.0,
                        decorationThickness: 2,
                      ),),
                      TextSpan(text: dot, style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w400,color: black,fontSize: 10)),


                    ],
                  ),
                ),
              ),


            ],
          ),

        ),

      ),
    );
  }
}
