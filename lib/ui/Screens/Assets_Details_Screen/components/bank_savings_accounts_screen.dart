import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/req_store_assets_form_details.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/insurance_life_insurance_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/personal_screen.dart';
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


class BankSavingsAccounts extends HookConsumerWidget {
  const BankSavingsAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final accountController = useTextEditingController();
    final ifscCodeController = useTextEditingController();
    final nomineeController = useTextEditingController();
    final additionalController = useTextEditingController();
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

              header(context, image: bank, title: "Bank Assets", description: "Savings accounts and deposits"),

              Gap(16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomExpandableCardCode(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  border:  Border.all(color: blue),
                  height: 40,
                  name: "Type of Banking Asset",
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

              expandRow(context,controller: accountController,title: "Account number"),
              expandRow(context,controller: ifscCodeController,title: "IFSC code"),
              expandRow(context,controller: nomineeController,title: "Nominee’s Name(if any)"),

              Gap(6),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(additionalIn,style: TextStyle(fontWeight: FontWeight.w600,color: blueee ,fontSize: 12,fontFamily: fontFamily),)),

              Gap(12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(left: 15,top: 1,right: 1,bottom: 1),
                  child: CustomTextfeild(
                    controller: additionalController,
                    textCapitalization: TextCapitalization.none,
                    blurRadius: 0.0,
                    offset: Offset(0.0,0.0),
                    containercolor: white,
                    borderRadius: BorderRadius.circular(10),
                    // height: 80,
                    maxLines: 3,
                    hinttext: "Bank Locker number, FD number etc...",
                    hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: hintTextColor,fontFamily: fontFamily),
                  ),
                ),
              ),

              Gap(14),
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


                    if(accountController.text.isNotEmpty
                        && ifscCodeController.text.isNotEmpty
                        && nomineeController.text.isNotEmpty
                        && additionalController.text.isNotEmpty
                    ){


                      Map<String,dynamic>  formDetailsData =
                      {
                        "account": accountController.text,
                        "ifscCode": ifscCodeController.text,
                        "nominee": nomineeController.text,
                        "additional": additionalController.text,
                        "legalHeir": messageController.text,
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
                          print("enter ---->>> ");
                          displayToast("${value?.message}");
                          navigationService.push(routeAssetScreen);
                        }else{
                          displayToast("${value?.message}");
                        }
                      });

                    }else{
                      displayToast("Please Attach Field");
                    }





                   // Navigator.push(context, MaterialPageRoute(builder: (context) => InsuranceLife()));
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