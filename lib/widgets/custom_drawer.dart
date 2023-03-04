import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/drawer_item_screen/about_us_screen.dart';
import 'package:surakshakadi/ui/Screens/drawer_item_screen/how_to_use_screen.dart';
import 'package:surakshakadi/ui/Screens/drawer_item_screen/my_profile_screen.dart';
import 'package:surakshakadi/ui/Screens/drawer_item_screen/terms_and_condition_screen.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import '../utils/color_utils.dart';

class Custom_drawer extends HookConsumerWidget {
  const Custom_drawer({Key? key}) : super(key: key);

  // List<IconData> iCons = [
  //   Icons.home,
  //   Icons.person_outline,
  //   Icons.featured_play_list_outlined,
  //   Icons.share,
  // ];
  // List<String> name = [
  //   'Home',
  //   'Profile',
  //   'Legal Documnets',
  //   'Refer & Earn',
  // ];

  // List<IconData> needHelpIcons = [
  //   Icons.headset_mic_outlined,
  //   Icons.comment_outlined,
  //   Icons.contact_page_sharp,
  //   Icons.people_outline_sharp,
  //   Icons.handshake_sharp,
  //
  // ];
  //
  // List<String> needHelp = [
  //   'Help & Support',
  //   'Terms & Conditions',
  //   'How to us',
  //   'Know more about us',
  //   'Leegal Notice',
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> nameProfile = [
      {"name": 'Home', "icons": home},
      {"name": 'Profile', "icons": profile},
      {"name": 'Legal Documents', "icons": legal},
      {"name": 'Refer & Earn', "icons": refer},
    ];

    List<Map<String, dynamic>> needHelp = [
      {"Name": 'Help & Support', "icon": help},
      {"Name": 'Terms & Conditions', "icon": terms},
      {"Name": 'How to us', "icon": use},
      {"Name": 'Know more about us', "icon": know},
      {"Name": 'Legal Notice', "icon": notice},
    ];


    containerRow({
      required String image,
      required String title,
      required void Function() onTap,
    }){
      return Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 50,
              padding: EdgeInsets.only(right: 20,top: 12,bottom: 12),
              color: lowwhite,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset(image, scale: 4,)),
                  // Gap(30),
                  Expanded(
                    flex: 10,
                    child: Text(
                      title,
                      style:
                      TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
                ],
              ),
            ),
          ),
          Divider(
            color: blue,height: 0.0,
            thickness: 1.5,
          ),
          Gap(7),
        ],
      );
    }


    return WillPopScope(
      onWillPop: (){
        navigationService.push(routeCustomBottomNavigationBar);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            backonTap: () {
              Navigator.pop(context);
            },
            title: 'Surakshakadi',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   child: ListView.builder(
              //       physics:
              //       ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              //       itemCount: nameProfile.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Column(
              //           children: [
              //             InkWell(
              //               onTap: (){
              //                 if(index == 0){
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //                 }else if(index == 1){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
              //
              //                 }else if(index == 2){
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //
              //                 }else{
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //
              //                 }
              //
              //
              //               },
              //               child: Container(
              //                 padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
              //                 color: lowwhite,
              //                 child: Row(
              //                   children: [
              //                     Image.asset( nameProfile[index]["icons"], scale: 4,),
              //                     Gap(30),
              //                     Expanded(
              //                       child: Text(
              //                           nameProfile[index]["name"],
              //                           style:
              //                           TextStyle(color: Colors.black, fontSize: 16),
              //                         ),
              //                     ),
              //
              //                     Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             Divider(
              //               color: blue,height: 0.0,
              //               thickness: 1.5,
              //             ),
              //             Gap(7),
              //           ],
              //         );
              //       }),
              // ),


              containerRow(
                title: "Home",
                image:  home ,
                onTap: (){

                }
              ),

              containerRow(
                  title: "Profile",
                  image:  profile ,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
                  }
              ),

              containerRow(
                  title: "Legal Documents",
                  image:  legal ,
                  onTap: (){

                  }
              ),

              containerRow(
                  title: "Refer & Earn",
                  image:  refer ,
                  onTap: (){

                  }
              ),

              // Gap(10),

              CustomExpandableDrawer(
              index: 0,
              isExpanded: ValueNotifier(1),
              // border: Border.all(color: Color(int.parse("0xff${data.categoryBoxColor}"))),
              image: legal,
              name: "Legal Documents",
              boxcolor: lowwhite,
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

                  ],
                ),
              ),
            ),

              Gap(10),


              Text(
                '   Need Help?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,letterSpacing: 0.5,
                    fontWeight: FontWeight.w600),
              ),

              Gap(20),

              containerRow(
                  title: "Help & Support",
                  image:  help ,
                  onTap: (){

                  }
              ),

              containerRow(
                  title: "How it works?",
                  image:  refer ,
                  onTap: (){

                  }
              ),
              //
              // Expanded(
              //   child: ListView.builder(
              //       physics:
              //       ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              //       itemCount: needHelp.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return  Column(
              //           children: [
              //             InkWell(
              //               onTap: (){
              //
              //                 if(index == 0){
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //                 }else if(index == 1){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndCondition()));
              //
              //                 }else if(index == 2){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context) => HowToUse()));
              //
              //                 }else if(index == 3){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
              //
              //                 }else {
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
              //
              //                 }
              //
              //
              //               },
              //               child: Container(
              //                 padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
              //                 color: lowwhite,
              //                 child: Row(
              //                   children: [
              //                     Image.asset( needHelp[index]["icon"], scale: 4,),
              //                     Gap(30),
              //                     Expanded(
              //                       child: Text(
              //                         needHelp[index]["Name"],
              //                         style:
              //                         TextStyle(color: Colors.black, fontSize: 16),
              //                       ),
              //                     ),
              //
              //                     Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             Divider(
              //               color: blue,height: 0.0,
              //               thickness: 1.5,
              //             ),
              //             Gap(7),
              //           ],
              //         );
              //
              //
              //         //   Column(
              //         //   children: [
              //         //
              //         //     ListTile(
              //         //         tileColor: Colors.black12.withOpacity(0.04),
              //         //         leading: Image.asset(
              //         //        // IconButton(
              //         //          // icon: Icon(
              //         //             needHelp[index]["icon"],
              //         //             scale: 4,
              //         //           //),
              //         //          // onPressed: () {},
              //         //         ),
              //         //         title: Text(
              //         //           needHelp[index]["Name"],
              //         //           style:
              //         //           TextStyle(color: Colors.black, fontSize: 20),
              //         //         ),
              //         //         trailing:  Icon(
              //         //                    Icons.arrow_forward_ios,
              //         //                    color: Colors.blue,
              //         //                   ),),
              //         //     Divider(
              //         //       color: Colors.blue,
              //         //       thickness: 1.5,
              //         //     ),
              //         //     // Gap(5)
              //         //   ],
              //         // );
              //       }),
              // ),
            ],
          ),

        ),
      ),
    );
  }
}
