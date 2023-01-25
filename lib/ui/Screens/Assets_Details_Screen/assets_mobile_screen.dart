import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/req_get_selected_assets.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/immovable_property_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/store_assets_form_view_modal.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_mobile_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/loading.dart';

import '../../../data/model/home/dashboard/assets_details/get_selected_assets/res_get_selected_assets.dart';
import '../../../utils/constants/navigation_route_constants.dart';

class AssetsMobile extends HookConsumerWidget {
  const AssetsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ReqGetSelectedAssets PlanChatSubPayment = ReqGetSelectedAssets(
          // userId: 1
          userId: int.parse(getString(prefUserID))
          );

      ref
          .read(getSelectedAssetsProvider.notifier)
          .getSelectedAssets(context: context, data: PlanChatSubPayment);
    }, []);

    final selectedAssetsController = ref.watch(getSelectedAssetsProvider);

    return StatefulBuilder(builder: (BuildContext context, setState) {
      print("assets userId--->>${getString(prefUserID)}");
      return selectedAssetsController.when(
          data: (data) {
            return Scaffold(
              appBar: CustomAppBar(
                title: assets,
                backonTap: () {
                  Navigator.pop(context);
                },
                notionTap: () {},
              ),
              body: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text(
                        noOneElseEven,
                        style: TextStyle(
                            color: black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Gap(16),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.response.length,
                            itemBuilder: (context, index) {
                              return AssetMobileData(context,data: data.response[index]);
                            }),
                      ),
                      Gap(16),

                      CustomButton(
                          title: continuee,
                          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 36),
                          onTap: (){

                            int length = 0 ;
                            List assetsList = [];

                            for(int i = 0; i< data.response.length; i++){
                                print("Assets name $i  --->>> ${data.response[i].assetCategory}");
                                print("Selected Assets name i----->>> ${data.response[i].selectedAssets.length}");

                                length += data.response[i].selectedAssets.length;

                                print("length --->>> ${length}");
                                for(int j = 0; j< data.response[i].selectedAssets.length; j++){
                                print("Selected Assets name $j ----->>> ${data.response[i].selectedAssets[j].formStatus}");

                                if(data.response[i].selectedAssets[j].formStatus == "Completed"){
                                  assetsList.add(data.response[i].selectedAssets[j].formStatus);
                                    if(assetsList.length == length){
                                      print("Enter Value Success---->>>");
                                      navigationService.push(routeCustomeBottomNavigationBar);
                                    }else{
                                      print("Enter Value---->>>");
                                      displayToast("Complete Your Selected Assets");
                                    }

                                }

                              }
                            }

                          },
                      ),

                      Gap(16),

                      Text(
                        noteItIs,
                        style: TextStyle(
                            color: black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Gap(16),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (obj, trace) => ErrorWidget(obj),
          loading: () => const Loading());
    });
  }
}

AssetMobileData(context,{
  required Response data,
} ) {
  return CustomExpandableCard(
    index: 0,
    isExpanded: ValueNotifier(1),
    border: Border.all(color: Color(int.parse("0xff${data.categoryBoxColor}"))),
    assetimage: data.categoryImage,
    assetname: data.assetCategory,
    boxcolor: Color(int.parse("0xff${data.categoryBoxColor}")),
    expandedChild: Container(
      // padding: EdgeInsets.only(top: 10),
      // height: 150,
      // width: Utils.getWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        color:  assetsBoxColor,
        // color:  Color(0xffE3E1E4),
      ),

      child: Column(
        children: [
          ...data.selectedAssets
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ImmovableProperty()));

                    setString(prefSubscriptionAssetId, e.subscriptionAssetId );

                    print("hello ---->>>>> ${e.assetName}");


                    if(e.assetName.toString() == "Company Transfer"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeMiscellaneousCompany);
                      }else{
                        displayToast("Please Next Assets Select");
                      }
                    }else if(e.assetName.toString() == "GST Transfer" ){
                      navigationService.push(routeMiscellaneousCompany);


                    }else if( e.assetName.toString() == "Shares Transfer" ){
                      navigationService.push(routeMiscellaneousCompany);


                    }else if(e.assetName.toString() == "Mutual Funds Transfer"){
                      navigationService.push(routeMiscellaneousCompany);


                    }else if(e.assetName.toString() == "Vehicles"){
                      navigationService.push(routePersonalVehicle);

                    }else if(e.assetName.toString() == "Precious Stones, Metals, Jewelers"){
                      navigationService.push(routePersonal);

                    }else if( e.assetName.toString() == "Clubs And Other Memberships"){
                      navigationService.push(routePersonal);

                    }else if(e.assetName.toString() == "Land/ Plot" ){
                      navigationService.push(routeImmovableProperty);

                    }else if( e.assetName.toString() == "Office/ Shop" ){
                      navigationService.push(routeImmovableProperty);

                    }else if( e.assetName.toString() == "House/ Apartment" ){
                      navigationService.push(routeImmovableProperty);

                    }else if( e.assetName.toString() == "Building" ){
                      navigationService.push(routeImmovableProperty);

                    }else if(e.assetName.toString() == "Demat Account"  ){
                      navigationService.push(routeInvestmentsDematAccount);

                    }else if( e.assetName.toString() == "Shares Liquidation"){
                      navigationService.push(routeInvestmentsDematAccount);

                    }else if( e.assetName.toString() == "Mutual Fund Liquidation" ){
                      navigationService.push(routeInvestmentsDematAccount);

                    }else if(e.assetName.toString() == "EPF"){
                      navigationService.push(routeGovernmentEPF);

                    }else if(e.assetName.toString() == "National Pensions Scheme"){
                      navigationService.push(routeGovernmentNPS);

                    }else if(e.assetName.toString() == "Atal Pension Yojana"){
                      navigationService.push(routeGovernmentAPY);

                    }else if(e.assetName.toString() == "PPF"){
                      navigationService.push(routeGovernmentPPF);

                    }else if(e.assetName.toString() == "Kisan Vikas Patra"){
                      navigationService.push(routeGovernmentKVP);

                    }else if(e.assetName.toString() == "Electricity") {
                      navigationService.push(routeUtilityElectricity);

                    }else if(e.assetName.toString() == "Phones" ) {
                      navigationService.push(routeUtility);

                    }else if(e.assetName.toString() == "Internet" ) {
                      navigationService.push(routeUtility);

                    }else if( e.assetName.toString() == "Gas" ) {
                      navigationService.push(routeUtility);

                    }else if(e.assetName.toString() == "Life Insurance") {
                      navigationService.push(routeBankLifeInsurance);

                    }else if(e.assetName.toString() == "Bank Accounts" ) {
                      navigationService.push(routeBankSavingsAccounts);

                    }else if( e.assetName.toString() == "Bank Locker"  ) {
                      navigationService.push(routeBankSavingsAccounts);

                    }else if( e.assetName.toString() == "Fixed Deposits") {
                      navigationService.push(routeBankSavingsAccounts);

                    }else if( e.assetName.toString() == "Bank Deposits" ) {
                      navigationService.push(routeBankSavingsAccounts);

                    }

                      //     colorBox == true ?
                    //    navigationService.push(routeAssetsInformation,arguments: {navSelectedindex: data["description"].indexOf(e),navDattaa: data,});
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
                        color:Color(int.parse("0xff${data.categoryBoxColor}")),
                        // color: blue,
                        height: 0,
                      ),
                      Container(
                        width: Utils.getWidth(context),
                        padding: EdgeInsets.only(left: 20, top: 6, bottom: 6),
                        child: Text(
                          '${e.assetName}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: black,
                              height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    ),
  );
}
