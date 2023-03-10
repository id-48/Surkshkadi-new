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
import 'package:http/http.dart' as http;

class GovernmentEPF extends HookConsumerWidget {
  const GovernmentEPF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final universalController = useTextEditingController();
    final epfController = useTextEditingController();
    final nameCompanyController = useTextEditingController();
    final nomineeController = useTextEditingController();
    final messageController = useTextEditingController();
    final imageFileList = useState<List<XFile>>([]);
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

              header(context, image: government, title: "Government Schemes", description: "Employee Provident Fund (EPF)"),

              Gap(16),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(pleaseShareTheDetailsEPF,style: TextStyle(fontWeight: FontWeight.w400,color: black ,fontSize: 12,fontFamily: fontFamily),)),
              Gap(10),

              expandRow(context,controller: universalController,title: "Universal Acc. No."),
              expandRow(context,controller: epfController,title: "EPF Acc. No."),
              expandRow(context,controller: nameCompanyController,title: "Name of the company/ Employee"),
              expandRow(context,controller: nomineeController,title: "Nominee's Name (if any)"),


              Gap(6),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(addAnother,style: TextStyle(fontWeight: FontWeight.w500,color: blueee ,fontSize: 12),)),
              Gap(10),

              assetsPhotoText(context,controller: messageController,imageFileList: imageFileList.value),

              Center(
                child: CustomButton(
                  title: continuee,
                  padding:
                  EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: () async {

                    if(universalController.text.isNotEmpty
                        && epfController.text.isNotEmpty
                        && nameCompanyController.text.isNotEmpty
                        && nomineeController.text.isNotEmpty
                    ){

                    if(imageFileList.value.isNotEmpty) {
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


                      Map<String,dynamic>  formDetailsData =
                      {
                        "universal": universalController.text,
                        "epf": epfController.text,
                        "nameCompany": nameCompanyController.text,
                        "nominee": nomineeController.text,
                      };

                      ReqStoreAssetsFormDetails storeAssetsFormData = ReqStoreAssetsFormDetails(
                          // subscriptionAssetId: 1,
                          subscriptionAssetId: int.parse(getString(prefSubscriptionAssetId)),
                          formDetails: ["${formDetailsData}"],
                          assetDocuments: imageList
                      );

                      await ref.read(storeAssetsFormProvider.notifier)
                          .assetsFormDetails(context: context, data: storeAssetsFormData)
                          .then((value) {

                        if(value?.status == 1){
                          displayToast("${value?.message}");
                          navigationService.push(routeAssetScreen);
                          print("enter ---->>> ");
                        }else{
                          displayToast("${value?.message}");
                        }
                      });

                    }else{
                    displayToast("Please Upload Image");
                    }

                  }else{
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