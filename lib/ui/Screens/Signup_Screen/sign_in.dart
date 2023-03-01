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
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = useState<bool>(false);
    final mobilenoController = useTextEditingController();

    final referController = useTextEditingController();

    return Scaffold(
      body: Container(
        height: Utils.getHeight(context),
        width: Utils.getWidth(context),
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
                height: Utils.getHeight(context) * 0.03,
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
                    controller: mobilenoController,
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

              Gap(14),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      referDialog(context,referController);
                    },
                      child: Container(child: Text("Have A Refer Code?",style: TextStyle(color: blue,fontWeight: FontWeight.w600,fontSize: 15),))),

                  Gap(28),
                ],
              ),

              Gap(14),

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
                  print("refercode------>${referController.text}");

                  if (mobilenoController.text.length == 10) {
                    if (check.value == true) {
                      ReqOtp data = ReqOtp(mobileNo: mobilenoController.text,userType: "Customer",referCode: referController.text);
                      ref
                          .read(authProvider.notifier)
                          .logIn(context: context, data: data).then((value)
                      {
                            if(value?.status == 1){
                              // displayToast("${value?.response?.otp}");

                              setString(prefUserID,"${value?.response?.userId}" );

                              print("key Id-- ${getString(prefUserID)}");

                              navigationService.push(routeOtpVerification, arguments: {
                                navUserId: value?.response?.userId, navUserType : value?.response?.userType });
                            }else{
                              displayToast("${value?.message}");

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



void referDialog(BuildContext context,TextEditingController controller) {
  showDialog(

    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),

          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3.3,
          decoration: const BoxDecoration(
            color: white,
            // borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black ,width: 1),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Icon (Icons.close ,size: 25,)
                  ) ,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only( left: 6,
                    bottom: 2, top: 20, right: 25),
                child: Text(
                  'Refer Code',
                  style: TextStyle(color: black, fontWeight: FontWeight.w400),
                ),
              ),

              Container(

                // margin: EdgeInsets.only(left: 6, right: 6),
                child: Card(
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomTextfeild(
                    textCapitalization: TextCapitalization.none,
                    borderRadius: BorderRadius.circular(10),
                    contentPadding: EdgeInsets.only(left: 6),
                    gradient: LinearGradient(
                      colors: [
                        white,
                        white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    blurRadius: 5.0,
                    offset: Offset(0,0),
                    maxLength: 6,
                    controller: controller,
                    border: InputBorder.none,
                    textInputType: TextInputType.number,
                    hinttext: '',

                  ),
                ),
              ),

              Gap(16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        navigationService.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 9),
                        child:
                        Text("Close", style: TextStyle(color: Colors.blue)),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: blue),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              // spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            )
                          ],

                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  Gap(16),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      title: "Ok",
                      onTap: (){


                        if (controller.text.isNotEmpty)  {

                          if (controller.text.length >= 5) {

                            Navigator.pop(context);


                          }else{

                            displayToast('Enter Valid 6 Digit Refer Code');

                          }




                        }else{
                          displayToast('Enter Refer Code');

                        }

                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    },
  );
}

