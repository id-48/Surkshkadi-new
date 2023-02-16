import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Demo_Screen/demo_plans_screen.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/legal_screen.dart';
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

          // ref.read(stateProvider.notifier).getState(context: context).then((value) {
          //   print("Yashu Patel");
          //   if (value!.status == 1) {
          //     print("Yashu Patel111111");
          //     for (int i = 0; i < value.response.states.length; i++) {
          //       print("Yashu Patel22222");
          //       stateList.add(value.response.states[i].name);
          //     }
          //   } else {
          //     displayToast("${value.message}");
          //   }
          // });

          print('Enter ===>');
          print(
              'Enter width ===> ${MediaQuery.of(context).size.width}'); // my-1536 , ccit06-1920
          print(
              'Enter Height ===> ${MediaQuery.of(context).size.height}'); // my-745  , ccit06-969

          if (context.isMobile) {
            print("Aadhar token ${getString(prefUserID)}");
            if (getString(prefLoginToken).isNotEmpty) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PlanChatBotWeb() ));
              navigationService
                  .pushAndRemoveUntil(routeCustomBottomNavigationBar);
            } else {

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Sign_in()));
              navigationService.pushAndRemoveUntil(routeCommonepagee);
            }
          } else {

            Navigator.push(context, MaterialPageRoute(builder: (context) => LegalAll(),));
            // navigationService.pushAndRemoveUntil(routePlanChatBotWeb);

            // navigationService.pushAndRemoveUntil(routeDashboardWeb);
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
