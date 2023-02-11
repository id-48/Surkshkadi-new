import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_web_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/partner_with_web_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/start_partner_with_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/about_us_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';

class CustomAppbarWeb extends HookConsumerWidget {
  final bool boxShadow;
  final bool button;
  final int index;
  final GlobalKey<ScaffoldState>? scaffoldkey;
  const CustomAppbarWeb({
    Key? key,
    this.button = true,
    this.boxShadow = false,
    required this.index,
    this.scaffoldkey
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedindex = useState<int>(index);



    return Container(
      // height: 154,
      padding: EdgeInsets.only(bottom: 20,top: 20),
      width: Utils.getWidth(context),
      decoration: BoxDecoration(
        color: white,
        border: Border(
          bottom: BorderSide(
            color: navyblue,
          ),
        ),
        boxShadow: [
          boxShadow == true
              ? BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 3.0,
                  offset: Offset(0.0, 3.0))
              : BoxShadow(),
        ],
      ),
      // color: Colors.lightBlueAccent,
      child: MediaQuery.of(context).size.width <= 1220
          ? Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                       scaffoldkey?.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu)),
                  Image.asset(
                    icLogo,
                    scale: 6,
                  ),

                  button == true
                              ? Center(
                            child: SizedBox(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 9),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  'Signup / Login',
                                  style: TextStyle(fontSize: 17, color: white),
                                ),
                              ),
                            ),
                          )
                              : Container(),
                ],
              ),
          )
          : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                icLogo,
                scale: 6,
              ),
              InkWell(
                    onTap: () {
                      selectedindex.value = 0;
                      navigationService.push(routeDashboardWeb);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DashBoardWeb()));
                    },
                    child: Center(
                        child: Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 17,
                              color: selectedindex.value == 0
                                  ? buttonColor
                                  : textColor),
                        ))),

            InkWell(
                    onTap: () {
                      selectedindex.value = 1;
                      navigationService.push(routeAboutUsWeb);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AboutUsWeb()));
                    },
                    child: Center(
                        child: Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 17,
                              color: selectedindex.value == 1
                                  ? buttonColor
                                  : textColor),
                        ))),
              InkWell(
                    onTap: () {
                      selectedindex.value = 2;
                      navigationService.push(routePlansWeb);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PlansWeb()));
                    },
                    child: Center(
                        child: Text(
                          'Plans',
                          style: TextStyle(
                              fontSize: 17,
                              color: selectedindex.value == 2
                                  ? buttonColor
                                  : textColor),
                        ))),

             InkWell(
                    onTap: () {
                      selectedindex.value = 3;
                      navigationService.push(routePartnerWithWeb);
                    },
                    child: Center(
                        child: Text(
                          partnerWithUs,
                          style: TextStyle(
                              fontSize: 17,
                              color: selectedindex.value == 3
                                  ? buttonColor
                                  : textColor),
                        ))),

             Center(
                    child: Text(
                      faq,
                      style: TextStyle(fontSize: 17, color: textColor),
                    )),
          Center(
                    child: Text(
                      'My Account',
                      style: TextStyle(fontSize: 17, color: textColor),
                    )),

             button == true
                    ? Center(
                        child: SizedBox(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 9),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Signup / Login',
                              style: TextStyle(
                                  fontSize: 17, color: white),
                            ),
                          ),
                        ),
                      )
                    : Container(),

            Container(
                    // color: Colors.redAccent,
                        height: 50 ,
                        width:  160 ,
                        child: Image.asset(startupIndia)),

            ],
          ),
    );
  }
}

//  Widget _drawer(int index,BuildContext context){
//    final selectedindex = useState<int>(index);
//
//    return Drawer(
//     backgroundColor: white,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//             onTap: () {
//               selectedindex.value == 0;
//               navigationService.push(routeDashboardWeb);
//             },
//             child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.width <= 500
//                           ? 0
//                           : 12),
//                   child: Text(
//                     'Home',
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: selectedindex.value == 0
//                             ? buttonColor
//                             : textColor),
//                   ),
//                 ))),
//
//         InkWell(
//             onTap: () {
//               selectedindex.value == 1;
//               navigationService.push(routeAboutUsWeb);
//             },
//             child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.width <= 550
//                           ? 0
//                           : 12),
//                   child: Text(
//                     'About Us',
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: selectedindex.value == 1
//                             ? buttonColor
//                             : textColor),
//                   ),
//                 ))),
//
//         InkWell(
//             onTap: () {
//               selectedindex.value == 2;
//               navigationService.push(routePlansWeb);
//             },
//             child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.width <= 550
//                           ? 0
//                           : 12),
//                   child: Text(
//                     'Plans',
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: selectedindex.value == 2
//                             ? buttonColor
//                             : textColor),
//                   ),
//                 ))),
//         InkWell(
//             onTap: () {
//               selectedindex.value == 3;
//               navigationService.push(routePartnerWithWeb);
//             },
//             child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.width <= 550
//                           ? 0
//                           : 12),
//                   child: Text(
//                     partnerWithUs,
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: selectedindex.value == 3
//                             ? buttonColor
//                             : textColor),
//                   ),
//                 ))),
//
//         Center(
//             child: Padding(
//               padding: EdgeInsets.only(
//                   bottom:
//                   MediaQuery.of(context).size.width <= 550 ? 0 : 12),
//               child: Text(
//                 faq,
//                 style: TextStyle(fontSize: 17, color: textColor),
//               ),
//             )),
//
//         Center(
//             child: Padding(
//               padding: EdgeInsets.only(
//                   bottom:
//                   MediaQuery.of(context).size.width <= 550 ? 0 : 12),
//               child: Text(
//                 'My Account',
//                 style: TextStyle(fontSize: 17, color: textColor),
//               ),
//             )),
//
//         Center(
//           child: Container(
//             // color: Colors.redAccent,
//               margin: EdgeInsets.only(
//                   right:
//                   MediaQuery.of(context).size.width <= 550 ? 0 : 20),
//               child: Padding(
//                   padding: EdgeInsets.only(
//                       top:  MediaQuery.of(context).size.width <= 550 ? 0 : 30,
//                       bottom: MediaQuery.of(context).size.width <= 550
//                           ? 0
//                           : 10),
//                   child: Image.asset(startupIndia,scale: 2,))),
//         ),
//       ],
//
//     ),
//   );
// }

///     old web appbar code

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:responsive_grid/responsive_grid.dart';
// import 'package:surakshakadi/di/locator.dart';
// import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_web_screen.dart';
// import 'package:surakshakadi/ui/Screens/cp_web_screeen/partner_with_web_screen.dart';
// import 'package:surakshakadi/ui/Screens/cp_web_screeen/start_partner_with_web_screen.dart';
// import 'package:surakshakadi/ui/Screens/dashboard/Components/about_us_web_screen.dart';
// import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
// import 'package:surakshakadi/utils/color_utils.dart';
// import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
// import 'package:surakshakadi/utils/image_utils.dart';
// import 'package:surakshakadi/utils/strings.dart';
// import 'package:surakshakadi/utils/utils.dart';
//
// class CustomAppbarWeb extends HookConsumerWidget {
//   final bool boxShadow;
//   final bool button;
//   final int index;
//
//   const CustomAppbarWeb({
//     Key? key,
//     this.button = true,
//     this.boxShadow = false,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedindex = useState<int>(index);
//
//     return Container(
//       // height: 154,
//       padding: EdgeInsets.only(bottom: 20),
//       width: Utils.getWidth(context),
//       decoration: BoxDecoration(
//         color: white,
//         border: Border(
//           bottom: BorderSide(
//             color: navyblue,
//           ),
//         ),
//         boxShadow: [
//           boxShadow == true
//               ? BoxShadow(
//               color: Colors.black12,
//               spreadRadius: 3.0,
//               offset: Offset(0.0, 3.0))
//               : BoxShadow(),
//         ],
//       ),
//       // color: Colors.lightBlueAccent,
//       child: MediaQuery.of(context).size.width <= 924  ? Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding:  EdgeInsets.only(
//               bottom: MediaQuery.of(context).size.width <= 705 ? 10 :  0.0,
//               top:  MediaQuery.of(context).size.width <= 924 ? 10 :  0.0,
//
//             ),
//             child: Image.asset(
//               icLogo,
//               scale: 6,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).orientation == Orientation.landscape ? 40 : MediaQuery.of(context).size.width <= 700 ? 0 : 20),
//             child: ResponsiveGridRow(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // ResponsiveGridCol(
//                 //
//                 //     // xl: 1,
//                 //     lg: 1,
//                 //     md: 2,
//                 //     xs: 2,
//                 //     child: Container()),
//                 ResponsiveGridCol(
//                   // xl: 1,
//                   lg: 1,
//                   md: 1,
//                   sm: 2,
//                   xs: 2,
//                   child: InkWell(
//                       onTap: () {
//                         selectedindex.value = 0;
//                         navigationService.push(routeDashboardWeb);
//
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => DashBoardWeb()));
//                       },
//                       child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.width <= 500
//                                     ? 0
//                                     : 12),
//                             child: Text(
//                               'Home',
//                               style: TextStyle(
//                                   fontSize: 17,
//                                   color: selectedindex.value == 0
//                                       ? buttonColor
//                                       : textColor),
//                             ),
//                           ))),
//                 ),
//                 ResponsiveGridCol(
//                   lg: 1,
//                   // xl: 1,
//                   md: 3,
//                   sm: 3,
//                   xs: 3,
//                   child: InkWell(
//                       onTap: () {
//                         selectedindex.value = 1;
//                         navigationService.push(routeAboutUsWeb);
//
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => AboutUsWeb()));
//                       },
//                       child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.width <= 550
//                                     ? 0
//                                     : 12),
//                             child: Text(
//                               'About Us',
//                               style: TextStyle(
//                                   fontSize: 17,
//                                   color: selectedindex.value == 1
//                                       ? buttonColor
//                                       : textColor),
//                             ),
//                           ))),
//                 ),
//                 ResponsiveGridCol(
//                   lg: 1,
//                   // xl: 1,
//                   md: 1,
//                   sm: 2,
//                   xs: 2,
//                   child: InkWell(
//                       onTap: () {
//                         selectedindex.value = 2;
//                         navigationService.push(routePlansWeb);
//
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => PlansWeb()));
//                       },
//                       child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.width <= 550
//                                     ? 0
//                                     : 12),
//                             child: Text(
//                               'Plans',
//                               style: TextStyle(
//                                   fontSize: 17,
//                                   color: selectedindex.value == 2
//                                       ? buttonColor
//                                       : textColor),
//                             ),
//                           ))),
//                 ),
//                 ResponsiveGridCol(
//                   lg: 2,
//                   // xl: 2,
//                   md: 4,
//                   sm: 5,
//                   xs: 5,
//                   child: InkWell(
//                       onTap: () {
//                         selectedindex.value = 3;
//                         navigationService.push(routePartnerWithWeb);
//                       },
//                       child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.width <= 550
//                                     ? 0
//                                     : 12),
//                             child: Text(
//                               partnerWithUs,
//                               style: TextStyle(
//                                   fontSize: 17,
//                                   color: selectedindex.value == 3
//                                       ? buttonColor
//                                       : textColor),
//                             ),
//                           ))),
//                 ),
//                 // ResponsiveGridCol(
//                 //   // lg: 0,
//                 //   // xl: 0,
//                 //   md: 1,
//                 //   xs: 2,
//                 //   child: Container(),
//                 // ),
//                 ResponsiveGridCol(
//                   lg: 1,
//                   // xl: 1,
//                   md: 1,
//                   sm: 2,
//                   xs: 2,
//                   child: Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             bottom: MediaQuery.of(context).size.width <= 550
//                                 ? 0
//                                 : 12),
//                         child: Text(
//                           faq,
//                           style: TextStyle(fontSize: 17, color: textColor),
//                         ),
//                       )),
//                 ),
//                 ResponsiveGridCol(
//                   // xl: 2,
//                   lg: 2,
//                   md: 3,
//                   sm: 3,
//                   xs: 3,
//                   child: Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             bottom: MediaQuery.of(context).size.width <= 550
//                                 ? 0
//                                 : 12),
//                         child: Text(
//                           'My Account',
//                           style: TextStyle(fontSize: 17, color: textColor),
//                         ),
//                       )),
//                 ),
//                 ResponsiveGridCol(
//                   lg: 2,
//                   // xl: 2,
//                   md: 5,
//                   sm: 5,
//                   xs: 5,
//
//                   child: button == true
//                       ? Center(
//                     child: SizedBox(
//                       child: Container(
//                         margin: EdgeInsets.only(bottom: 9),
//                         padding: EdgeInsets.symmetric(
//                             vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: buttonColor,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Text(
//                           'Signup / Login',
//                           style: TextStyle(fontSize: 17, color: white),
//                         ),
//                       ),
//                     ),
//                   )
//                       : Container(),
//                 ),
//
//                 ResponsiveGridCol(
//                   // xl: 2,
//                   lg: 2,
//                   md: 3,
//                   sm: 3,
//                   xs: 3,
//                   child: Container(
//                     // color: Colors.redAccent,
//                       margin: EdgeInsets.only(right: MediaQuery.of(context).size.width <= 550 ? 0 : 20 ),
//                       child: Padding(
//                           padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).size.width <= 550
//                                   ? 0
//                                   : 12),
//                           child: Image.asset(startupIndia)
//                       )),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ) :Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//               flex: 2,
//               child: Image.asset(
//                 icLogo,
//                 scale: 6,
//               )),
//           Expanded(
//             flex: 8,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).orientation == Orientation.landscape ? 40 : MediaQuery.of(context).size.width <= 700 ? 0 : 20),
//               child: ResponsiveGridRow(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // ResponsiveGridCol(
//                   //
//                   //     // xl: 1,
//                   //     lg: 1,
//                   //     md: 2,
//                   //     xs: 2,
//                   //     child: Container()),
//                   ResponsiveGridCol(
//                     // xl: 1,
//                     lg: 1,
//                     md: 1,
//                     sm: 2,
//                     xs: 2,
//                     child: InkWell(
//                         onTap: () {
//                           selectedindex.value = 0;
//                           navigationService.push(routeDashboardWeb);
//
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => DashBoardWeb()));
//                         },
//                         child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).size.width <= 500
//                                       ? 0
//                                       : 12),
//                               child: Text(
//                                 'Home',
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     color: selectedindex.value == 0
//                                         ? buttonColor
//                                         : textColor),
//                               ),
//                             ))),
//                   ),
//                   ResponsiveGridCol(
//                     lg: 1,
//                     // xl: 1,
//                     md: 3,
//                     sm: 3,
//                     xs: 3,
//                     child: InkWell(
//                         onTap: () {
//                           selectedindex.value = 1;
//                           navigationService.push(routeAboutUsWeb);
//
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => AboutUsWeb()));
//                         },
//                         child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).size.width <= 550
//                                       ? 0
//                                       : 12),
//                               child: Text(
//                                 'About Us',
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     color: selectedindex.value == 1
//                                         ? buttonColor
//                                         : textColor),
//                               ),
//                             ))),
//                   ),
//                   ResponsiveGridCol(
//                     lg: 1,
//                     // xl: 1,
//                     md: 1,
//                     sm: 2,
//                     xs: 2,
//                     child: InkWell(
//                         onTap: () {
//                           selectedindex.value = 2;
//                           navigationService.push(routePlansWeb);
//
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => PlansWeb()));
//                         },
//                         child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).size.width <= 550
//                                       ? 0
//                                       : 12),
//                               child: Text(
//                                 'Plans',
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     color: selectedindex.value == 2
//                                         ? buttonColor
//                                         : textColor),
//                               ),
//                             ))),
//                   ),
//                   ResponsiveGridCol(
//                     lg: 2,
//                     // xl: 2,
//                     md: 4,
//                     sm: 5,
//                     xs: 5,
//                     child: InkWell(
//                         onTap: () {
//                           selectedindex.value = 3;
//                           navigationService.push(routePartnerWithWeb);
//                         },
//                         child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).size.width <= 550
//                                       ? 0
//                                       : 12),
//                               child: Text(
//                                 partnerWithUs,
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     color: selectedindex.value == 3
//                                         ? buttonColor
//                                         : textColor),
//                               ),
//                             ))),
//                   ),
//                   // ResponsiveGridCol(
//                   //   // lg: 0,
//                   //   // xl: 0,
//                   //   md: 1,
//                   //   xs: 2,
//                   //   child: Container(),
//                   // ),
//                   ResponsiveGridCol(
//                     lg: 1,
//                     // xl: 1,
//                     md: 1,
//                     sm: 2,
//                     xs: 2,
//                     child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).size.width <= 550
//                                   ? 0
//                                   : 12),
//                           child: Text(
//                             faq,
//                             style: TextStyle(fontSize: 17, color: textColor),
//                           ),
//                         )),
//                   ),
//                   ResponsiveGridCol(
//                     // xl: 2,
//                     lg: 2,
//                     md: 3,
//                     sm: 3,
//                     xs: 3,
//                     child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).size.width <= 550
//                                   ? 0
//                                   : 12),
//                           child: Text(
//                             'My Account',
//                             style: TextStyle(fontSize: 17, color: textColor),
//                           ),
//                         )),
//                   ),
//                   ResponsiveGridCol(
//                     lg: 2,
//                     // xl: 2,
//                     md: 5,
//                     sm: 5,
//                     xs: 5,
//
//                     child: button == true
//                         ? Center(
//                       child: SizedBox(
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 9),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 16),
//                           decoration: BoxDecoration(
//                             color: buttonColor,
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: Text(
//                             'Signup / Login',
//                             style: TextStyle(fontSize: 17, color: white),
//                           ),
//                         ),
//                       ),
//                     )
//                         : Container(),
//                   ),
//
//                   ResponsiveGridCol(
//                     // xl: 2,
//                     lg: 2,
//                     md: 3,
//                     sm: 3,
//                     xs: 3,
//                     child: Container(
//                       // color: Colors.redAccent,
//                         margin: EdgeInsets.only(right: MediaQuery.of(context).size.width <= 550 ? 0 : 20 ),
//                         child: Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.width <= 550
//                                     ? 0
//                                     : 12),
//                             child: Image.asset(startupIndia)
//                         )),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ) ,
//     );
//   }
// }
