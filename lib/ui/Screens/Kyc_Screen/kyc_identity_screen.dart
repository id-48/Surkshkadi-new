import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_no/req_aadhar_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_otp/req_aadhar_otp.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_bank_ac/req_bank_ac.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_gstin_no/req_gst_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_pancard_no/req_pancard_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_vehicle_no/req_vehicle_no.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/verify_documents_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KYCIdentity extends HookConsumerWidget {
  const KYCIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDigiLocker = useState<bool>(true);
    final isOtp = useState<bool>(false);
    final aadharClientId = useState<String>("");
    final isAadhar = useState<bool>(false);
    final isPanCard = useState<bool>(false);
    final isBank = useState<bool>(false);
    final isVehicle = useState<bool>(false);
    final isGST = useState<bool>(false);
    ImagePicker _picker = ImagePicker();

    final aadharcardnocontroller = useTextEditingController();
    final aadharOtpController = useTextEditingController();
    final pancardnocontroller = useTextEditingController();
    final bankACNoController = useTextEditingController();
    final bankIFSCCodeController = useTextEditingController();
    final vehicleNoController = useTextEditingController();
    final GSTNoController = useTextEditingController();
    final digiLockerController = useTextEditingController();



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


              Container(
                height: 290,
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(
                      left: 10, top: 10, right: 15, bottom: 10),
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
                                      EdgeInsets.only(bottom: 5, top: 8),
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
                                    Gap(12),
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
                                    Gap(12),
                                    if (isOtp.value == true) ...[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 5, top: 8),
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
                                      Gap(12),
                                      CustomButton(
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
                                              if (value!.result
                                                  .statusCode ==
                                                  200) {
                                                isAadhar.value = true;
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
                                      borderRadius: BorderRadius.circular(10),
                                      controller: pancardnocontroller,
                                      border: InputBorder.none,
                                      textInputType: TextInputType.text,
                                      textInputFormatter: [],
                                      // hinttext: 'Enter your username',
                                    ),
                                  ),
                                  Gap(20),
                                  CustomButton(
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
                              child: GestureDetector(
                                onTap: () async {
                                  print(
                                      '------------->>>>>>>>>>>>>>>>>.image ');
                                  panImage = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  print('image path 216${panImage}');
                                  if (panImage != null) {
                                    panPickedImage.value =
                                        File(panImage!.path);
                                    print(
                                        ' ------------------------- image path 200 --------------------------->>>>>>>${panPickedImage}');

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
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Text(
                              uploadPan,
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: lightGrey),
                            ),
                            Gap(10),
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
                                    source: ImageSource.camera);
                                print('image path 216${selfieImage}');
                                if (selfieImage != null) {
                                  selfiePickedImage.value =
                                      File(selfieImage!.path);
                                  print(
                                      ' ------------------------- image path 200 --------------------------->>>>>>>${selfiePickedImage}');

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
                              'Take a selfie',
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
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => KYCChatBotMobile()));

                        navigationService.push(routeKYCChatBotMobile);
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
