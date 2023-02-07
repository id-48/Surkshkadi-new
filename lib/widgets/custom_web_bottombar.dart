import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';

class CustomWebBottomBar extends HookWidget {
  final bool bgColor;
  const CustomWebBottomBar({
    Key? key,
    this.bgColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("test    ----->${MediaQuery.of(context).size.width}");
    return Container(
      // height: 330,
      padding: EdgeInsets.only(top: 30, bottom: 40),
      decoration: BoxDecoration(
        color: white,
        border: Border(
          top: BorderSide(color: blue),
        ),
        // color: bgColor == true ? indigo : white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveGridRow(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveGridCol(lg: 1, md: 1, xs: 1, child: Container()),
              ResponsiveGridCol(
                lg: Utils.getWidth(context) < 1068 ? 4 : 3,
                md: 5,
                xs: Utils.getWidth(context) < 630 ? 10 : 6,
                child: Container(
                  // color: Colors.purpleAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        icLogo,
                        scale: 6,
                      ),

                      // Gap(10),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 10),
                      //   child: Text(
                      //     getOurApp,
                      //     style: TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      Gap(10),
                      Row(
                        children: [
                          Gap(6),
                          Container(
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              child: Row(
                                children: [
                                  Image.asset(
                                    appStore,
                                    scale: 20,
                                    color: Colors.white,
                                  ),
                                  Gap(2),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Available on the",
                                        style: TextStyle(
                                            fontFamily: "Nunito Sans",
                                            fontSize: 8,
                                            color: white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "App Store",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Nunito Sans",
                                            color: white,
                                            letterSpacing: 0.8,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(6),
                          Container(
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 2),
                              child: Row(
                                children: [
                                  Image.asset(googlePlay, scale: 20),
                                  Gap(2),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "GET IT ON",
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: "Nunito Sans",
                                            color: white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Google Play",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Nunito Sans",
                                            color: white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Image.asset(
                        visaMasterUpi,
                        scale: 4.5,
                      ),
                      Gap(10),
                      Image.asset(
                        msmeStart,
                        scale: 3.5,
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: Utils.getWidth(context) < 630 ? 1 : 0,
                  child: Container()),
              ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: Utils.getWidth(context) < 630 ? 1 : 0,
                  child: Container()),
              ResponsiveGridCol(
                lg: Utils.getWidth(context) < 1068 ? 3 : 2,
                md: 3,
                xs: 5,
                child: Container(
                  // color: Colors.greenAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Utils.getWidth(context) < 628 ? 40 : 0),
                      Text(
                        quickLinks,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xFF002E9E)),
                      ),
                      Gap(16),
                      Text(
                        homee,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        aboutUs,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        plans,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        partnerWithUs,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        faqs,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        myAccount,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: Utils.getWidth(context) < 630 ? 0 : 1,
                  child: Container()),
              ResponsiveGridCol(lg: 0, md: 0, xs: 1, child: Container()),
              ResponsiveGridCol(
                lg: Utils.getWidth(context) < 1068 ? 3 : 2,
                md: 3,
                xs: Utils.getWidth(context) < 630 ? 5 : 4,
                child: Container(
                  // color: Colors.lightBlue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Utils.getWidth(context) < 770 ? 40 : 0),
                      Text(
                        legall,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xFF002E9E)),
                      ),
                      Gap(16),
                      Text(
                        referAndEarn,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        termsConditions,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        privacyPolicy,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        disclaimer,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Gap(7),
                      Text(
                        contactUs,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1068 ? 1 : 0,
                  md: 1,
                  xs: Utils.getWidth(context) < 630 ? 1 : 0,
                  child: Container()),
              ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1068 ? 1 : 0,
                  md: 0,
                  xs: 0,
                  child: Container()),
              ResponsiveGridCol(
                // lg: Utils.getWidth(context) < 1263 ? 4 :3,
                lg: Utils.getWidth(context) > 1263
                    ? 3
                    : Utils.getWidth(context) < 1068
                        ? 5
                        : 4,
                md: 6,
                xs: Utils.getWidth(context) < 630 ? 10 : 6,
                // xs: Utils.getWidth(context) < 978 ? 4 : 3,

                child: Container(
                  // color: Colors.amberAccent,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Utils.getWidth(context) < 1068 ? 40 : 0),
                      Text(
                        contact,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xFF002E9E)),
                      ),
                      Gap(10),
                      Text(
                        phNumber,
                        style: TextStyle(
                            height: 1.45,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Gap(16),
                      Text(
                        socialMedia,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      Gap(10),
                      Image.asset(
                        socialMediaIcon,
                        scale: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                copyright,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: black),
                ),
                child: Text("C"),
              ),
              Text(surRightReserved),
            ],
          ),
        ],
      ),
    );
  }
}

// ResponsiveGridRow(
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ResponsiveGridCol(
//                 lg: 2,
//                 xs: 1,
//                 child: Container(),
//               ),
//               ResponsiveGridCol(
//                 lg: 1,
//                 xs: 3,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.purpleAccent,
//                     child: Text(
//                       'Home',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               ResponsiveGridCol(
//                 lg: 1,
//                 xs: 3,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.greenAccent,
//                     child: Text(
//                       'About Us',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               ResponsiveGridCol(
//                 lg: 1,
//                 xs: 3,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.amber,
//                     child: Text(
//                       'Plans',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               ResponsiveGridCol(
//                 lg: 0,
//                 xs: 3,
//                 child: SizedBox(),
//               ),
//               ResponsiveGridCol(
//                 lg: 1,
//                 xs: 2,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.blue,
//                     child: Text(
//                       faq,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               ResponsiveGridCol(
//                 lg: 2,
//                 xs: 3,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.redAccent,
//                     child: Text(
//                       'My Account',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               ResponsiveGridCol(
//                 lg: 2,
//                 xs: 3,
//                 child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     alignment: Alignment.center,
//                     // color: Colors.blue,
//                     child: Text(
//                       getOurApp,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: bgColor == true ? white : textColor,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//             ],
//           ),
//
//           ResponsiveGridRow(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//           ResponsiveGridCol(
//           // lg: 2,
//           xl: 3,
//           md: 2,
//           xs: 1,
//           child: Container(),),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 1,
//                 md: 2,
//                 xs: 3,
//                 child: Text(
//                   disclaimer,
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: bgColor == true ? white : textColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 1,
//                 md: 2,
//                 xs: 4,
//                 child: Text(
//                   privacyPolicy,
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: bgColor == true ? white : textColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl:Utils.getWidth(context) > 1550
//                     ? 1
//                     :  2,
//                 md: 4,
//                 xs: 3,
//                 child: Center(
//                   child: Text(
//                     termsConditions,
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: bgColor == true ? white : textColor,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 0,
//                 md: 0,
//                 xs: 2,
//                 child: Container(),),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 2,
//                 md: 3,
//                 xs: 4,
//                 child: Center(
//                   child: Container(
//                       color: white,
//                       child: Image.asset(
//                         googlePlay,
//                         scale: 4,
//                       )),
//                 ),
//               ),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 2,
//                 md: 3,
//                 xs: 4,
//                 child: Container(
//
//                     alignment: Alignment.centerLeft,
//                   child: Container(
//                       color: white,
//                       child: Image.asset(
//                         appStore,
//                         scale: 4,
//                       )),
//                 ),
//               ),
//             ],
//           ),
//
//           ResponsiveGridRow(
//             children: [
//
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 2,
//                 md: 1,
//                 xs: 1,
//                 child: Container(),),
//
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 2,
//                 md: 3,
//                 xs: 6,
//                 child: Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         insta,
//                         scale: 4,
//                       ),
//                       // Gap(40),
//                       Image.asset(
//                         facebook,
//                         scale: 4,
//                       ),
//                       // Gap(40),
//                       Image.asset(
//                         twitter,
//                         scale: 4,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 1,
//                 md: 1,
//                 xs: 5,
//                 child: Container(),),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 0,
//                 md: 0,
//                 xs: 1,
//                 child: Container(),),
//               ResponsiveGridCol(
//                 // lg: 2,
//                 xl: 4,
//                 md: Utils.getWidth(context) < 970 ? 6 : 5,
//                 xs: 10,
//                 child: Container(
//                   child: Row(
//                     children: [
//                       Text(
//                         copyright,
//                         style: TextStyle(color: bgColor == true ? white : textColor),
//                       ),
//                       Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.symmetric(horizontal: 2.5),
//                           margin: EdgeInsets.symmetric(horizontal: 5),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               border: Border.all(color: white, width: 0.5)),
//                           child: Text(
//                             'C',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: bgColor == true ? white : textColor,
//                                 fontWeight: FontWeight.w200),
//                           )),
//                       Text(
//                         surakRightReserved,
//                         style: TextStyle(
//                             color: bgColor == true ? white : textColor,fontSize: 18
//                             // fontSize: Utils.getWidth(context) == 500
//                             //     ? Utils.getWidth(context) / 100
//                             //     : Utils.getWidth(context) / 75
//                         ),
//                       ),
//                       // SizedBox(
//                       //   width:
//                       //   MediaQuery.of(context).orientation == Orientation.landscape
//                       //       ? MediaQuery.of(context).size.width * 0.15
//                       //       : MediaQuery.of(context).size.width * 0.05,
//                       // ),
//                     ],
//                   ),
//                 ),),
//
//               // Gap(70),
//
//             ],
//           ),
