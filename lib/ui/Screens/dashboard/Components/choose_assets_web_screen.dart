import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/payment_confirmation_plan_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/add_information_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/choose_assets_mobile_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

/// New Code using HookConsumer Widget

class ChooseAssetsWeb extends HookConsumerWidget {
  final String routeCA;
  final List<ResponseSpeciality> dashboardResponseWeb;
  ChooseAssetsWeb({
    Key? key,
    required this.routeCA,
    required this.dashboardResponseWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // // int selectedindex = 0;
    // // int totalLength = 0;
    // // double spacing = 15;
    // // double runSpacing = 15;
    // List<ResponseSpeciality> dashboardHeader = [];
    // List<ResponseSpeciality> dashboardBody = [];
    // final totalLength = useState<int>(0);

    final selectedindex = useState<int>(0);
    final spacing = useState<double>(15);
    final runSpacing = useState<double>(15);
    var checkedIDsWeb = useState<List<String>>([]);
    final dashboardHeaderWeb = useState<List<ResponseSpeciality>>([]);
    final dashboardBodyWeb = useState<List<ResponseSpeciality>>([]);

    useEffect(() {
      dashboardHeaderWeb.value.addAll(dashboardResponseWeb);
      dashboardBodyWeb.value.addAll(dashboardResponseWeb);

      for (int h = 0; h < dashboardBodyWeb.value.length; h++) {
        for (int i = 0;
            i < dashboardBodyWeb.value[h].specialities.length;
            i++) {
          dashboardBodyWeb.value[h].specialities[i].checkValue = false;
        }
      }
    }, []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              LogoBackButton(),
              Gap(60),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 250),
                child: Text(
                  chooseYourAssets,
                  style: GoogleFonts.bonaNova(
                    textStyle:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              Gap(10),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 250),
                child: Text(
                  pleaseSelectThe,
                  style: TextStyle(
                      fontSize: 18, color: indigo, fontWeight: FontWeight.w400),
                ),
              ),

              Gap(30),

              /// api call top na data code 6e
              Container(
                width: Utils.getWidth(context),
                child: Wrap(
                  runSpacing: runSpacing.value,
                  spacing: spacing.value,
                  alignment: WrapAlignment.center,
                  children:
                      List.generate(dashboardHeaderWeb.value.length, (index) {
                    return InkWell(
                      onTap: () {
                        if (index != selectedindex.value) {
                          selectedindex.value = index;
                          dashboardBodyWeb.value.clear();
                          dashboardBodyWeb.value
                              .insert(0, dashboardResponseWeb[index]);
                          dashboardBodyWeb.value.addAll(dashboardResponseWeb);
                          dashboardBodyWeb.value.removeAt(index + 1);
                          setState(() {});
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: Utils.getWidth(context) / 5,
                        decoration: BoxDecoration(
                          color:
                              selectedindex.value == index ? lightoreng : white,
                          border: Border.all(
                              color: selectedindex.value == index
                                  ? lightoreng
                                  : oreng,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(dashboardResponseWeb[index].category,
                            style: TextStyle(
                                fontSize: 16,
                                color: selectedindex.value == index
                                    ? white
                                    : black),
                            textAlign: TextAlign.center),
                      ),
                    );
                  }),
                ),
              ),

              Gap(60),

              /// plan screen ni top na data  json 6e
              // Container(
              //   width: Utils.getWidth(context),
              //   child: Wrap(
              //     runSpacing: 15,
              //     spacing: 15,
              //     alignment: WrapAlignment.center,
              //     children: List.generate(
              //         // dashboardHeader.length,
              //         assetData.length, (index) {
              //       return InkWell(
              //         onTap: () {
              //           selectedindex.value = index;
              //           // assetData.insert(assetData[index]['index'] , assetData[index]);
              //           // assetData.removeAt(assetData[index]['index']);
              //           // tempAssetData.insert(0, assetData[index]);
              //           // var temp = assetData[index];
              //           // var n = assetData[0];
              //           //print("assetData[index].name${assetData[index]}");
              //           // print("assetData[0].name${assetData[index]}");
              //           // print("assetData[index].name${assetData[index].name}");
              //           // assetData.removeAt(0);
              //           // assetData.remove(index);
              //           // assetData.insert(0, temp);
              //           // assetData.insert(index, n);
              //
              //           // print(
              //           //     '---------------->>>>>>>>>>${tempAssetData.length}');
              //           // tempAssetData.removeLast();
              //           //  print(
              //           //     '---------------->>>>>>>>>>${tempAssetData.length}');
              //
              //           setState(() {});
              //
              //           // if (index != selectedindex) {
              //           //   selectedindex = index;
              //           //   dashboardBody.clear();
              //           //   dashboardBody.insert(
              //           //       0, widget.dashboardResponse[index]);
              //           //   dashboardBody.addAll(widget.dashboardResponse);
              //           //   dashboardBody.removeAt(index + 1);
              //           //   setState(() {});
              //           // }
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 45,
              //           width: Utils.getWidth(context) / 5,
              //           decoration: BoxDecoration(
              //             color: selectedindex == index ? lightoreng : white,
              //             border: Border.all(
              //                 color:
              //                     selectedindex == index ? lightoreng : oreng,
              //                 width: 1.0),
              //             borderRadius: BorderRadius.circular(5),
              //           ),
              //           child: Text(assetData[index]['name'],
              //               // dashboardHeader[index].title!,
              //               style: TextStyle(
              //                   fontSize: 16,
              //                   // fontFamily: 'Nunito Sans',
              //                   color: selectedindex == index ? white : black),
              //               textAlign: TextAlign.center),
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              //
              // Gap(60),

              Center(
                child: Container(
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 1000
                      : 2000,
                  width: 900,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dashboardBodyWeb.value.length,
                    // itemCount: assetData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 2
                          : 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 15,
                      childAspectRatio: (2 / 1),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 180,
                        // width: w,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.all(
                          12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderblue,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                // data.title!,
                                dashboardBodyWeb.value[index].category ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: blue,
                                    letterSpacing: 0.5,
                                    fontSize: 15),
                              ),
                            ),
                            ...dashboardBodyWeb.value[index].specialities
                                .map((e) {
                              return GestureDetector(
                                onTap: () {
                                  e.checkValue =
                                      e.checkValue == true ? false : true;
                                  if (e.checkValue == true) {
                                    checkedIDsWeb.value
                                        .add(e.specilityId.toString());
                                    print(
                                        "Checked IDs-- ${checkedIDsWeb.value}");
                                  } else {
                                    checkedIDsWeb.value
                                        .remove(e.specilityId.toString());
                                  }
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    children: [
                                      e.checkValue == true
                                          // dashboardBody[index].checkValue?[data.dataDsc!.indexOf(e)] == true
                                          ? Icon(
                                              Icons.check_box,
                                              color: blue,
                                            )
                                          : Icon(
                                              Icons.check_box_outline_blank,
                                              color: blue,
                                            ),
                                      Gap(5),
                                      Text(
                                        // '${e}',
                                        '${e.specilityTitle}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              Container(
                height: Utils.getHeight(context) * 0.08,
                width: Utils.getWidth(context) * 0.56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Color(0xff037EEE).withOpacity(0.15),),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff037EEE).withOpacity(0.15),
                      offset: const Offset(3.0, 3),
                      blurRadius: 0.7,
                      spreadRadius: 0.5,
                    ),
                    BoxShadow(
                      color: Color(0xff037EEE).withOpacity(0.15),
                      offset: const Offset(-3.0, -3),
                      blurRadius: 0.7,
                      spreadRadius: 0.5,
                    ), //BoxShadow
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      // text: "0",
                                      text: "${checkedIDsWeb.value.length}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: blue)),
                                  TextSpan(
                                      text: itemsSelectedInYourAssets,
                                      style: TextStyle(
                                          color: jerrygreen,
                                          fontSize: 14,
                                          letterSpacing: 0.5)),
                                ],
                              ),
                            ))),
                    Expanded(
                      flex: 1,
                      child:
                          // HookConsumer(
                          //   builder: (context, ref, child) {
                          //     return
                          InkWell(
                        onTap: () async {
                          if (routeCA == "SpecificAsset") {
                            print("routeCA sucess");

                            displayDialogCA(
                                context, ref, checkedIDsWeb.value, true);
                          } else {
                            print("routeCA faild");
                            navigationService.push(routePaymentConfirPlanWeb);
                          }

                          ///
                          //   Map<String, dynamic> arrData = {};
                          //
                          //   for (int i = 0; i < dashboardBody.length; i++) {
                          //     arrData.addAll({'${dashboardBody[i].title}': []});
                          //     for (int j = 0;
                          //     j < dashboardBody[i].dataDsc!.length;
                          //     j++) {
                          //       if (dashboardBody[i].checkValue![j] == true) {
                          //         arrData[dashboardBody[i].title]
                          //             .add(dashboardBody[i].dataDsc![j]);
                          //       }
                          //     }
                          //   }
                          //   ReqChooseAssets data = ReqChooseAssets.fromJson(arrData);
                          ///
                          // routeCA == "SpecificAsset"
                          //     ? navigationService.push(routeAddInfoWeb)
                          //     : navigationService
                          //         .push(routePaymentConfirPlanWeb);
                          ///
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfoWeb()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => WebPaymentConfirmation(routePC: widget.routeCA,)));

                          // await   ref.read(dashboardProvider.notifier).getSingleUserAssets(
                          //      context: context, data: data,).then((value) {
                          //      if(value!.status == true){
                          //        openCheckout(getString(prefSingleAssetsPrice));
                          // openCheckout('100');
                          // }
                          // });

                          // }
                        },
                        child: Container(
                          height: Utils.getHeight(context) * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff3C87E0).withOpacity(0.9),
                                Color(0xff0E3563).withOpacity(0.9)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            continuee,
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                      //   },
                      // )
                    ),
                  ],
                ),
              ),

              Gap(20),

              CustomWebBottomBar(
                bgColor: true,
              ),
            ],
          ),
        ),
      );
    });
  }
}
