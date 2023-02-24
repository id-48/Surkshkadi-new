import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/kyc_chatbot_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_web_screen.dart';
import 'package:surakshakadi/ui/Screens/record_video_screen/record_a_video_screen.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/beneficiary_screen.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/will_review_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/extensions/size_extension.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    useEffect(
      () {
        final timer = Timer(const Duration(seconds: 2), () async {

          if (context.isMobile) {
            // print("Aadhar token ${getString(prefUserID)}");
            if (getString(prefLoginToken).isNotEmpty) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Beneficiary() ));
                  // MaterialPageRoute(builder: (context) => RecordAVideo(videoRecord: false ) ));

              navigationService.pushAndRemoveUntil(routeCustomBottomNavigationBar);
              // navigationService.pushAndRemoveUntil(routeBeneficiary);
            } else {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => WillReview() ));

              navigationService.pushAndRemoveUntil(routeCommonepagee);

            }
          } else {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PlanChatBotWeb(),));
            // navigationService.pushAndRemoveUntil(routePlanChatBotWeb);

            navigationService.pushAndRemoveUntil(routeDashboardWeb);

          }
        });
        return timer.cancel;
      }, [],
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
