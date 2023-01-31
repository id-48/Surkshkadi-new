import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/req_submit_kyc.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_no/req_aadhar_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_otp/req_aadhar_otp.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_pancard_no/req_pancard_no.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/submit_kyc_view_modal.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/verify_documents_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

class KYCIdentity extends HookConsumerWidget {
  const KYCIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOtp = useState<bool>(false);
    final aadharClientId = useState<String>("");


    final aadharFrontType = useState<String>("");
    final aadharBackType = useState<String>("");
    final panFrontType = useState<String>("");
    final selfieType = useState<String>("");
    final isAadhar = useState<bool>(false);
    final isPanCard = useState<bool>(false);
    ImagePicker _picker = ImagePicker();

    final aadharcardnocontroller = useTextEditingController();
    final aadharOtpController = useTextEditingController();
    final pancardnocontroller = useTextEditingController();



    XFile? aadharImage;
    final aadharPickedImage = useState<File>(File(""));
    final isAadharPicked = useState<bool>(false);

    XFile? panImage;
    final panPickedImage = useState<File>(File(""));
    final isPanPicked = useState<bool>(false);

    XFile? aadharBackImage;
    final aadharBackPickedImage = useState<File>(File(""));
    final isAadharBackPicked = useState<bool>(false);

    XFile? selfieImage;
    final selfiePickedImage = useState<File>(File(""));
    final isSelfiePicked = useState<bool>(false);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return WillPopScope(
        onWillPop: (){
          navigationService.push(routeKycScreen);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: eKYC,
            backonTap: () {
              navigationService.push(routeKycScreen);
            },
            notionTap: () {},
          ),
          body: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    completeYour,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: Utils.getHeight(context) * 0.01,
                  ),

                  Text(
                    inOrderToComplete,
                    style: TextStyle(color: blue, fontSize: 12.5),
                  ),

                  SizedBox(
                    height: Utils.getHeight(context) * 0.02,
                  ),

                  /// DigiLocker

                  // isDigiLocker.value == true
                  //     ? Container(
                  //   height: 140,
                  //   child: Custom_Dottedborder(
                  //     padding: EdgeInsets.only(
                  //         left: 10, top: 10, right: 15, bottom: 10),
                  //     child: Container(
                  //       width: Utils.getWidth(context),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             addYourDigiLocker,
                  //             style: TextStyle(
                  //                 fontSize: 13,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: blue),
                  //           ),
                  //           Gap(18),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Text(
                  //                 digiLockerrr,
                  //                 style: TextStyle(
                  //                     color: black,
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16),
                  //               ),
                  //
                  //
                  //
                  //               Column(
                  //                 children: [
                  //                   CustomButton(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 8, horizontal: 28),
                  //                     onTap:
                  //                     // getString(prefAadharToken) == "" ?
                  //                         () async{
                  //                       // if (getString(prefAadharToken) != "") {
                  //                       //   await ref
                  //                       //       .read(digilockerAadharProvider.notifier)
                  //                       //       .digilockerAadhar(context: context)
                  //                       //       .then((value) {
                  //                       //     if (value?.code == 100) {
                  //                       //       navigationService
                  //                       //           .push(routeKycIdentiyScreen);
                  //                       //     } else {
                  //                       //       print("Aadhar verification failed");
                  //                       //     }
                  //                       //   });
                  //                       // } else {
                  //
                  //                           ///
                  //                       // Navigator.push(
                  //                       //     context,
                  //                       //     MaterialPageRoute(
                  //                       //         builder: (context) =>
                  //                       //             DigiLockerWebView()));
                  //                       ///
                  //
                  //                       // }
                  //                     },
                  //                     // : (){
                  //                     //   displayToast("Your Aadhar Card Successful Verify");
                  //                     //
                  //                     // },
                  //                     title: verify,
                  //                   ),
                  //                   Gap(14),
                  //                   GestureDetector(
                  //                     onTap: (){
                  //                       isDigiLocker.value = false;
                  //                     },
                  //                     child: Container(
                  //                       padding: EdgeInsets.symmetric(
                  //                           vertical: 6, horizontal: 30),
                  //                       child:
                  //                       Text("Skip", style: TextStyle(color: blue)),
                  //                       decoration: BoxDecoration(
                  //                         color: white,
                  //                         border: Border.all(color: blue),
                  //                         boxShadow: [
                  //                           BoxShadow(
                  //                             color: Colors.grey,
                  //                             // spreadRadius: 1,
                  //                             blurRadius: 1,
                  //                             offset: const Offset(0, 1),
                  //                           )
                  //                         ],
                  //
                  //                         borderRadius: BorderRadius.circular(15),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                  //     : Container(),


                  ///  Aadhar card No

              Container(
                // height: 315,
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(
                      left: 10, top: 10, right: 15,bottom: 10),
                  child: Container(
                    width: Utils.getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          shareYourAadhar,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: blue),
                        ),
                        Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 11,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(bottom: 5, top: 8,left: 3),
                                      child: Text(
                                        aadharCard,
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      child: CustomTextfeild(
                                        enabled: isOtp.value == true  ? false : true,
                                        height: 36,
                                        textCapitalization:
                                        TextCapitalization.none,
                                        blurRadius: 0.0,
                                        offset: Offset(0, 0),
                                        containercolor: white,
                                        containerborder:
                                        Border.all(color: bordercolor),
                                        contentPadding: EdgeInsets.only(
                                            left: 5.0,
                                            top: 0.0,
                                            bottom: 12.0,
                                            right: 5.0),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        controller: aadharcardnocontroller,
                                        border: InputBorder.none,
                                        maxLength: 12,
                                        textInputType: TextInputType.number,
                                        // hinttext: 'Enter your username',
                                      ),
                                    ),
                                    // Gap( isAadhar.value == true ? 6 : 12),

                                    if(isAadhar.value == false) ...[
                                      Gap( 12),
                                      CustomButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                        onTap: isOtp.value == true
                                            ? () {}
                                            : () async {
                                          if (aadharcardnocontroller
                                              .text.isNotEmpty) {
                                            ReqAadharNo aadharCardNo =
                                            ReqAadharNo(
                                                aadhaarNumber:
                                                aadharcardnocontroller
                                                    .text);

                                            ref
                                                .read(aadharNoProvider
                                                .notifier)
                                                .getAadharNo(
                                              context: context,
                                              data: aadharCardNo,
                                            )
                                                .then((value) {
                                              if (value!.result!
                                                  .statusCode ==
                                                  200) {
                                                displayToast(
                                                    "OTP Sent."); //OTP Sent.

                                                print(
                                                    "Your Pan Card Verify");
                                                print(
                                                    "Your Name --->> ${value.toJson()}");
                                                print(
                                                    "Your Name --->> ${value.result!.message}");
                                                aadharClientId.value =
                                                "${value.result!.data!.clientId}";
                                                isOtp.value = true;
                                              } else {
                                                displayToast(
                                                    "Enter Valid Aadhar Card Number");
                                              }
                                            });
                                          } else {
                                            displayToast(
                                                "Please Enter Your Aadhar Card No.");
                                          }
                                        },
                                        title: sendOtp,
                                      ),
                                      Gap(10),
                                    ],

                                    if (isOtp.value == true) ...[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 5, top: 10,left: 3),
                                        child: Text(
                                          enterOtp,
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        child: CustomTextfeild(
                                          enabled: isAadhar.value == true
                                              ? false
                                              : true,
                                          height: 36,
                                          textCapitalization:
                                          TextCapitalization.none,
                                          blurRadius: 0.0,
                                          offset: Offset(0, 0),
                                          maxLength: 6,
                                          containercolor: white,
                                          containerborder:
                                          Border.all(color: bordercolor),
                                          contentPadding: EdgeInsets.only(
                                              left: 5.0,
                                              top: 0.0,
                                              bottom: 12.0,
                                              right: 5.0),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          controller: aadharOtpController,
                                          border: InputBorder.none,
                                          textInputType: TextInputType.number,
                                          // hinttext: 'Enter your username',
                                        ),
                                      ),
                                      Gap(isAadhar.value == true ? 8 : 12),
                                      isAadhar.value == true ? Row(
                                        children: [
                                          Gap(2),
                                          Container(
                                              height: 16,
                                              width: 16,
                                              child: Image.asset(verifiedIcon,color: pista,)),

                                          Gap(4),

                                          Text(verified,style: TextStyle(fontSize: 12,color: pista,),),
                                        ],
                                      ) : Container(),
                                      isAadhar.value == true ?  Container() : CustomButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                        onTap: isAadhar.value == true
                                            ? () {}
                                            : () async {
                                          if (aadharOtpController
                                              .text.isNotEmpty) {
                                            ReqAadharOtp aadharCardOtp =
                                            ReqAadharOtp(
                                                otp:
                                                aadharOtpController
                                                    .text,
                                                clientId:
                                                aadharClientId
                                                    .value);

                                            ///          422364183120
                                            await ref
                                                .read(aadharOtpProvider
                                                .notifier)
                                                .getAadharOtp(
                                              context: context,
                                              data: aadharCardOtp,
                                            )
                                                .then((value) {
                                              if (value!.result.statusCode == 200) {
                                                isAadhar.value = true;

                                                // print("image --->> ${value.result.data.profileImage}");

                                                displayToast(
                                                    "Your Aadhar Card Verify");
                                                print(
                                                    "Your Pan Card Verify");
                                                print(
                                                    "Your Name --->> ${value.toJson()}");
                                              } else {
                                                displayToast(
                                                    "Enter Your Right OTP");
                                              }
                                            });
                                          } else {
                                            displayToast(
                                                "Please Enter Your Aadhar OTP");
                                          }
                                        },
                                        title: verify,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            Gap(15),
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      print(
                                          '------------->>>>>>>>>>>>>>>>>.image ');
                                      aadharImage = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      print('image path 216${aadharImage}');
                                      if (aadharImage != null) {
                                        aadharPickedImage.value =
                                            File(aadharImage!.path);
                                        print(
                                            ' ------------------------- image path 200 --------------------------->>>>>>>${aadharPickedImage}');

                                        aadharFrontType.value = "data:image/" + '${aadharPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";

                                        print("front type --- >>>> ${aadharFrontType.value}");

                                        isAadharPicked.value = true;
                                      }
                                    },
                                    child: Container(
                                      height: Utils.getHeight(context) * 0.11,

                                      width: double.infinity,
                                      // margin: EdgeInsets.only(top: 10),
                                      child: isAadharPicked.value  == true
                                          ? Image.file(
                                        aadharPickedImage.value,
                                        fit: BoxFit.fill,
                                      )
                                          : Image.asset(
                                        kycuploadimage,
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    uploadAadharFront,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                        color: lightGrey),
                                  ),
                                  Gap(6),
                                  GestureDetector(
                                    onTap: () async {
                                      print(
                                          '------------->>>>>>>>>>>>>>>>>.image ');
                                      aadharBackImage = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      print('image path 216${aadharBackImage}');
                                      if (aadharBackImage != null) {
                                        aadharBackPickedImage.value =
                                            File(aadharBackImage!.path);
                                        print(
                                            ' ------------------------- image path 200 --------------------------->>>>>>>${aadharBackPickedImage}');

                                        aadharBackType.value = "data:image/" + '${aadharBackPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";

                                        print("aadhar type --->> ${aadharBackType.value}");
                                        isAadharBackPicked.value = true;
                                      }
                                    },
                                    child: Container(
                                      height: Utils.getHeight(context) * 0.11,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 10),
                                      child: isAadharBackPicked.value == true
                                          ? Image.file(
                                        aadharBackPickedImage.value,
                                        fit: BoxFit.fill,
                                      )
                                          : Image.asset(
                                        kycuploadimage,
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    uploadAadharBack,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                        color: lightGrey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: Utils.getHeight(context) * 0.02,
              ),

              /// Pan Card

              Container(
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(
                      left: 10, top: 10, right: 15, bottom: 10),
                  child: Container(
                    width: Utils.getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pleaseAddYourPan,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: blue),
                        ),
                        Gap(14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 11,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(bottom: 5, top: 8),
                                    child: Text(
                                      panCard,
                                      style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    child: CustomTextfeild(
                                      enabled: isPanCard.value == true
                                          ? false
                                          : true,
                                      height: 36,
                                      textCapitalization: TextCapitalization.characters,
                                      blurRadius: 0.0,
                                      offset: Offset(0, 0),
                                      containercolor: white,
                                      containerborder:
                                      Border.all(color: bordercolor),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.0,
                                          top: 0.0,
                                          bottom: 12.0,
                                          right: 5.0),
                                      borderRadius: BorderRadius.circular(10),
                                      controller: pancardnocontroller,
                                      border: InputBorder.none,
                                      textInputType: TextInputType.text,
                                      textInputFormatter: [],
                                      // hinttext: 'Enter your username',
                                    ),
                                  ),
                                  Gap( isPanCard.value == true ? 8 : 20),

                                  isPanCard.value == true ? Row(
                                    children: [
                                      Gap(2),
                                      Container(
                                        height: 16,
                                          width: 16,
                                          child: Image.asset(verifiedIcon,color: pista,)),

                                      Gap(4),

                                      Text(verified,style: TextStyle(fontSize: 12,color: pista,),),
                                    ],
                                  ) : Container(),

                                  isPanCard.value == true ? Container() : CustomButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    onTap: isPanCard.value == true
                                        ? () {}
                                        : () async {
                                      print('Yashu');
                                      print(
                                          'Yashu Num ----- ${pancardnocontroller.text.toUpperCase()}');
                                      if (pancardnocontroller
                                          .text.isNotEmpty) {
                                        ReqPancardNo panCardData =
                                        ReqPancardNo(
                                            pan: pancardnocontroller
                                                .text
                                                .toUpperCase());

                                        await ref
                                            .read(panCardNoProvider
                                            .notifier)
                                            .getPanCard(
                                          context: context,
                                          data: panCardData,
                                        )
                                            .then((value) {
                                          /// bmfpc0772f test number
                                          if (value!.result.essentials
                                              .number.isNotEmpty) {
                                            displayToast(
                                                "Your Pan Card Verify Success");
                                            isPanCard.value = true;
                                          } else {
                                            displayToast(
                                                "Your Pan Card Detail Wrong");
                                          }
                                        });
                                      } else {
                                        displayToast(
                                            "Please Enter Your Pan Card No.");
                                      }
                                    },
                                    title: verify,
                                  ),
                                ],
                              ),
                            ),
                            Gap(15),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      print(
                                          '------------->>>>>>>>>>>>>>>>>.image ');
                                      panImage = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      print('image path 216${panImage}');
                                      if (panImage != null) {
                                        panPickedImage.value = File(panImage!.path);
                                        print(' ------------------------- image path 200 --------------------------->>>>>>>${panPickedImage}');
                                        print('runtime type --->>  ${panPickedImage.value.runtimeType}');
                                        print('absolute  ------>>>>' '${panPickedImage.value.absolute}'.split('.')[3].replaceAll("'", ""));

                                        panFrontType.value = "data:image/" + '${panPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";


                                        print('frontType  --->> ${panFrontType}');
                                        isPanPicked.value = true;
                                      }
                                    },
                                    child: Container(
                                      height: Utils.getHeight(context) * 0.11,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 10),
                                      child: isPanPicked.value == true
                                          ? Image.file(
                                        panPickedImage.value,
                                        fit: BoxFit.fill,
                                      )
                                          : Image.asset(
                                        kycuploadimage,
                                        scale: 4,
                                      ),
                                    ),
                                  ),

                                  Gap(6),
                                  Center(
                                    child: Text(
                                      uploadPan,
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: lightGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: Utils.getHeight(context) * 0.025,
              ),

              ///  Api - not remove Comment code ---
              // ///   Bank details
              //
              // Container(
              //   height: 230,
              //   child: Custom_Dottedborder(
              //     padding: EdgeInsets.only(
              //         left: 10, top: 10, right: 15, bottom: 10),
              //     child: Container(
              //       width: Utils.getWidth(context),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             pleaseAddYourBank,
              //             style: TextStyle(
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w600,
              //                 color: blue),
              //           ),
              //           Gap(16),
              //           Padding(
              //             padding: EdgeInsets.only(
              //               bottom: 5,
              //             ),
              //             child: Text(
              //               accountNo,
              //               style: TextStyle(
              //                   color: black,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 12),
              //             ),
              //           ),
              //           Container(
              //             child: CustomTextfeild(
              //               enabled: isBank.value == true ? false : true,
              //               height: 36,
              //               textCapitalization: TextCapitalization.none,
              //               blurRadius: 0.0,
              //               offset: Offset(0, 0),
              //               containercolor: white,
              //               containerborder: Border.all(color: bordercolor),
              //               contentPadding: EdgeInsets.only(
              //                   left: 5.0,
              //                   top: 0.0,
              //                   bottom: 12.0,
              //                   right: 5.0),
              //               borderRadius: BorderRadius.circular(10),
              //               controller: bankACNoController,
              //               border: InputBorder.none,
              //               textInputType: TextInputType.number,
              //               // hinttext: 'Enter your username',
              //             ),
              //           ),
              //           Gap(16),
              //           Padding(
              //             padding: EdgeInsets.only(
              //               bottom: 5,
              //             ),
              //             child: Text(
              //               ifscCode,
              //               style: TextStyle(
              //                   color: black,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 12),
              //             ),
              //           ),
              //           Container(
              //             child: CustomTextfeild(
              //               enabled: isBank.value == true ? false : true,
              //               height: 36,
              //               textCapitalization: TextCapitalization.none,
              //               blurRadius: 0.0,
              //               offset: Offset(0, 0),
              //               containercolor: white,
              //               containerborder: Border.all(color: bordercolor),
              //               contentPadding: EdgeInsets.only(
              //                   left: 5.0,
              //                   top: 0.0,
              //                   bottom: 12.0,
              //                   right: 5.0),
              //               borderRadius: BorderRadius.circular(10),
              //               controller: bankIFSCCodeController,
              //               border: InputBorder.none,
              //               textInputType: TextInputType.text,
              //               // hinttext: 'Enter your username',
              //             ),
              //           ),
              //           Gap(16),
              //           CustomButton(
              //             padding: EdgeInsets.symmetric(
              //                 vertical: 6, horizontal: 12),
              //             onTap: isBank.value == true
              //                 ? () {}
              //                 : () {
              //               if (bankACNoController.text.isNotEmpty &&
              //                   bankIFSCCodeController
              //                       .text.isNotEmpty) {
              //                 ReqBankAc bankData = ReqBankAc(
              //                     accountNumber:
              //                     bankACNoController.text,
              //                     ifsc: bankIFSCCodeController.text
              //                         .toUpperCase(),
              //                     ifscDetails: true);
              //
              //                 print("Yash");
              //                 ref
              //                     .read(bankAcProvider.notifier)
              //                     .getBankAC(
              //                   context: context,
              //                   data: bankData,
              //                 )
              //                     .then((value) {
              //                   print("Yashu");
              //                   if (value!.result.success == true) {
              //                     print("Yashu Patel");
              //                     isBank.value = true;
              //                     displayToast(
              //                         "Your Bank Detail is Success Fully Verify");
              //                   } else {
              //                     displayToast(
              //                         "Your Bank Detail is False");
              //                   }
              //                 });
              //               } else {
              //                 displayToast(
              //                     "Please Enter Your Bank Detail");
              //               }
              //             },
              //             title: verify,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   height: Utils.getHeight(context) * 0.02,
              // ),
              //
              // /// vehicle RC RTO
              //
              // Container(
              //   height: 230,
              //   child: Custom_Dottedborder(
              //     padding: EdgeInsets.only(
              //         left: 10, top: 10, right: 15, bottom: 10),
              //     child: Container(
              //       width: Utils.getWidth(context),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             pleaseAddYourVehicle,
              //             style: TextStyle(
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w600,
              //                 color: blue),
              //           ),
              //           Gap(16),
              //           Padding(
              //             padding: EdgeInsets.only(
              //               bottom: 5,
              //             ),
              //             child: Text(
              //               vehicleN,
              //               style: TextStyle(
              //                   color: black,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 12),
              //             ),
              //           ),
              //           Container(
              //             child: CustomTextfeild(
              //               enabled: isVehicle.value == true ? false : true,
              //               textCapitalization: TextCapitalization.characters,
              //               height: 36,
              //               blurRadius: 0.0,
              //               offset: Offset(0, 0),
              //               containercolor: white,
              //               containerborder: Border.all(color: bordercolor),
              //               contentPadding: EdgeInsets.only(
              //                   left: 5.0,
              //                   top: 0.0,
              //                   bottom: 12.0,
              //                   right: 5.0),
              //               borderRadius: BorderRadius.circular(10),
              //               controller: vehicleNoController,
              //               border: InputBorder.none,
              //               textInputType: TextInputType.text,
              //               // hinttext: 'Enter your username',
              //             ),
              //           ),
              //           Gap(16),
              //           CustomButton(
              //             padding: EdgeInsets.symmetric(
              //                 vertical: 6, horizontal: 12),
              //             onTap: isVehicle.value == true
              //                 ? () {}
              //                 : () {
              //               if (vehicleNoController.text.isNotEmpty) {
              //                 ReqVehicleNo vehicleData = ReqVehicleNo(
              //                   blacklistCheck: true,
              //                   vehicleNumber: vehicleNoController.text
              //                       .toUpperCase(),
              //                 );
              //
              //                 print("Yash");
              //                 ref
              //                     .read(vehicleNoProvider.notifier)
              //                     .getVehicleNo(
              //                   context: context,
              //                   data: vehicleData,
              //                 )
              //                     .then((value) {
              //                   print("Yashu");
              //                   if (value!.code.isNotEmpty) {
              //                     print("Yashu Patel");
              //                     isVehicle.value = true;
              //                     displayToast(
              //                         "Your Vehicle Detail is Success Fully Verify");
              //                   } else {
              //                     displayToast(
              //                         "Your Bank Detail is False");
              //                   }
              //                 });
              //               } else {
              //                 displayToast(
              //                     "Please Enter Your Bank Detail");
              //               }
              //             },
              //             title: verify,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   height: Utils.getHeight(context) * 0.02,
              // ),
              //
              // /// GSTIn Nomber  -- test number---- 24BMFPC0772F1ZJ
              //
              // Container(
              //   height: 230,
              //   child: Custom_Dottedborder(
              //     padding: EdgeInsets.only(
              //         left: 10, top: 10, right: 15, bottom: 10),
              //     child: Container(
              //       width: Utils.getWidth(context),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             pleaseAddYourGSTNo,
              //             style: TextStyle(
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w600,
              //                 color: blue),
              //           ),
              //           Gap(16),
              //           Padding(
              //             padding: EdgeInsets.only(
              //               bottom: 5,
              //             ),
              //             child: Text(
              //               GSTNo,
              //               style: TextStyle(
              //                   color: black,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 12),
              //             ),
              //           ),
              //           Container(
              //             child: CustomTextfeild(
              //               enabled: isGST.value == true ? false : true,
              //               textCapitalization: TextCapitalization.characters,
              //               height: 36,
              //               blurRadius: 0.0,
              //               offset: Offset(0, 0),
              //               containercolor: white,
              //               containerborder: Border.all(color: bordercolor),
              //               contentPadding: EdgeInsets.only(
              //                   left: 5.0,
              //                   top: 0.0,
              //                   bottom: 12.0,
              //                   right: 5.0),
              //               borderRadius: BorderRadius.circular(10),
              //               controller: GSTNoController,
              //               border: InputBorder.none,
              //               textInputType: TextInputType.text,
              //               // hinttext: 'Enter your username',
              //             ),
              //           ),
              //           Gap(16),
              //           CustomButton(
              //             padding: EdgeInsets.symmetric(
              //                 vertical: 6, horizontal: 12),
              //             onTap: isGST.value == true
              //                 ? () {}
              //                 : () async {
              //               if (GSTNoController.text.isNotEmpty) {
              //                 ReqGstNo gstData = ReqGstNo(
              //                     gstin: GSTNoController.text
              //                         .toUpperCase());
              //
              //                 print("Yash");
              //                 await ref
              //                     .read(gstNoProvider.notifier)
              //                     .getGSTNo(
              //                   context: context,
              //                   data: gstData,
              //                 )
              //                     .then((value) {
              //                   print("Yashu");
              //                   if (value!.result.task.isNotEmpty) {
              //                     print("Yashu Patel");
              //                     isGST.value = true;
              //                     displayToast(
              //                         "Your GST Number is Success Fully Verify");
              //                   } else {
              //                     displayToast(
              //                         "Your Bank Detail is False");
              //                   }
              //                 });
              //               } else {
              //                 displayToast(
              //                     "Please Enter Your GST Number");
              //               }
              //             },
              //             title: verify,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   height: Utils.getHeight(context) * 0.025,
              // ),
              //
              // Text(
              //   'A selfie with your identity',
              //   style: TextStyle(
              //       fontWeight: FontWeight.w500, color: blue, fontSize: 14.5),
              // ),
              ///  Api - not remove Comment code ---


              Text(
                pleaseTakeYour,
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: blue, fontSize: 12),
              ),

              SizedBox(
                height: Utils.getHeight(context) * 0.02 ,
              ),

              ///  Selfie

              Container(
                height: 180,
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                          child: Container(
                            height: 120,
                            width: Utils.getWidth(context) * 0.42,
                            child: GestureDetector(
                              onTap: () async {
                                print(
                                    '------------->>>>>>>>>>>>>>>>>.image ');
                                selfieImage = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                print('image path 216${selfieImage}');
                                if (selfieImage != null) {
                                  selfiePickedImage.value =
                                      File(selfieImage!.path);
                                  print(
                                      'image path 200 ---->>>>>>>${selfiePickedImage}');

                                  selfieType.value = "data:image/" + '${selfiePickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";

                                  print("type selfie --- >>> ${selfieType.value}");


                                  isSelfiePicked.value = true;
                                }
                              },
                              child: Container(
                                child: isSelfiePicked.value == true
                                    ? Image.file(
                                  selfiePickedImage.value,
                                  fit: BoxFit.contain,
                                )
                                    : Image.asset(
                                  kycselfie,
                                  scale: 4,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(6),
                        Center(
                            child: Text(
                              'Take a Photo',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: lightGray),
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: Utils.getHeight(context) * 0.025,
              ),

                ],
              ),
            ),
          ),

          bottomNavigationBar: Container(
            height: Utils.getHeight(context) * 0.08,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff037EEE).withOpacity(0.15),
                  offset: const Offset(0.0, -1),
                  blurRadius: 0.5,
                  spreadRadius: 0.3,
                ), //BoxShadow
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      navigationService.push(routeKycScreen);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff727272))),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async{

                        // ReqSubmitKyc submitKycData = ReqSubmitKyc(
                        //   userId: getString(prefUserID),
                        //   userType: "Customer",
                        //   aadharNo: "aadharcardnocontroller.textdsfd",
                        //   aadharFrontImage: "aadharFrontType.value+aadharFrontBase64Image",
                        //   aadharBackImage: "aadharBackType.value+aadharBackBase64Image",
                        //   panNo: "pancardnocontroller.text",
                        //   panFrontImage: "panFrontType.value+panBase64Image",
                        //   selfImage: "selfieType.value+selfieBase64Image",
                        // );
                        //
                        // await ref.read(submitKycProvider.notifier)
                        //     .submitKyc(context: context, data: submitKycData)
                        //     .then((value) {
                        //   if(value!.status == 1){
                        //     displayToast("${value.message}");
                        //     navigationService.push(routeKYCChatBotMobile);
                        //   }else{
                        //     displayToast("${value.message}");
                        //   }
                        // });

                        ///

                        if (isAadhar.value) {
                          if(isPanCard.value) {
                            if(isAadharPicked.value) {

                              var aadharFrontImageBytes = await aadharPickedImage.value.readAsBytesSync();
                              String  aadharFrontBase64Image = base64Encode(aadharFrontImageBytes);

                              if(isAadharBackPicked.value) {

                                var aadharBackImageBytes = await aadharBackPickedImage.value.readAsBytesSync();
                                String  aadharBackBase64Image = base64Encode(aadharBackImageBytes);

                                if(isPanPicked.value) {

                                  var panImageBytes = await panPickedImage.value.readAsBytesSync();
                                  String  panBase64Image = base64Encode(panImageBytes);

                                  if(isSelfiePicked.value) {

                                    var selfieImageBytes = await selfiePickedImage.value.readAsBytesSync();
                                    String  selfieBase64Image = base64Encode(selfieImageBytes);

                                    if(isSelfiePicked.value) {

                                      print("image in aadharFront ---->>>");
                                      print(aadharFrontType.value +
                                          aadharFrontBase64Image);
                                      print("image in aadharBack ---->>> ");
                                      print(aadharBackType.value +
                                          aadharBackBase64Image);
                                      print("image in panCard ---->>> ");
                                      print(
                                          panFrontType.value + panBase64Image);
                                      print("image in panCard ---->>> ");
                                      print(
                                          selfieType.value + selfieBase64Image);

                                      print("image in userId ---->>> ");


                                      ReqSubmitKyc submitKycData = ReqSubmitKyc(
                                        // userId: "7",
                                        userId: getString(prefUserID),
                                        userType: "Customer",
                                        aadharNo: aadharcardnocontroller.text,
                                        aadharFrontImage: "${aadharFrontType.value + aadharFrontBase64Image}",
                                        aadharBackImage: "${aadharBackType.value + aadharBackBase64Image}",
                                        panNo: pancardnocontroller.text,
                                        panFrontImage: "${panFrontType.value + panBase64Image}",
                                        selfImage: "${selfieType.value + selfieBase64Image}",
                                      );

                                      await ref.read(submitKycProvider.notifier)
                                          .submitKyc(
                                          context: context, data: submitKycData)
                                          .then((value) {
                                        if (value!.status == 1) {
                                          displayToast("${value.message}");
                                          navigationService.push(
                                              routeKYCChatBotMobile);
                                        } else {
                                          displayToast("${value.message}");
                                        }
                                      });
                                    }
                                  }else{
                                    displayToast("Please Selfie Image Upload");
                                  }
                                }else{
                                  displayToast("Please Pan Card Front Image Upload");
                                }
                              }else{
                                displayToast("Please Aadhar Card Back Image Upload");
                              }
                            }else{
                              displayToast("Please Aadhar Card Front Image Upload");
                            }
                          }else{
                              displayToast("Please Verify Pan Card");
                          }
                        } else {
                          displayToast("Please Verify Aadhar Card");
                        }

                     },
                      child: Container(
                        height: Utils.getHeight(context) * 0.08,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff3C87E0).withOpacity(0.9),
                              Color(0xff0E3563).withOpacity(0.9)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
