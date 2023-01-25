import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/req_get_selected_assets.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/immovable_property_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/store_assets_form_view_modal.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_mobile_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/loading.dart';

import '../../../data/model/home/dashboard/assets_details/get_selected_assets/res_get_selected_assets.dart';

class AssetsMobile extends HookConsumerWidget {
  const AssetsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ReqGetSelectedAssets PlanChatSubPayment = ReqGetSelectedAssets(
          userId: 1
          // userId: int.parse(getString(prefUserID))
          );

      ref
          .read(getSelectedAssetsProvider.notifier)
          .getSelectedAssets(context: context, data: PlanChatSubPayment);
    }, []);

    final selectedAssetsController = ref.watch(getSelectedAssetsProvider);

    return StatefulBuilder(builder: (BuildContext context, setState) {
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
    assetimage: bank,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImmovableProperty()));

                    setString(prefSubscriptionAssetId, e.subscriptionAssetId );

                    print("hello ---->>>>> ${e.assetName}");

                    if(e.assetName.toString() == "Demat Account"){
                      print("hello Demat Account ---->>>>>");


                    }else if(e.assetName.toString() == "Shares Liqudation"){
                      print("hello Shares Liqudation ---->>>>>");

                    }else if(e.assetName.toString() == "EPF"){
                      print("hello EPF ---->>>>>");

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
