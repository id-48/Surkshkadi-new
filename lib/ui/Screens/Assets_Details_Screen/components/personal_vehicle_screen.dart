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

class PersonalVehicle extends HookConsumerWidget {
  const PersonalVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxController = useTextEditingController();
    final messageController = useTextEditingController();
    final imageFileList = useState<List<XFile>>([]);
    final cameraFileList = useState<List<XFile>>([]);

    List<MultipartFile> imageList = [];
    return Scaffold(
      appBar: CustomAppBar(
        // backonTap: () {
        //   Navigator.pop(context);
        // },
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
                  image: personal,
                  title: "Personal Assets",
                  description: "(Vehicle)"),
              Gap(16),
              expandRow(context,
                  controller: boxController,
                  title: "Vehicle Registration Number"),
              Gap(6),
              Center(
                child: CustomButton(
                  title: verify,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MiscellaneousCompany()));
                  },
                ),
              ),
              Gap(20),
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
                    if (boxController.text.isNotEmpty) {

                      if(cameraFileList.value.isNotEmpty){
                        imageFileList.value.add(cameraFileList.value[0]);
                      if (imageFileList.value.isNotEmpty) {
                        for (int i = 0; i < imageFileList.value.length; i++) {
                          Uint8List imageBytes =
                              await imageFileList.value[i].readAsBytes();
                          int length = imageBytes.length;
                          http.ByteStream stream = http.ByteStream(
                              imageFileList.value[i].openRead());
                          imageList.add(
                            MultipartFile(stream, length,
                                filename: imageFileList.value[i].name),
                          );
                        }

                        Map<String, dynamic> formDetailsData = {
                          "vehicleRegNo": boxController.text,
                          "legalHeir": messageController.text,
                        };

                        ReqStoreAssetsFormDetails storeAssetsFormData =
                            ReqStoreAssetsFormDetails(
                                // subscriptionAssetId: 1,
                                subscriptionAssetId: int.parse(
                                    getString(prefSubscriptionAssetId)),
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
    );
  }
}
