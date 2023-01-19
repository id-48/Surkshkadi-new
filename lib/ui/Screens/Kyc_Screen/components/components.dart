import 'package:flutter/Material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/result.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/verify_documents_view_modal.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DigiLockerWebView extends StatefulWidget {
  const DigiLockerWebView({Key? key}) : super(key: key);

  @override
  State<DigiLockerWebView> createState() => _DigiLockerWebViewState();
}

class _DigiLockerWebViewState extends State<DigiLockerWebView> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: (){
          navigationService.push(routeKycIdentiyScreen);
          return Future.value(false);
        },
        child: HookConsumer(
          builder: (context,ref,child) {
            return WebView(
              initialUrl:
                  // "https://api.emptra.com/authDigilockerSurakShakadi?clientId={{clientId}}"
                  "https://api.emptra.com/authDigilockerSurakShakadi?clientId=fbf553465fb9232656575991860034cb:34aecfab496b827aa4633f7d0f9330be",
              // "fbf553465fb9232656575991860034cb:34aecfab496b827aa4633f7d0f9330be",
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },



              onPageFinished: (returnedURL)async {
                print(" ${returnedURL.toString()}");
                // print("erturnedURL [4]${returnedURL.toString().split("/")[4]}");
                if (returnedURL.toString().split("/")[3] == "digilocker-response") {
                  setString(prefAadharToken, returnedURL.toString().split("/")[4]);
                  print("Aadhar Token-----${getString(prefAadharToken)}");
                  await ref.read(digilockerAadharProvider.notifier).digilockerAadhar(context: context).then((value) {
                    print("Yash Patel");
                    // if(value?.code == 100){
                      print("Yashu Patel 1111");
                      navigationService.pushAndRemoveUntil(routeKYCChatBotMobile);


                      displayToast("Your Aadhar Card Successful Verify");
                    // }else{
                      print("Yash Patel  333333333333");
                    //
                    // }
                  });
                }
              },
              //   /// 8264683525    - 4223 6418 3120

              onWebResourceError: (error) {
                print("error------>>>${error}");
                navigationService.push(routeKycIdentiyScreen);
              },
              javascriptMode: JavascriptMode.unrestricted,
            );
          }
        ),
      ),
    );
  }
}
