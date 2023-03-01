import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/req_send_account_verification.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/start_partners/send_account_verification_view_model.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class StartPartnerWithWeb extends HookConsumerWidget {
  StartPartnerWithWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarWeb(index: 3),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(welcomeSurakshakadi), fit: BoxFit.fill),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      welcomeToSurkshakdi,
                      style: TextStyle(
                          color: white,
                          fontSize: 44,
                          fontFamily: "Nunito Sans",
                          letterSpacing: 1.6,
                          wordSpacing: 1.8,
                          height: 1.4,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      weHaveSentAnActivation,
                      style: TextStyle(
                          color: white,
                          fontSize: 22,
                          fontFamily: "Nunito Sans",
                          height: 1.4,
                          letterSpacing: 1.6,
                          wordSpacing: 1.8,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () async{

                        ReqSendAccountVerification sendVerification = ReqSendAccountVerification(
                          userId: "${getString(prefCPUserID)}"
                        );


                        await ref.read(sendAccountVerificationProvider.notifier)
                            .getSendAccountVerification(context: context, data: sendVerification)
                            .then((value){
                              if(value?.status == 1){
                                displayToast("${value?.message}");
                                navigationService.push(routeAdminDashboard);
                              }else{
                                displayToast("${value?.message}");
                              }
                        } );





                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PartnerWithWeb()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 56, vertical: 8),
                        child: Text(start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500)),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff3C87E0).withOpacity(0.9),
                                Color(0xff0E3563).withOpacity(0.8),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey,
                          //     // spreadRadius: 1,
                          //     blurRadius: 1,
                          //     offset: const Offset(0, 1),
                          //   )
                          // ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomWebBottomBar(bgColor: true),
          ],
        ),
      ),
    );
  }
}
