import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/auth/otp/req_otp.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Signup_Screen/auth_view_model.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

class Sign_in extends HookConsumerWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = useState<bool>(false);
    final mobilenocontroller = useTextEditingController();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgfullcolor), scale: 4, fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(100),

              Center(
                  child: Image.asset(
                icLogo,
                scale: 4.8,
              )),

              SizedBox(
                height: h * 0.03,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Register Yourself ',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  )),

              Gap(40),

              Padding(
                padding: const EdgeInsets.only(
                    left: 40, bottom: 2, top: 20, right: 25),
                child: Text(
                  'Mobile No.',
                  style: TextStyle(color: black, fontWeight: FontWeight.w400),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 35, right: 25),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomTextfeild(
                    textCapitalization: TextCapitalization.none,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        multicolorone,
                        multicolortwo,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    blurRadius: 5.0,
                    offset: Offset(-3, 4),
                    maxLength: 10,
                    controller: mobilenocontroller,
                    border: InputBorder.none,
                    textInputType: TextInputType.number,
                    hinttext: '8756XXXX78',
                    prefix: Image.asset(
                      callicon,
                      scale: 3.5,
                    ),
                  ),
                ),
              ),

              Gap(40),

              Container(
                padding: EdgeInsets.only(left: 40, right: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        check.value = !check.value;
                      },
                      child: Container(
                        height: 19,
                        width: 20,
                        decoration: BoxDecoration(
                          color: check.value == true ? blue : white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54, //New
                                blurRadius: 2.0,
                                offset: Offset(0, 3))
                          ],
                        ),
                        child: Icon(
                          Icons.check,
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                    Gap(8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'I agree to Surakshakadi',
                                style: TextStyle(fontSize: 11, color: black)),
                            TextSpan(
                                text: ' Terms and Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: black)),
                            TextSpan(
                                text: ' and',
                                style: TextStyle(fontSize: 11, color: black)),
                            TextSpan(
                                text: ' Privacy Policy.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: black)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Gap(80),
              GestureDetector(
                onTap: () {
                  //   ?
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => OTP_Verification()));
                  //     :null;

                  if (mobilenocontroller.text.length == 10) {
                    if (check.value == true) {
                      ReqOtp data = ReqOtp(mobileNo: mobilenocontroller.text,userType: "Customer");
                      ref
                          .read(authProvider.notifier)
                          .logIn(context: context, data: data).then((value)
                      {
                            if(value!.status == 1){
                              displayToast("${value.response?.otp}");

                              setString(prefUserID,"${value.response?.userId}" );

                              print("key Id-- ${getString(prefUserID)}");

                              navigationService.push(routeOtpVerification, arguments: {
                                navUserId: value.response?.userId, navUserType : value.response?.userType});
                            }else{
                              displayToast("${value.message}");

                            }
                      });
                    } else {
                      displayToast('Accept Privacy Policy');
                    }
                  } else {
                    displayToast('Enter Mobile No');
                  }
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
                      decoration: BoxDecoration(),
                      child: Text(
                        continuee,
                        style: TextStyle(
                            color: buttonColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: h*0.04,),
            ],
          ),
        ),
      ),
    );
  }
}
