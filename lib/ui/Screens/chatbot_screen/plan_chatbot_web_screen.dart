import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';

class PlanChatBotWeb extends HookConsumerWidget {
  const PlanChatBotWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    final scaffoldKey = GlobalKey<ScaffoldState>();

    final selectedIndex = useState<int>(0);

    print("width --->>>> ${Utils.getWidth(context)}");
    // print("height --->>>> ${Utils.getHeight(context)}");

    return StatefulBuilder(
      builder: (context,setState) {
        return Scaffold(
          key: scaffoldKey,
          drawer: Custome_drawer_web(index: 2, button: true),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbarWeb(button: true, index: 2,scaffoldkey: scaffoldKey,),

                // LogoBackButton(),

                ///     don't remove code
                // Gap(50),
                //
                // if(selectedIndex.value > 0) ...[
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding:  EdgeInsets.only(left:  Utils.getWidth(context) < 725 ? 20  :  Utils.getWidth(context) * 0.10),
                //     child: InkWell(
                //       onTap: (){
                //
                //         selectedIndex.value = selectedIndex.value - 1;
                //         print("test ------->>>>> ${getString(prefChatBot)}");
                //         setState((){});
                //
                //         },
                //       child: Icon(Icons.arrow_back_ios,size: 25,color: textFieldBorder,),
                //     ),
                //   ),
                // ),
                // ] else ...[
                //   Container(
                //     width: 800,
                //     margin: EdgeInsets.only(left: 20,right: 20),
                //     // padding:  EdgeInsets.only(left:  Utils.getWidth(context) < 725 ? 20  :  Utils.getWidth(context) * 0.25),
                //     child: Text("Hello, my name is Surakshabot.",style: GoogleFonts.bonaNova(fontSize: 20,fontWeight: FontWeight.w700),),
                //   ),
                // ],
                //
                // Gap(100),
                //
                // if(selectedIndex.value == 0)
                // Container(
                //   // height: ,
                //   width: 600,
                //   padding: EdgeInsets.all(16),
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: bordercolor),
                //     borderRadius: BorderRadius.only(
                //       topRight: Radius.circular(16),
                //       bottomRight: Radius.circular(16),
                //       bottomLeft: Radius.circular(16),
                //     ),
                //     color: white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black12,
                //         blurRadius: 4.0,
                //         offset: Offset(0.0,2.0)
                //       )
                //     ]
                //   ),
                //   child: Text("Hey Avinash, I am SurakshaKadi between you and your loved ones. I’ll get you options in no time for your loved ones to hassle-free transfer the assets in your absence.",
                //   style: TextStyle(fontSize: 14,fontFamily: fontFamily),
                //   ),
                // ),
                //
                // Gap(50),
                //
                // if(selectedIndex.value == 1)
                // Container(
                //   // height: ,
                //   width: 550,
                //   padding: EdgeInsets.all(16),
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: bordercolor),
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(16),
                //         bottomRight: Radius.circular(16),
                //         bottomLeft: Radius.circular(16),
                //       ),
                //       color: white,
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black12,
                //             blurRadius: 4.0,
                //             offset: Offset(0.0,2.0)
                //         )
                //       ]
                //   ),
                //   child: Text("I appreciate you are taking proactive steps for the welfare of your family.",
                //     style: TextStyle(fontSize: 14,fontFamily: fontFamily),
                //   ),
                // ),
                //
                // Gap(20),
                // Container(
                //   // height: ,
                //   width: 550,
                //   padding: EdgeInsets.all(16),
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: bordercolor),
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(16),
                //         bottomRight: Radius.circular(16),
                //         bottomLeft: Radius.circular(16),
                //       ),
                //       color: lightpink,
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black12,
                //             blurRadius: 4.0,
                //             offset: Offset(0.0,2.0)
                //         )
                //       ]
                //   ),
                //
                // ),

                Gap(300),


                GestureDetector(
                  onTap: (){

                    selectedIndex.value = selectedIndex.value + 1 ;

                    setString( prefChatBot, "yash chovatiya");
                    setState((){});
                    navigationService.push(routeChooseAssetsWeb,arguments: {navRouteCA: "SpecificAssetsNot",navDashboardResponseWeb: assetsData.response.specialities});

                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChooseAssetsWeb(routeCA: "PlanBot",)));

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                    child:
                    Text("Chat Bot Skip", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 2)),
                    decoration: BoxDecoration(
                      // color: blue,
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff3C87E0).withOpacity(0.9),
                            Color(0xff0E3563).withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          // spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ],

                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
