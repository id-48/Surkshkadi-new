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
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/utility_screen.dart';
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
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:http/http.dart' as http;

class ImmovableProperty extends HookConsumerWidget {
  const ImmovableProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final propertyController         = useTextEditingController();
    final roughValueController       = useTextEditingController();
    final detailsLoanController       = useTextEditingController();
    final detailsInsuranceController = useTextEditingController();
    final messageController = useTextEditingController();
    final imageFileList = useState<List<XFile>>([]);
    List<MultipartFile> imageList = [];

    final ownership = useState<bool>(true);

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

              header(context, image: immovable, title: "Immovable Assets", description: "(Property)"),

              Gap(16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomExpandableCardCode(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  border:  Border.all(color: blue),
                  height: 40,
                  name: "Type of Property",
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
                          onTap: (){

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
                              Divider(thickness: 1.2, endIndent: 0, color: blue,height: 0,),

                              Container(
                                height: 100,
                                width: Utils.getWidth(context),
                                padding: EdgeInsets.only(left: 20,top: 6,bottom: 6),

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

              expandRow(context,controller: propertyController,title: "Property Address"),
              expandRow(context,controller: roughValueController,title: "Rough Value of the Property"),

              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Text(
                          'Type of Ownership',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        )),
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: (){
                              ownership.value = true;
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ownership.value == true ? blue : lightsky,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: blue),
                                 boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2.0, offset: Offset(2,2)),
                                ],
                              ),
                              child: Text("Single",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ownership.value == true ? white : blue),),
                            ),
                           ),
                          ),

                          Gap(8),

                          Expanded(flex: 1,child: GestureDetector(
                            onTap: (){
                              ownership.value = false;
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ownership.value == false ? blue : lightsky,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: blue),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2.0, offset: Offset(2,2)),
                                ],
                              ),
                              child: Text("Joint",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ownership.value == false ? white : blue),),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              expandRow(context,controller: detailsLoanController,title: "Details of the Loan(If Taken)"),
              expandRow(context,controller: detailsInsuranceController,title: "Details of the Insurance(If Taken)"),

              Gap(16),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(addAnother,style: TextStyle(fontWeight: FontWeight.w500,color: blueee ,fontSize: 12),)),
              Gap(10),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(noteACopyYour,style: TextStyle(fontWeight: FontWeight.w400,color: black ,fontSize: 12,fontFamily: fontFamily),)),
              Gap(20),

              assetsPhotoText(context,controller: messageController, imageFileList: imageFileList.value),

              Center(
                child: CustomButton(
                  title: continuee,
                  padding:
                  EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: () async {

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

                      if (propertyController.text.isNotEmpty
                          && roughValueController.text.isNotEmpty
                          && detailsLoanController.text.isNotEmpty
                          && detailsInsuranceController.text.isNotEmpty
                      ) {
                        Map<String, dynamic> formDetailsData =
                        {
                          "property": propertyController.text,
                          "roughValue": roughValueController.text,
                          "ownership": ownership.value == true
                              ? "Single"
                              : "Joint",
                          "detailsLoan": detailsLoanController.text,
                          "detailsInsurance": detailsInsuranceController.text,
                          "legalHeir": messageController.text,
                        };

                        ReqStoreAssetsFormDetails storeAssetsFormData = ReqStoreAssetsFormDetails(
                            subscriptionAssetId: int.parse(
                                getString(prefSubscriptionAssetId)),
                            formDetails: ["${formDetailsData}"],
                            assetDocuments: imageList
                        );

                        await ref.read(storeAssetsFormProvider.notifier)
                            .assetsFormDetails(
                            context: context, data: storeAssetsFormData)
                            .then((value) {
                          if (value?.status == 1) {
                            print("enter ---->>> ");
                            displayToast("${value?.message}");
                            navigationService.push(routeAssetScreen);
                          } else {
                            displayToast("${value?.message}");
                          }
                        });
                      } else {
                        displayToast("Please Attach Field");
                      }

                    }else{
                      displayToast("Please Upload Image");
                    }
                  },
                ),
              ),

              Gap(10),


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
