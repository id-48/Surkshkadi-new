import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:surakshakadi/data/model/auth/verify_otp/req_verify_otp.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Signup_Screen/auth_view_model.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

class OTP_Verification extends HookConsumerWidget {
  var userId;
  final String userType;
  // final String referCode ;

  OTP_Verification({Key? key, this.userId, required this.userType ,
    // required this.referCode
  })
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final otpCode = useState<String>("0000");
    OtpFieldController otpController = OtpFieldController();

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgfullcolor), scale: 4, fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: black,
                    )),
              ),
              Center(
                  child: Image.asset(
                icLogo,
                scale: 5,
              )),
              Gap(45),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'OTP - Verification',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  )),
              Gap(50),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter OTP sent to mobile number 8756XXXX78.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  )),
              Gap(45),
              Center(
                child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: white,
                    ),
                    controller: otpController,
                    length: 4,
                    contentPadding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.6,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 7,
                    style: TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      otpCode.value = pin;

                      print("Completed: " + pin);
                    }),
              ),
              Gap(50),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      'Re- Send OTP',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff002E9E)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.045,
              ),
              Gap(60),
              GestureDetector(
                onTap: () {
                  ReqVerifyOtp data = ReqVerifyOtp(
                      userId: userId, otp: otpCode.value, userType: userType);

                  if (otpCode.value.isNotEmpty) {
                    ref
                        .read(authProvider.notifier)
                        .verifyOtp(context: context, data: data)
                        .then((value) {
                          print("enter>>>>>>>>");
                      if (value!.status == 1) {
                        print("enter>>>>>>>>111111");

                        // displayToast("${value.message}");
                        print('Result :  ${value.response}');
                        setString(prefLoginToken, "LoginSuccess");
                        setString(prefLoginNumber, "${value.response.mobile}");
                        navigationService.pushAndRemoveUntil(routeCustomBottomNavigationBar, arguments: {navIndex: 0});
                      } else {
                        print("enter>>>>>>>> 22222");

                        displayToast("${value.message}");
                      }
                    });
                  } else {
                    displayToast('Enter Otp');
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Custom_BottomNavigationBar()));
                },
                child: Center(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 105),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(30),
                          ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Color(0xff002E9E),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
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
