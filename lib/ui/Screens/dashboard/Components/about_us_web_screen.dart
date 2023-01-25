// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:responsive_grid/responsive_grid.dart';
// import 'package:surakshakadi/ui/Screens/dashboard/Components/components.dart';
// import 'package:surakshakadi/utils/color_utils.dart';
// import 'package:surakshakadi/utils/constants/app_constant.dart';
// import 'package:surakshakadi/utils/image_utils.dart';
// import 'package:surakshakadi/utils/strings.dart';
// import 'package:surakshakadi/utils/utils.dart';
// import 'package:surakshakadi/widgets/custom_appbar_web.dart';
// import 'package:surakshakadi/widgets/custom_expandable_card.dart';
// import 'package:surakshakadi/widgets/custom_web_bottombar.dart';
//
// class AboutUsWeb extends HookConsumerWidget {
//   const AboutUsWeb({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomAppbarWeb(button: false, index: 1),
//
//             Gap(180),
//             Padding(
//               padding: const EdgeInsets.only(left: 60),
//               child: Text(
//                 moneyIsNotThe,
//                 style: GoogleFonts.bonaNova(
//                   textStyle: TextStyle(
//                       fontSize: 60,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 3,
//                       wordSpacing: 1),
//                 ),
//               ),
//             ),
//             Gap(30),
//             Container(
//               height: Utils.getHeight(context) * 0.54,
//               width: Utils.getWidth(context),
//               color: indigo,
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 70),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           thatIsToGiveWe,
//                           style: TextStyle(
//                               fontSize: 26,
//                               fontWeight: FontWeight.w400,
//                               color: white),
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 35),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black12.withOpacity(0.2),
//                                   blurRadius: 3.0,
//                                   offset: Offset(0.0, 5))
//                             ],
//                           ),
//                           child: Text(
//                             secureNow,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 18,
//                                 color: buttonColor),
//                           ),
//                         ),
//                         Gap(10),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: -260,
//                     right: 50,
//                     bottom: 60,
//                     child: Container(
//                       height: Utils.getHeight(context) * 0.7,
//                       width: Utils.getWidth(context) * 0.54,
//                       // color: black,
//                       child: Image.asset(
//                         aboutBanner,
//                         scale: 4,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Gap(160),
//
//             Padding(
//               padding: const EdgeInsets.only(left: 70, right: 50),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             onePlatform,
//                             style: GoogleFonts.bonaNova(
//                               textStyle: TextStyle(
//                                   color: black,
//                                   fontSize: 60,
//                                   fontWeight: FontWeight.w700,
//                                   wordSpacing: 1,
//                                   letterSpacing: 3),
//                             ),
//                           ),
//                           Gap(30),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 onePlat,
//                                 scale: 4,
//                               ),
//                               Gap(20),
//                               Expanded(
//                                   child: Text(
//                                 weAreHereTo,
//                                 style: TextStyle(
//                                     fontSize: 22, fontWeight: FontWeight.w400),
//                               )),
//                             ],
//                           ),
//                           Gap(30),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 twoPlat,
//                                 scale: 4,
//                               ),
//                               Gap(20),
//                               Expanded(
//                                   child: Text(
//                                 weStore,
//                                 style: TextStyle(
//                                     fontSize: 22, fontWeight: FontWeight.w400),
//                               )),
//                             ],
//                           ),
//                           Gap(30),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 threePlat,
//                                 scale: 4,
//                               ),
//                               Gap(20),
//                               Expanded(
//                                   child: Text(
//                                 wePrepare,
//                                 style: TextStyle(
//                                     fontSize: 22, fontWeight: FontWeight.w400),
//                               )),
//                             ],
//                           ),
//                           Gap(30),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 fourPlat,
//                                 scale: 4,
//                               ),
//                               Gap(20),
//                               Expanded(
//                                   child: Text(
//                                 weMake,
//                                 style: TextStyle(
//                                     fontSize: 22, fontWeight: FontWeight.w400),
//                               )),
//                             ],
//                           ),
//                           Gap(30),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: Image.asset(
//                         platBanner,
//                         scale: 4,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             ResponsiveGridRow(
//               children: [
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl: Utils.getWidth(context) < 1370 ? 0 : 1,
//                   md: 0,
//                   xs: 0,
//                   child:Container()),
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl:Utils.getWidth(context) < 1370 ? 4 : 3,
//                   md: 6,
//                   xs: 12,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Gap(90),
//                         Container(
//                           padding: EdgeInsets.only(left: 30, top: 20),
//                           height: 180,
//                           width: 280,
//                           decoration: BoxDecoration(
//                               color: lowBlue,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 5,
//                                     offset: Offset(0.0, 4)),
//                               ]),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 peopleSecured,
//                                 scale: 4,
//                               ),
//                               Gap(10),
//                               Text(
//                                 peopleSEcured,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 22),
//                               ),
//                               Text(
//                                 '35000+',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 45),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Gap(100),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 12),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                             gradient: LinearGradient(
//                                 colors: [Color(0xff2B58C3), Color(0xff07122C)],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 2,
//                                 offset: Offset(9.0, 9.0),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Stack(
//                                 children: [
//                                   Image.asset(
//                                     surajTandon,
//                                     scale: 4,
//                                   ),
//                                   Positioned(
//                                       right: 40,
//                                       // left: 0,
//                                       // top: 50,
//                                       bottom: 110,
//                                       child: Text(
//                                         clickHereTo,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: white,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                               Gap(20),
//                               Text(
//                                 surajTandonn,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 22,
//                                     color: white),
//                               ),
//                               Text(
//                                 coFounder,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 18,
//                                     color: white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl: 4,
//                   md: 6,
//                   xs: 12,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Gap(90),
//                         Container(
//                           padding: EdgeInsets.only(left: 30, top: 20),
//                           height: 180,
//                           width: 280,
//                           decoration: BoxDecoration(
//                               color: lowBlue,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 5,
//                                     offset: Offset(0.0, 4)),
//                               ]),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 assetsSubs,
//                                 scale: 4,
//                               ),
//                               Gap(10),
//                               Text(
//                                 assetsSub,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 22),
//                               ),
//                               Text(
//                                 '50+Cr',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 45),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Gap(100),
//                         Container(
//                           height: 450,
//                           width: 330,
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                             gradient: LinearGradient(
//                                 colors: [Color(0xffffffff), Color(0xffE9E9E9)],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 blurRadius: 8,
//                                 offset: Offset(9.0, 9.0),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 100,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       colors: [
//                                         Color(0xff2B58C3),
//                                         Color(0xff07122C)
//                                       ],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.asset(
//                                   surajTandon,
//                                   scale: 19,
//                                 ),
//                               ),
//                               Text(
//                                 loremIpsumDolorSitAmet,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl:Utils.getWidth(context) < 1370 ? 4 : 3,
//                   md: 12,
//                   xs: 12,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Gap(90),
//                         Container(
//                           padding: EdgeInsets.only(left: 30, top: 20),
//                           height: 180,
//                           width: 280,
//                           decoration: BoxDecoration(
//                               color: lowBlue,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 5,
//                                     offset: Offset(0.0, 4)),
//                               ]),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 defaultsImage,
//                                 scale: 4,
//                               ),
//                               Gap(10),
//                               Text(
//                                 defaults,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 22),
//                               ),
//                               Text(
//                                 '0.00 %',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 45),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Gap(100),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 12),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(
//                                 colors: [Color(0xff2B58C3), Color(0xff07122C)],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter),
//                             // boxShadow: [
//                             //   BoxShadow(
//                             //     color: black12,
//                             //     // blurRadius: 8,
//                             //     offset: Offset(9.0,9.0),
//                             //   ),
//                             // ],
//                           ),
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 surajTandon,
//                                 scale: 4,
//                               ),
//                               Gap(20),
//                               Text(
//                                 surajTandonn,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 22,
//                                     color: white),
//                               ),
//                               Text(
//                                 coFounder,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 18,
//                                     color: white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 ResponsiveGridCol(
//                   // lg: 2,
//                     xl: Utils.getWidth(context) < 1370 ? 0 : 1,
//                     md: 1,
//                     xs: 0,
//                     child:Container()),
//               ],
//             ),
//
//             Gap(200),
//
//             QuetionText(
//                 boldName: faqs,
//                 boldNameColor: navyblue,
//                 smallName: weHaveYouCOvered,
//                 smallNameColor: black),
//
//             Gap(80),
//
//             ResponsiveGridRow(
//               children: [
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl: 6,
//                   md: Utils.getWidth(context) < 1200 ? 11 : 7,
//                   xs: 12,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//
//                         /// Api calling data FAQs  22/12/22
//                         // ...assetsData.response!.faqs!.map((e) {
//                         //   return Column(
//                         //     children: [
//                         //       CustomChildExpandableCard(
//                         //         padding: EdgeInsets.only(
//                         //             left: 16, right: 16, top: 16, bottom: 30),
//                         //         title: "${e.question}",
//                         //         isExpanded: ValueNotifier(1),
//                         //         index: 0,
//                         //         expandedChild: Container(
//                         //           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
//                         //           // height: 50,
//                         //           // color: Colors.lightBlueAccent,
//                         //           child: Text("${e.answer}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
//                         //         ),
//                         //       ),
//                         //       Gap(20),
//                         //     ],
//                         //   );
//                         // } ),
//
//                         /// Api without na data
//
//                         CustomChildExpandableCard(
//                           padding: EdgeInsets.only(
//                               left: 16, right: 16, top: 16, bottom: 30),
//                           title: howDoYouKeepMy,
//                           isExpanded: ValueNotifier(1),
//                           index: 0,
//                           expandedChild: Container(
//                             height: 50,
//                             color: Colors.lightBlueAccent,
//                           ),
//                         ),
//                         Gap(20),
//                         CustomChildExpandableCard(
//                           padding: EdgeInsets.only(
//                               left: 16, right: 16, top: 16, bottom: 30),
//                           title: howDoYouSign,
//                           isExpanded: ValueNotifier(2),
//                           index: 1,
//                           expandedChild: Container(
//                             height: 50,
//                             color: Colors.lightBlueAccent,
//                           ),
//                         ),
//                         Gap(20),
//                         CustomChildExpandableCard(
//                           padding: EdgeInsets.only(
//                               left: 16, right: 16, top: 16, bottom: 30),
//                           title: whoCreatesTheLegal,
//                           isExpanded: ValueNotifier(3),
//                           index: 2,
//                           expandedChild: Container(
//                             height: 50,
//                             color: Colors.lightBlueAccent,
//                           ),
//                         ),
//                         Gap(20),
//                         CustomChildExpandableCard(
//                           padding: EdgeInsets.only(
//                               left: 16, right: 16, top: 16, bottom: 30),
//                           title: whoReviewsMy,
//                           isExpanded: ValueNotifier(4),
//                           index: 3,
//                           expandedChild: Container(
//                             height: 50,
//                             color: Colors.lightBlueAccent,
//                           ),
//                         ),
//
//
//                         Gap(70),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 14, horizontal: 50),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: blue, width: 1.5),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text(
//                             viewMore,
//                             style: TextStyle(fontSize: 18, color: blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ResponsiveGridCol(
//                   // lg: 2,
//                   xl: 6,
//                   md: Utils.getWidth(context) < 1200 ? 10 : 5,
//                   xs: 12,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 50, top: Utils.getWidth(context) < 1200 ? 40 : 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Gap(10),
//                         Text(
//                           haveMoreQue,
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         Gap(5),
//                         Text(
//                           letsTalk,
//                           style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w700,
//                               color: blue),
//                         ),
//                         Gap(30),
//                         Text(
//                           ourTeamOfHighly,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Gap(30),
//                         Container(
//                           padding: EdgeInsets.symmetric(vertical: 14),
//                           width: 340,
//                           // width: MediaQuery.of(context).size.width * 0.2,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: blue, width: 1.5),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 writeToUs,
//                                 style: TextStyle(fontSize: 18, color: blue),
//                               ),
//                               Gap(5),
//                               Image.asset(
//                                 mailIcon,
//                                 scale: 4,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Gap(30),
//                         Text(
//                           weAreAvailable,
//                           style: TextStyle(color: fullgray),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             Gap(130),
//
//             AppSurakshakadi(),
//
//             Disclaimers(),
//
//             CustomWebBottomBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/components.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_validation.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class AboutUsWeb extends HookConsumerWidget {
  const AboutUsWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formkey = GlobalKey<FormState>();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController mobilenoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    final isSubmit = useState<bool>(false);
    final isSoon = useState<bool>(false);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarWeb(button: true, index: 1),
            Gap(40),

            GiveBackTo(),

            // Padding(
            //   padding: const EdgeInsets.only(left: 60),
            //   child: Text(
            //     giveBackToYourLovedOnes,
            //     style: GoogleFonts.bonaNova(
            //       textStyle: TextStyle(
            //           fontSize: 60,
            //           fontWeight: FontWeight.w700,
            //           letterSpacing: 3,
            //           wordSpacing: 1),
            //     ),
            //   ),
            // ),
            // Gap(30),
            // Container(
            //   height: Utils.getHeight(context) * 0.54,
            //   width: Utils.getWidth(context),
            //   color: indigo,
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 70),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               moneyIsNotTheOnlyCommodity,
            //               style: TextStyle(
            //                   fontSize: 26,
            //                   fontWeight: FontWeight.w400,
            //                   color: white),
            //             ),
            //             Container(
            //               padding: EdgeInsets.symmetric(
            //                   vertical: 10, horizontal: 35),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(25),
            //                 color: white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       color: Colors.black12.withOpacity(0.2),
            //                       blurRadius: 3.0,
            //                       offset: Offset(0.0, 5))
            //                 ],
            //               ),
            //               child: Text(
            //                 secureNow,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 18,
            //                     color: buttonColor),
            //               ),
            //             ),
            //             Gap(10),
            //           ],
            //         ),
            //       ),
            //       Positioned(
            //         top: -260,
            //         right: 50,
            //         bottom: 60,
            //         child: Container(
            //           height: Utils.getHeight(context) * 0.7,
            //           width: Utils.getWidth(context) * 0.54,
            //           // color: black,
            //           child: Image.asset(
            //             aboutBanner,
            //             scale: 4,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Gap(80),
            ResponsiveGridRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: 0,
                  child: Gap(40),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 11 : 6,
                  md: 11,
                  xs: 11,
                  child: Container(
                    height: Utils.getHeight(context) * 0.8,
                    child: Image.asset(
                      aboutUsBanner,
                      scale: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                  md: 1,
                  xs: 1,
                  child: Gap(40),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                  md: 1,
                  xs: 1,
                  child: Gap(Utils.getWidth(context) < 1250 ? 40 : 0),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 11 : 6,
                  md: 10,
                  xs: 11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // QuetionText(
                      //     boldName: aboutUs,
                      //     boldNameColor: buttonColor,
                      //     smallName: aboutAsWeHaveYouCovered,
                      //     smallNameColor: black),

                      Text(
                        aboutUs,
                        style: GoogleFonts.bonaNova(
                          textStyle: TextStyle(
                              color: buttonColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        aboutAsWeHaveYouCovered,
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Gap(10),
                      Container(
                        height: 4,
                        width: 180,
                        color: oreng,
                      ),
                      Gap(30),
                      Text(
                        aVibrantGroupIndividuals,
                        style: TextStyle(
                          fontSize: 17,
                          color: black,
                          wordSpacing: 1.7,
                          letterSpacing: 1.5,
                          height: 1.5,
                        ),
                      ),
                      Gap(30),
                      Text(
                        theTeamEnvisions,
                        style: TextStyle(
                            fontSize: 21,
                            height: 1.3,
                            wordSpacing: 1.7,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                            color: black),
                      ),
                      Gap(30),
                      Text(
                        helpingPeoplePlan,
                        style: TextStyle(
                            fontSize: 23,
                            height: 1.3,
                            wordSpacing: 1.7,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w700,
                            color: black),
                      ),
                    ],
                  ),
                ),
                ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: 0,
                  child: Gap(40),
                ),
              ],
            ),
            Gap(30),
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                    // lg: 2,
                    xl: Utils.getWidth(context) < 1370 ? 0 : 1,
                    md: 0,
                    xs: 0,
                    child: Container()),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                  md: 6,
                  xs: 12,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      height: 140,
                      width: 280,
                      decoration: BoxDecoration(
                          color: lowBlue,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(0.0, 4)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            willVector,
                            scale: 4,
                          ),
                          Gap(20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              complementaryEWillCreation,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: 4,
                  md: 6,
                  xs: 12,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      height: 140,
                      width: 280,
                      decoration: BoxDecoration(
                          color: lowBlue,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(0.0, 4)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            vactor,
                            scale: 4,
                          ),
                          Gap(20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              freeInsuranceCover,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                  md: 12,
                  xs: 12,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 140,
                      width: 280,
                      decoration: BoxDecoration(
                          color: lowBlue,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(0.0, 4)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            subscriptionModel,
                            scale: 4,
                          ),
                          Gap(20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              returnOfYourSubscription,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                    // lg: 2,
                    xl: Utils.getWidth(context) < 1370 ? 0 : 1,
                    md: 1,
                    xs: 0,
                    child: Container()),
              ],
            ),

            Gap(16),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 50),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xl: 6,
                    md: Utils.getWidth(context) < 1200 ? 11 : 7,
                    xs: 12,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(50),
                          Text(
                            onePlatform,
                            style: GoogleFonts.bonaNova(
                              textStyle: TextStyle(
                                  color: black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  wordSpacing: 1,
                                  letterSpacing: 3),
                            ),
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                onePlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weAreHereTo,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                twoPlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weStore,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                threePlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                wePrepare,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                fourPlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weMake,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(xl: 0, md: 0, xs: 0, child: Gap(40)),
                  ResponsiveGridCol(
                    xl: 6,
                    md: Utils.getWidth(context) < 1200 ? 11 : 7,
                    xs: 12,
                    child: Container(
                      child: Image.asset(
                        platBanner,
                        scale: 4.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Gap(50),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: QuetionText(
                  boldName: faqs,
                  boldNameColor: navyblue,
                  smallName: weHaveYouCOvered,
                  smallNameColor: black),
            ),
            Gap(50),
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  // lg: 2,
                  xl: 6,
                  md: Utils.getWidth(context) < 1200 ? 11 : 7,
                  xs: 12,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Api calling data FAQs  22/12/22
                        // ...assetsData.response!.faqs!.map((e) {
                        //   return Column(
                        //     children: [
                        //       CustomChildExpandableCard(
                        //         padding: EdgeInsets.only(
                        //             left: 16, right: 16, top: 16, bottom: 30),
                        //         title: "${e.question}",
                        //         isExpanded: ValueNotifier(1),
                        //         index: 0,
                        //         expandedChild: Container(
                        //           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                        //           // height: 50,
                        //           // color: Colors.lightBlueAccent,
                        //           child: Text("${e.answer}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                        //         ),
                        //       ),
                        //       Gap(20),
                        //     ],
                        //   );
                        // } ),

                        /// Api without na data

                        CustomChildExpandableCard(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 30),
                          title: howDoYouKeepMy,
                          isExpanded: ValueNotifier(1),
                          index: 0,
                          expandedChild: Container(
                            height: 50,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Gap(20),
                        CustomChildExpandableCard(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 30),
                          title: howDoYouSign,
                          isExpanded: ValueNotifier(2),
                          index: 1,
                          expandedChild: Container(
                            height: 50,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Gap(20),
                        CustomChildExpandableCard(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 30),
                          title: whoCreatesTheLegal,
                          isExpanded: ValueNotifier(3),
                          index: 2,
                          expandedChild: Container(
                            height: 50,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Gap(20),
                        CustomChildExpandableCard(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 30),
                          title: whoReviewsMy,
                          isExpanded: ValueNotifier(4),
                          index: 3,
                          expandedChild: Container(
                            height: 50,
                            color: Colors.lightBlueAccent,
                          ),
                        ),

                        Gap(70),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 50),
                          decoration: BoxDecoration(
                            border: Border.all(color: blue, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            viewMore,
                            style: TextStyle(fontSize: 18, color: blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: 6,
                  md: Utils.getWidth(context) < 1200 ? 11 : 5,
                  xs: 12,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 50,
                        top: Utils.getWidth(context) < 1200 ? 40 : 0,
                        right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(10),

                        if( isSubmit.value ==  false )
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                haveMoreQue,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gap(40),
                              Text(
                                ourTeamOfHighly,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gap(30),
                              GestureDetector(

                                onTap: (){
                                  isSubmit.value  = true ;


                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  width: 450,
                                  // width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: blue, width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      needHelp,
                                      style: TextStyle(fontSize: 18, color: blue),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(30),
                            ],
                          ),
                        ),
                        if( isSoon.value ==  true )
                        Text(
                          ourLegalExpert,
                          style: TextStyle(color: fullgray),
                        ),
                        if(  isSubmit.value ==  true && isSoon.value == false  )
                          Container(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFEBF0FC),
                            ),
                          ),
                          child: Form(
                            key: formkey,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "First Name*",
                                          controller: firstNameController,
                                          keyboardType: TextInputType.name,
                                          validation: validateName,
                                        ),
                                      ),
                                      Gap(10),
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "Last Name*",
                                          controller: lastNameController,
                                          keyboardType: TextInputType.name,
                                          validation: validateName,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "Mobile Number*",
                                          controller: mobilenoController,
                                          keyboardType: TextInputType.number,
                                          maxLength: 10,
                                          validation: validateMobile,
                                        ),
                                      ),
                                      Gap(10),
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "Email Id*",
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validation: validateEmail,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "City*",
                                          controller: cityController,
                                          keyboardType: TextInputType.text,
                                          validation: validateName,
                                        ),
                                      ),
                                      Gap(10),
                                      Expanded(
                                        flex: 1,
                                        child: customeFormTextField(
                                          context: context,
                                          name: "State*",
                                          controller: stateController,
                                          keyboardType: TextInputType.text,
                                          validation: validateName,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          // height: 100,
                                          child: customeFormTextField(
                                            height: 100,
                                            maxLines: 4,
                                            context: context,
                                            name: "Share More Details",
                                            controller: addressController,
                                            validation: validateName,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      isSoon.value =true ;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 40),
                                      decoration: BoxDecoration(
                                        color: oreng,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(50),
            AppSurakshakadi(),
            Disclaimers(),
            CustomWebBottomBar(),
          ],
        ),
      ),
    );
  }
}
