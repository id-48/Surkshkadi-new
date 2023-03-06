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



  @override
  Widget build(BuildContext context, WidgetRef ref) {


    List<Map<String, dynamic>> legalDoc = [
      {"Name": 'Beneficiary(ies)'},
      {"Name": 'Review of Will'},
      {"Name": 'Video Evidence'},
      {"Name": 'Asset Wallet'}
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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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


                CustomExpandableDrawer(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  image: legal,
                  name: "Legal Documents",
                  boxcolor: lowwhite,
                  expandedChild: Container(
                    height: 160,
                    padding: EdgeInsets.only(left: 24,right: 24,top: 16,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),

                      color: lowwhite,
                    ),

                    child: SizedBox(
                      child: ListView.builder(
                          physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                          itemCount: legalDoc.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Column(
                              children: [
                                InkWell(
                                  onTap: (){

                                    // if(index == 0){
                                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                    // }else if(index == 1){
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndCondition()));
                                    //
                                    // }else if(index == 2){
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HowToUse()));
                                    //
                                    // }else if(index == 3){
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
                                    //
                                    // }else {
                                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                    //
                                    // }


                                  },
                                  child: Container(
                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: Text(
                                            "${index + 1}. ${legalDoc[index]["Name"]}",
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 16),
                                          ),
                                        ),

                                        Icon(Icons.arrow_forward_ios,size: 20,color: blue,),
                                      ],
                                    ),
                                  ),
                                ),

                                index == legalDoc.length -1 ? Gap(0) : Gap(14),
                              ],
                            );



                          }),
                    ),
                  ),
                ),
                Gap(7),

                containerRow(
                    title: "Refer & Earn",
                    image:  refer ,
                    onTap: (){

                    }
                ),


                Gap(10),


                Text(
                  'Need Help?',
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




                CustomExpandableDrawer(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  image: refer,
                  name: "How it works?",
                  boxcolor: lowwhite,
                  expandedChild: Container(
                    height: 84,
                    padding: EdgeInsets.only(left: 24,right: 24,top: 16,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),

                      color: lowwhite,
                    ),

                    child:  Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ));

                                },
                                child: Container(
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Text(
                                          "1. Subscription service",
                                          style:
                                          TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                      ),

                                      Icon(Icons.arrow_forward_ios,size: 20,color: blue,),
                                    ],
                                  ),
                                ),
                              ),

                              Gap(14),

                              InkWell(
                                onTap: (){


                                  //   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));



                                },
                                child: Container(
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Text(
                                          "2. On Demand service",
                                          style:
                                          TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                      ),

                                      Icon(Icons.arrow_forward_ios,size: 20,color: blue,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),




                  ),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
