import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/kyc_identity_screen.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/kyc_chatbot_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/will_review_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/extensions/size_extension.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    useEffect(
      () {
        final timer = Timer(const Duration(seconds: 2), () async {
          print('Enter ===>');
          print('Enter width ===> ${MediaQuery.of(context).size.width}');     // my-1536 , ccit06-1920
          print('Enter Height ===> ${MediaQuery.of(context).size.height}');   // my-745  , ccit06-969

          if (context.isMobile) {
            print("Aadhar token ${getString(prefUserID)}");
            if (getString(prefLoginToken).isNotEmpty) {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => WillReview()));
              navigationService
                  .pushAndRemoveUntil(routeCustomeBottomNavigationBar);
            } else {
              navigationService.push(routeCommonepagee);
            }
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashBoardWeb()));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          }
        });
        return timer.cancel;
      },
      [],
    );

    return Material(
      color: white,
      child: SafeArea(
        child: Center(
          child: Image.asset(
            icLogo,
            scale: context.isMobile ? 5 : 3.5,
          ),
          // child: Logo(),
        ),
      ),
    );
  }
}
