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

    final length = useState<int>(0);
    final assetsList = useState<List>([]);

    useEffect(() {
      ReqGetSelectedAssets PlanChatSubPayment = ReqGetSelectedAssets(
          userId: int.parse(getString(prefUserID))
          );

      ref
          .read(getSelectedAssetsProvider.notifier)
          .getSelectedAssets(context: context, data: PlanChatSubPayment).then((value) {
            if(value!.status == 1){
              for(int i = 0; i< value.response.length; i++){
                  length.value += value.response[i].selectedAssets.length;
                for(int j = 0; j< value.response[i].selectedAssets.length; j++) {
                  print("length useEffect --->>> ${length.value}");
                  print("assets length Status $i $j --->>>${value.response[i].selectedAssets[j].formStatus}");

                  if (value.response[i].selectedAssets[j].formStatus == "Completed") {
                    assetsList.value.add(value.response[i].selectedAssets[j].formStatus);
                    print("assets length useEffect --->>> ${assetsList.value.length} ");

                  }
                }
              }
            }else{
              displayToast("No Data Found");
            }
      });




    }, []);

    final selectedAssetsController = ref.watch(getSelectedAssetsProvider);



    return StatefulBuilder(builder: (BuildContext context, setState) {
      return selectedAssetsController.when(
          data: (data) {
            return WillPopScope(
              onWillPop: (){
                navigationService.push(routeCustomBottomNavigationBar);
                return Future.value(false);
              },
              child: Scaffold(
                appBar: CustomAppBar(
                  title: assets,
                  backonTap: () {
                    Navigator.pop(context);
                    // navigationService.push(routeCustomeBottomNavigationBar);
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

                                  print("length ----- >> ${length.value}");
                                  print("length ----- >> ${assetsList.value.length}");

                                          if(assetsList.value.length == length.value){
                                            navigationService.push(routeCustomBottomNavigationBar);
                                          }else{
                                            displayToast("Complete Your Selected Assets");
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

                     setString(prefSubscriptionAssetId, e.subscriptionAssetId );

                    if(e.assetName.toString() == "Company Transfer"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeMiscellaneousCompany);
                      }else{
                        displayToast("Please Next Assets Select");
                      }
                    }else if(e.assetName.toString() == "GST Transfer" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeMiscellaneousCompany);

                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Shares Transfer" ){

                      if(e.formStatus == "Pending") {
                        navigationService.push(routeMiscellaneousCompany);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Mutual Funds Transfer"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeMiscellaneousCompany);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Vehicles"){
                      navigationService.push(routePersonalVehicle);
                      if(e.formStatus == "Pending") {
                        navigationService.push(routePersonalVehicle);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Precious Stones, Metals, Jewelers"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routePersonalVehicle);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Clubs And Other Memberships"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routePersonal);

                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Land/ Plot" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeImmovableProperty);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Office/ Shop" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeImmovableProperty);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "House/ Apartment" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeImmovableProperty);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Building" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeImmovableProperty);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Demat Account"  ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeInvestmentsDematAccount);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Shares Liquidation"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeInvestmentsDematAccount);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Mutual Fund Liquidation" ){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeInvestmentsDematAccount);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "EPF"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeGovernmentEPF);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "National Pensions Scheme"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeGovernmentNPS);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Atal Pension Yojana"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeGovernmentAPY);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "PPF"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeGovernmentPPF);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Kisan Vikas Patra"){
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeGovernmentKVP);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Electricity") {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeUtilityElectricity);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Phones" ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeUtility);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Internet" ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeUtility);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Gas" ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeUtility);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Life Insurance") {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeBankLifeInsurance);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if(e.assetName.toString() == "Bank Accounts" ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeBankSavingsAccounts);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Bank Locker"  ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeBankSavingsAccounts);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Fixed Deposits") {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeBankSavingsAccounts);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

                    }else if( e.assetName.toString() == "Bank Deposits" ) {
                      if(e.formStatus == "Pending") {
                        navigationService.push(routeBankSavingsAccounts);
                      }else{
                        displayToast("Please Next Assets Select");
                      }

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
