import 'dart:io';
import 'dart:typed_data';

import 'package:cc_avenue/cc_avenue.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/req_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/payment_view_modal.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import '../../../../utils/image_utils.dart';
import '../../../../widgets/custom_dottedborder.dart';
import 'package:http/http.dart' as http;

class AddInformationScreen extends HookConsumerWidget {
  final ReqSingleUserAssets singleChooseAssetsAI;
  AddInformationScreen({Key? key, required this.singleChooseAssetsAI})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueController = useTextEditingController();
    final emailController = useTextEditingController();
    final statee = useState<String>("");
    final cityy = useState<String>("");


    ImagePicker _picker = ImagePicker();

    final imageFileList = useState<List<XFile>>([]);
    final imageList = useState<List<MultipartFile>>([]);
    final imageListDemo = useState<List>([]);

     final cityList = useState<List<String>>([]);

    //
    // Razorpay? _razorpay;
    //
    // void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    //
    //   print("yashtotal333333 ___>>>>");
    //   setString(prefPaymentId, response.paymentId.toString());
    //
    //   print("getString ");
    //     print("single User Id --->>  ${getString(prefSingleUAId)}");
    //
    //     ReqSingleUAPayment SingleUAPayment = ReqSingleUAPayment(
    //         paymentAmount: "99",
    //       singleUserAssetsId: "${getString(prefSingleUAId)}",
    //       transactionId: response.paymentId,
    //       transactionStatus: "Success"
    //     );
    //
    //     ref.read(singleUAPaymentProvider.notifier)
    //         .singleUAPayment(context: context, data: SingleUAPayment)
    //         .then((value) {
    //         if(value!.status == 1){
    //
    //           displayToast(value.message);
    //            navigationService.push(routeConfirmationSpecific);
    //         }
    //     });
    //
    //
    // }
    //
    // void _handlePaymentError(PaymentFailureResponse response) {
    //   ToastUtils.showCustomToast(
    //       context, 'ERROR' + response.message!, 'warning');
    // }
    //
    // void _handleExternalWallet(ExternalWalletResponse response) {
    //   ToastUtils.showCustomToast(
    //       context, 'SUCCESS' + response.walletName!, 'SUCCES');
    // }
    //
    // void openCheckout(int amount) async {
    //   print("yashtotal11111 ___>>>>");
    //   var options = {
    //     'key': 'rzp_test_3FbPA4Jan9QLit',
    //     'amount': "9900",
    //     'name': 'Surakshakadi',
    //     'description': 'Payment',
    //     'prefill': {
    //       'contact': '+91 7585982534',
    //       'email': 'surakshakadi@gmail.com'
    //     },
    //     'external': {
    //       'wallets': ['paytm']
    //     }
    //   };
    //
    //   try {
    //     print("yashtotal2222 ___>>>>");
    //     _razorpay?.open(options);
    //   } catch (e) {
    //     debugPrint("$e");
    //   }
    // }

    useEffect(() {
      print("yashtotal33333 ___>>>> ");

      // _razorpay = Razorpay();
      // _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      // _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      // _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

      return null;
    },[] );


    Future<void> initPlatformState() async {
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        await CcAvenue.cCAvenueInit(
            transUrl: 'http://www.surakshakadi.com',
            accessCode: 'AVFR93KA85AJ95RFJA',
            amount: '100',
            cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
            currencyType: 'INR',
            merchantId: 'SURAKSHAKADI DIGI ESTATE SERVICES PVT.LTD',
            orderId: '619',
            redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
            rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp'
        );

      } on PlatformException {
        print('PlatformException');
      }
    }


    XFile? image;
    final pickedImage = useState<File>(File(""));


    XFile? addImage;
    final addPickedImage = useState<File>(File(""));


    XFile? cameraImage;
    final cameraPickedImage = useState<File>(File(""));
    final isCameraPicked = useState<bool>(false);



    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

      return StatefulBuilder(
        builder: (BuildContext context,setState) {
          return Scaffold(
            appBar: CustomAppBar(
              title: '${addinformation}',
              backonTap: () {
                navigationService.pop();
                // Navigator.pop(context);
              },
              notionTap: () {},
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shareMoreDetails,
                      style: TextStyle(color: blue, fontSize: 15),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.006,
                    ),
                    Container(
                      height: Utils.getHeight(context) * 0.16,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: lightsky,
                            border: Border.all(color: blue),
                            boxShadow: [
                              BoxShadow(
                                  color: black12.withOpacity(0.05), //New
                                  blurRadius: 6.0,
                                  offset: Offset(-3, 5))
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  textlineicon,
                                  scale: 4,
                                ),
                              ),
                              Expanded(
                                child: CustomTextfeild(
                                  containercolor: lightsky,
                                  borderRadius: BorderRadius.circular(7),
                                  textCapitalization: TextCapitalization.none,
                                  blurRadius: 0.0,
                                  offset: Offset(0, 0),
                                  controller: issueController,
                                  border: InputBorder.none,
                                  hinttext: 'Please add details here.',
                                  maxLines: 5,
                                  hintStyle: TextStyle(color: black, fontSize: 14),
                                  // prefix: Image.asset(textlineicon, scale: 4,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.03,
                    ),
                    Text(
                      beforeWeProceed,
                      // style: TextStyle(color: blue, fontSize: 15),
                      style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                        fontSize: 15,
                        color: blue,
                      )),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.017,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 7),
                      child: Text(
                        emailId,
                        style: TextStyle(color: black, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: CustomTextfeild(
                            textCapitalization: TextCapitalization.none,
                            blurRadius: 5.0,
                            offset: Offset(-1, 1),
                            containerborder: Border.all(color: blue),
                            containercolor: lightsky,
                            borderRadius: BorderRadius.circular(7),
                            controller: emailController,
                            hinttext: 'Enter your email',
                            hintStyle: TextStyle(color: black, fontSize: 14),
                            prefix: Icon(
                              Icons.email_outlined,
                              color: Color(0xffD6D6D6),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.007,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 7),
                      child: Text(
                        states,
                        style: TextStyle(color: black, fontWeight: FontWeight.w400),
                      ),
                    ),

                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: lightsky,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                  color: black12, //New
                                  blurRadius: 5.0,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: CustomSelect(
                            onChanged: (stateVal) async {

                              cityList.value.clear();
                              statee.value = stateVal;

                              ReqCity cityData = ReqCity(state: "${stateVal}" );

                              await ref
                                  .read(cityProvider.notifier)
                                  .getCity(context: context, data: cityData).then((value) {
                                    if(value!.status == 1){
                                      // displayToast("${value.message}");
                                      for(int j = 0; j<value.response.cities.length; j++){
                                        cityList.value.add(value.response.cities[j].name);
                                      }
                                    }else{
                                      displayToast("${value.message}");
                                    }
                              });
                            },
                            items: stateList,
                            // items: ['Gujarat', 'Goa', 'Mumbai'],
                            hint: 'Choose your state',
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                top: 0,
                                right: 15,
                              ),
                              child: Image.asset(
                                state,
                                scale: 3.8,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.007,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 7),
                      child: Text(
                        city,
                        style: TextStyle(color: black, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightsky,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                color: black12,
                                blurRadius: 5.0,
                                offset: Offset(-1, 1))
                          ],
                        ),
                        child: CustomSelect(
                          onChanged: (val) {
                            if(statee.value.isNotEmpty){
                              cityy.value = val;
                            }else{
                              displayToast("Please Select State");
                            }

                          },
                          items: cityList.value,
                          // items: ['Amreli', 'Surat', 'Ahemdabad'],
                          hint: 'Choose your city',
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                              right: 15,
                            ),
                            child: Image.asset(
                              cityicon,
                              scale: 3.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.007,
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.06,
                    ),
                    InkWell(
                      onTap: () async {
                        print('------------->>>>>>>>>>>>>>>>>.image ');
                        image = await _picker.pickImage(source: ImageSource.gallery);
                        print('image path 216${image}');
                        if (image != null) {
                          pickedImage.value = File(image!.path);
                          print(
                              ' image path 200 ---->>>>>>${pickedImage}');
                          imageFileList.value.add(image!);
                          displayToast("Image Successful Upload");
                          setState((){});
                        }

                      },
                      child: Container(
                        width: Utils.getWidth(context),
                        height: Utils.getHeight(context) * 0.055,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Gap(5),
                            Icon(
                              Icons.attach_file,
                              size: 25,
                              color: white,
                            ),
                            Gap(20),
                            Text(
                              attachDocument,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.025,
                    ),
                    InkWell(
                      onTap: () async {

                        print('------------->>>>>>>>>>>>>>>>>.image ');
                        addImage = await _picker.pickImage(source: ImageSource.gallery);
                        print('image path 216${addImage}');
                        if (addImage != null) {
                          addPickedImage.value = File(addImage!.path);
                          print(
                              ' image path 200 ---->>>>>>${addPickedImage}');
                          imageFileList.value.add(addImage!);
                          displayToast("Image Successful Upload");

                          setState((){});

                        }
                      },
                      child: Text(
                        addAnotherDocument,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: blueee,
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.035,
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setState) {
                        return InkWell(
                          onTap: () async {
                            print('------------->>>>>>>>>>>>>>>>>.image ');
                            cameraImage = await _picker.pickImage(source: ImageSource.camera);
                            print('image path 216${cameraImage}');
                            if (cameraImage != null) {
                              cameraPickedImage.value = File(cameraImage!.path);
                              imageFileList.value.add(cameraImage!);
                              print(' image path 200 ---->>>>>>${cameraPickedImage}');
                              isCameraPicked.value = true;
                              displayToast("Image Successful Upload");
                              setState((){});
                            }

                          },
                          child: Container(
                            height: 170,
                            child: Custom_Dottedborder(
                              padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      clickPhoto,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: black),
                                    ),
                                    Gap(15),
                                    Row(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 90,
                                            width: Utils.getWidth(context) * 0.27,
                                            child: isCameraPicked.value == true
                                                ? Image.file(
                                                cameraPickedImage.value
                                            )
                                                : Image.asset(
                                              informationupload,
                                              scale: 4,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Gap(25),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              uploadImage,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600,
                                                  color: black),
                                            ),
                                            Text(
                                              uploadMultipleImage,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400,
                                                  color: lightGray),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },

                      // child: Container(
                      //   height: 170,
                      //   child: Custom_Dottedborder(
                      //     padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      //     child: Container(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             clickPhoto,
                      //             style: TextStyle(
                      //                 fontSize: 13,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: black),
                      //           ),
                      //           Gap(15),
                      //           Row(
                      //             children: [
                      //               Center(
                      //                 child: Container(
                      //                   height: 90,
                      //                   width: Utils.getWidth(context) * 0.27,
                      //                   child: GestureDetector(
                      //
                      //                     child:
                      //                         imageFileList.value.isNotEmpty
                      //                             ? SelectedImageViewer(
                      //                                 res: imageFileList,
                      //                                 setState: (void Function()) {
                      //                                   setState(() {});
                      //                                 },
                      //                               )
                      //                             : Image.asset(
                      //                                 informationupload,
                      //                                 scale: 4,
                      //                                 fit: BoxFit.fill,
                      //                               ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Gap(25),
                      //               GestureDetector(
                      //                 onTap: () async {
                      //                   getImage(imageFileList);
                      //                   isPicked.value = true;
                      //                 },
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     Text(
                      //                       uploadImage,
                      //                       style: TextStyle(
                      //                           fontSize: 9,
                      //                           fontWeight: FontWeight.w600,
                      //                           color: black),
                      //                     ),
                      //                     Text(
                      //                       uploadMultipleImage,
                      //                       style: TextStyle(
                      //                           fontSize: 9,
                      //                           fontWeight: FontWeight.w400,
                      //                           color: lightGray),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.08,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if(imageFileList.value.isNotEmpty) {
                            for (int i = 0; i <
                                imageFileList.value.length; i++) {
                              Uint8List imageBytes =
                              await imageFileList.value[i].readAsBytes();
                              int length = imageBytes.length;
                              http.ByteStream stream =
                              http.ByteStream(
                                  imageFileList.value[i].openRead());
                              imageList.value.add(
                                MultipartFile(stream, length,
                                    filename: imageFileList.value[i].name),
                              );

                              imageListDemo.value.add(stream);
                            }

                            print('image List -------->>>>>>>>>> ${imageList
                                .value} }');

                            // initPlatformState();

                            if (issueController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                statee.value.isNotEmpty &&
                                cityy.value.isNotEmpty) {
                              singleChooseAssetsAI.otherDetails =
                                  issueController.text;
                              singleChooseAssetsAI.email = emailController.text;
                              singleChooseAssetsAI.state = statee.value;
                              singleChooseAssetsAI.city = cityy.value;
                              singleChooseAssetsAI.documents = imageListDemo.value;
                              // singleChooseAssetsAI.documents = imageList.value;

                              await ref
                                  .read(dashboardProvider.notifier)
                                  .getSingleUserAssets(
                                  context: context, data: singleChooseAssetsAI)
                                  .then((value) {
                                if (value?.status == 1) {
                                  // openCheckout(9900);
                                  setString(prefSingleUAId,
                                      "${value?.response.singleUserAssetId}");
                                  print(
                                      "Single userId ---->>>> ${value?.response
                                          .singleUserAssetId}");
                                  ReqSingleUAPayment SingleUAPayment = ReqSingleUAPayment(
                                      paymentAmount: "99",
                                      singleUserAssetsId: "${value?.response
                                          .singleUserAssetId}",
                                      transactionId: "hashdafefojahfo",
                                      transactionStatus: "Success"
                                  );

                                  ref.read(singleUAPaymentProvider.notifier)
                                      .singleUAPayment(
                                      context: context, data: SingleUAPayment)
                                      .then((value) {
                                    if (value!.status == 1) {
                                      // openCheckout(9900);
                                      hideLoadingDialog(context: context);

                                      displayToast(value.message);
                                      navigationService.push(
                                          routeConfirmationSpecific);
                                    }
                                  });


                                  displayToast(value!.message);
                                  print("Yashu Patel");
                                } else {
                                  displayToast(value!.message);
                                }
                              });
                            } else {
                              displayToast('Enter Your Information');
                            }

                            // openCheckout(9900);


                            setState(() {});
                          }else{
                            displayToast('Please Upload Image');
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 17, horizontal: 50),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff3C87E0).withOpacity(0.9),
                                  Color(0xff0E3563).withOpacity(0.6),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
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
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(context) * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );

  }
}
