import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_mobile_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';

class AssetsWeb extends HookConsumerWidget {
  const AssetsWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LogoBackButton(backButton: false),

            Gap(80),

            Row(
              children: [
                Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.21 : 16),
                Text(assets,style: GoogleFonts.bonaNova(textStyle:  TextStyle(fontSize: 22,fontWeight: FontWeight.w700)),),
              ],
            ),
            Gap(10),
            Container(
              child: Row(
                children: [
                  Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.21 : 16),
                  Expanded(child: Text(noOneElseEven,style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w100),)),
                ],
              ),
            ),

            Gap(40),

            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.21 : 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: planData.length,
                  itemBuilder: (context, index) {
                    return index == 7 ? Container() : AssetWebData(planData[index],context,colorBox: false);
                  }),
            ),

            Gap(100),

          ],
        ),
      ),
    );
  }
}


AssetWebData(var data,context,{
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

                    //    Navigator.push(context, MaterialPageRoute(builder: (context)  =>
                    //        AssetsInformation(selectedindex: data["description"].indexOf(e), dattaa: data, )));
                    // colorBox == true ?
                    // navigationService.push(routeAssetsInformation,arguments: {navSelectedindex: data["description"].indexOf(e),navDattaa: data,})
                    //     :
                    navigationService.push(routeAssetsInformationWeb,arguments: {navSelectIndex : data["description"].indexOf(e), navSelectDattaa : data });
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

