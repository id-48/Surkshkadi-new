import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';

class PlanChatBotWeb extends HookConsumerWidget {
  const PlanChatBotWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    final scaffoldKey = GlobalKey<ScaffoldState>();

    final selectedIndex = useState<int>(0);
    final formattedDate = useState<String>("");
    print("width --->>>> ${Utils.getWidth(context)}");
    print("height --->>>> ${Utils.getHeight(context)}");

    return StatefulBuilder(
      builder: (context,setState) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawerWeb(index: 2, button: true),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbarWeb(button: true, index: 2,scaffoldkey: scaffoldKey,),

                Gap(Utils.getHeight(context) / 9.5),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 37),
                      child: Divider(
                        height: 0,
                        thickness: 2,
                        color: textFieldBorder,
                      ),
                    ),

                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: black12,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0,7.0),
                                )
                              ]
                            ),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: orangeFullLight,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Image.asset(bigChatBotIcon,),
                              ),
                            ),
                          ),
                        ),
                    ),

                  ],
                ),

                Gap(60),

                if(selectedIndex.value > 0) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left:  Utils.getWidth(context) < 725 ? 20  :  Utils.getWidth(context) * 0.10),
                    child: InkWell(
                      onTap: (){

                        selectedIndex.value = selectedIndex.value - 1;
                        print("test ------->>>>> ${getString(prefChatBot)}");
                        setState((){});

                        },
                      child: Icon(Icons.arrow_back_ios,size: 25,color: textFieldBorder,),
                    ),
                  ),
                ),
                ] else ...[
                  Container(
                    width: 800,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    // padding:  EdgeInsets.only(left:  Utils.getWidth(context) < 725 ? 20  :  Utils.getWidth(context) * 0.25),
                    child: Text("Hello, my name is Surakshabot.",style: GoogleFonts.bonaNova(fontSize: 20,fontWeight: FontWeight.w700),),
                  ),
                ],

                Gap(100),

                if(selectedIndex.value == 0)...[
                  longText(context, queText: "Hey Avinash, I am SurakshaKadi between you and your loved ones. I’ll get you options in no time for your loved ones to hassle-free transfer the assets in your absence."),
                  Gap(13),
                  longText(context, queText: "I appreciate you are taking proactive steps for the welfare of your family."),
                  Gap(13),
                  shortText(context,boxWidth: 300 ,queText: "Should we proceed?"),
                  Gap(40),
                  Container(
                    width: 600,
                    // color: redFroly,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            selectedIndex.value = selectedIndex.value + 1 ;
                          },
                          child: Container(
                            width: 180,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
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
                            child: Text("Yes",style: TextStyle(color: white),),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            navigationService.push(routePlansWeb);
                          },
                          child: Container(
                            width: 180,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
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
                            child: Text("Not Yes",style: TextStyle(color: white),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],


                if(selectedIndex.value == 1) ...[
                  longText(context, queText: "Which gender do you most associate with?"),
                  Gap(40),
                  Container(
                    width: 600,
                    // color: redFroly,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            selectedIndex.value = selectedIndex.value + 1 ;
                          },
                          child: Container(
                            width: 180,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
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
                            child: Text("Male",style: TextStyle(color: white),),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            selectedIndex.value = selectedIndex.value + 1 ;

                          },
                          child: Container(
                            width: 180,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
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
                            child: Text("Female",style: TextStyle(color: white),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],

                if(selectedIndex.value == 2) ...[

                  longText(context, queText: "Please share your birth date. (DD/MM/YYYY)"),
                  Gap(40),
                  Container(
                    width: 600,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1850),
                          lastDate: DateTime(2200),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: blue, // <-- SEE HERE
                                  onPrimary: white, // <-- SEE HERE
                                  onSurface: black, // <-- SEE HERE
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: blue, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (pickedDate != null) {
                          // print(pickedDate);
                          formattedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
                          print("Date   ----->>>>${formattedDate}");
                          selectedIndex.value = selectedIndex.value + 1 ;

                        } else {
                          displayToast("Please Select Your Birth Date.");
                        }

                      } ,
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 200,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "yyyy-mm-dd",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: white),
                        ),
                      ),
                    ),
                  ),
                ],

                if(selectedIndex.value == 3) ...[
                  GestureDetector(
                    onTap: (){
                      navigationService.push(routeChooseAssetsWeb,arguments: {navRouteCA: "SpecificAssetsNot",navDashboardResponseWeb: assetsData.response.specialities});
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

                Gap(80),


                // Gap(50),



                // GestureDetector(
                //   onTap: (){
                //
                //     selectedIndex.value = selectedIndex.value + 1 ;
                //
                //     setString( prefChatBot, "yash chovatiya");
                //     setState((){});
                //     navigationService.push(routeChooseAssetsWeb,arguments: {navRouteCA: "SpecificAssetsNot",navDashboardResponseWeb: assetsData.response.specialities});
                //
                //     // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChooseAssetsWeb(routeCA: "PlanBot",)));
                //
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                //     child:
                //     Text("Chat Bot Skip", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 2)),
                //     decoration: BoxDecoration(
                //       // color: blue,
                //       gradient: LinearGradient(
                //           colors: [
                //             Color(0xff3C87E0).withOpacity(0.9),
                //             Color(0xff0E3563).withOpacity(0.6),
                //           ],
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey,
                //           // spreadRadius: 1,
                //           blurRadius: 1,
                //           offset: const Offset(0, 1),
                //         )
                //       ],
                //
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
    );
  }
}


shortText(context,{
  required  String queText,
  required  double boxWidth,
}){
  return Container(
    width: 600,
    // color: black,
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 20,right: 20),
    child: Container(
      // height: ,
      width: boxWidth,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0.0,2.0)
            )
          ]
      ),
      child: Text(queText,
        style: TextStyle(fontSize: 14,fontFamily: fontFamily),
      ),
    ),
  );
}


longText(context,{
  required  String queText,

}){

  return  Container(
    // height: ,
    width: 600,
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),

    margin: EdgeInsets.only(left: 20,right: 20),
    decoration: BoxDecoration(
        border: Border.all(color: bordercolor),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        color: white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0.0,2.0)
          )
        ]
    ),
    child: Text(queText,
      style: TextStyle(fontSize: 14,fontFamily: fontFamily),
    ),
  );
}


