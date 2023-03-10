import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/req_store_assets_form_details.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/store_assets_form_view_modal.dart';
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
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:http/http.dart' as http;

class Utility extends HookConsumerWidget {
  const Utility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final writeHereController = useTextEditingController();
    final messageController = useTextEditingController();
    final imageFileList = useState<List<XFile>>([]);
    final cameraFileList = useState<List<XFile>>([]);

    List<MultipartFile> imageList = [];
    return Scaffold(
      appBar: CustomAppBar(
        backonTap: () {
          Navigator.pop(context);
        },
        title: "${assetsInformation}",
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconText(context),
              header(context,
                  image: utility, title: "Utility", description: ""),
              Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomExpandableCardCode(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  border: Border.all(color: blue),
                  height: 40,
                  name: "Type of Utility",
                  textColor: white,
                  iconColor: white,
                  boxcolor: blue,
                  expandedChild: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // height: 150,
                    // width: Utils.getWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      color: white,
                      // border: Border.all(color: blue),
                    ),

                    child: Column(
                      children: [
                        // ...dattaa["description"]
                        //     .map(
                        //       (e) =>
                        GestureDetector(
                          onTap: () {
                            //    Navigator.push(context, MaterialPageRoute(builder: (context)  =>
                            //        AssetsInformation(selectedindex: data["description"].indexOf(e), dattaa: data, )));
                            //     colorBox == true ?
                            // navigationService.push(routeAssetsInformation,arguments: {navSelectedindex: data["description"].indexOf(e),navDattaa: data,});
                            // :
                            // navigationService.push(routeAssetsInformationWeb,arguments: {navSelectIndex : data["description"].indexOf(e), navSelectDattaa : data });
                            //  data.indexof(e);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1.2,
                                endIndent: 0,
                                color: blue,
                                height: 0,
                              ),
                              Container(
                                height: 100,
                                width: Utils.getWidth(context),
                                padding: EdgeInsets.only(
                                    left: 20, top: 6, bottom: 6),
                              ),
                            ],
                          ),
                        ),
                        // )
                        //     .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(16),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    addDetails,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blueee,
                        fontSize: 12,
                        fontFamily: fontFamily),
                  )),
              Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(left: 15, top: 1, right: 1, bottom: 1),
                  child: CustomTextfeild(
                    controller: writeHereController,
                    textCapitalization: TextCapitalization.none,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                    containercolor: white,
                    borderRadius: BorderRadius.circular(10),
                    // height: 80,
                    maxLines: 3,
                    hinttext: "Write here",
                    hintStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: hintTextColor,
                        fontFamily: fontFamily),
                  ),
                ),
              ),
              Gap(14),

              addAnotherDoc(context, imageFileList: imageFileList.value),

              // Padding(
              //     padding: EdgeInsets.only(left: 15),
              //     child: Text(
              //       addAnother,
              //       style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           color: blueee,
              //           fontSize: 12),
              //     )),

              Gap(10),
              assetsPhotoText(context,
                  controller: messageController,
                  imageFileList: imageFileList.value,cameraFileList: cameraFileList.value),
              Center(
                child: CustomButton(
                  title: continuee,
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: () async {

                    if (writeHereController.text.isNotEmpty) {

                      if(cameraFileList.value.isNotEmpty){
                        imageFileList.value.add(cameraFileList.value[0]);
                    if (imageFileList.value.isNotEmpty) {
                      for (int i = 0; i < imageFileList.value.length; i++) {
                        Uint8List imageBytes =
                            await imageFileList.value[i].readAsBytes();
                        int length = imageBytes.length;
                        http.ByteStream stream =
                            http.ByteStream(imageFileList.value[i].openRead());
                        imageList.add(
                          MultipartFile(stream, length,
                              filename: imageFileList.value[i].name),
                        );
                      }

                        Map<String, dynamic> formDetailsData = {
                          "writeHere": writeHereController.text,
                          "legalHeir": messageController.text,
                        };

                        ReqStoreAssetsFormDetails storeAssetsFormData =
                            ReqStoreAssetsFormDetails(
                                // subscriptionAssetId: 1,
                                subscriptionAssetId: int.parse(getString(prefSubscriptionAssetId)),
                                formDetails: ["${formDetailsData}"],
                                assetDocuments: imageList);

                        await ref
                            .read(storeAssetsFormProvider.notifier)
                            .assetsFormDetails(
                                context: context, data: storeAssetsFormData)
                            .then((value) {
                          if (value?.status == 1) {
                            print("enter ---->>> ");
                            displayToast("${value?.message}");
                            navigationService.push(routeCustomBottomNavigationBar);
                          } else {
                            displayToast("${value?.message}");
                          }
                        });
                      } else {displayToast("Please Upload Image");}
                      } else {displayToast("Please Upload selfie Image");}
                    } else {
                        // displayToast("Please Attach Field");
                      infoAssetsCustomDialog(context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: Utils.getHeight(context) * 0.023,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: Utils.getHeight(context) * 0.08,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color(0xff037EEE).withOpacity(0.15),
      //         offset: const Offset(0.0, -3),
      //         blurRadius: 0.7,
      //         spreadRadius: 0.5,
      //       ), //BoxShadow
      //     ],
      //   ),
      //   child: Row(
      //     children: [
      //       Expanded(
      //           flex: 1,
      //           child: Container(
      //               alignment: Alignment.center,
      //               child: Text(
      //                 "Raise a ticket",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15,
      //                       color: blue)),
      //           )
      //       ),
      //       Expanded(
      //           flex: 1,
      //           child: HookConsumer(
      //             builder: (context, ref, child) {
      //               return InkWell(
      //                 onTap: ()  {
      //                   navigationService.push(routeCustomeBottomNavigationBar,);
      //                 },
      //                 child: Container(
      //                   height: Utils.getHeight(context) * 0.08,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     gradient: LinearGradient(
      //                       colors: [
      //                         Color(0xff3C87E0).withOpacity(0.9),
      //                         Color(0xff0E3563).withOpacity(0.9)
      //                       ],
      //                       begin: Alignment.topCenter,
      //                       end: Alignment.bottomCenter,
      //                     ),
      //                   ),
      //                   child: Text(
      //                     continuee,
      //                     style: TextStyle(
      //                         color: white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: 0.5),
      //                   ),
      //                 ),
      //               );
      //             },
      //           )),
      //     ],
      //   ),
      // ),
    );
  }
}
