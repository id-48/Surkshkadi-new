import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/immovable_property_screen.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_mobile_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';


class Assets extends HookConsumerWidget {
  const Assets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: assets,
        backonTap: () {
          Navigator.pop(context);
        },
        notionTap: () {},
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(noOneElseEven,
                style: TextStyle(color: black,fontSize: 13,fontWeight: FontWeight.w500),),

              Gap(16),

              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: planData.length,
                    itemBuilder: (context, index) {
                      return  AssetMobileData(planData[index],context,colorBox: true);
                    }),
              ),

              Gap(16),

              Text(noOneElseEven,
                style: TextStyle(color: black,fontSize: 13,fontWeight: FontWeight.w500),),

              Gap(16),


            ],
          ),
        ),
      ),
    );
  }

}


AssetMobileData(var data,context,{
  bool colorBox = true,
}){
  return  CustomExpandableCard(
    index: 0,
    isExpanded: ValueNotifier(1),
    border: Border.all(color: colorBox == false ? blue : data["color"]),
    assetimage: data["image"],
    assetname: data["title"],
    boxcolor: colorBox == true ? data["color"] : assetsBoxColor,
    expandedChild: Container(
      padding: EdgeInsets.only(top: 10),
      // height: 150,
      // width: Utils.getWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        color: colorBox == false ? assetsBoxColor : Color(0xffE3E1E4),
        // border: Border.all(color: blue),
      ),

      child: Column(
        children: [
          ...data["description"]
              .map(
                (e) =>
                   GestureDetector(
                     onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)  =>
                          ImmovableProperty()));
                   //     colorBox == true ?
                   //    navigationService.push(routeAssetsInformation,arguments: {navSelectedindex: data["description"].indexOf(e),navDattaa: data,});
                                          // :
                      // navigationService.push(routeAssetsInformationWeb,arguments: {navSelectIndex : data["description"].indexOf(e), navSelectDattaa : data });
                     //  data.indexof(e);
                     },
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Divider(thickness: 1.2, endIndent: 0, color: blue,height: 0,),

                         Container(
                           width: Utils.getWidth(context),
                           padding: EdgeInsets.only(left: 20,top: 6,bottom: 6),
                           child: Text(
                             '${e["descrip"]}',
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
