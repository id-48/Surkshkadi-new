import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';


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
    return SafeArea(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                  physics:
                  ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                  itemCount: nameProfile.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
                          color: lowwhite,
                          child: Row(
                            children: [
                              Image.asset( nameProfile[index]["icons"], scale: 4,),
                              Gap(30),
                              Expanded(
                                child: Text(
                                    nameProfile[index]["name"],
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                              ),

                              Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
                            ],
                          ),
                        ),
                        Divider(
                          color: blue,height: 0.0,
                          thickness: 1.5,
                        ),
                        Gap(7),
                      ],
                    );
                  }),
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
            Expanded(
              child: ListView.builder(
                  physics:
                  ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                  itemCount: needHelp.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
                          color: lowwhite,
                          child: Row(
                            children: [
                              Image.asset( needHelp[index]["icon"], scale: 4,),
                              Gap(30),
                              Expanded(
                                child: Text(
                                  needHelp[index]["Name"],
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),

                              Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
                            ],
                          ),
                        ),
                        Divider(
                          color: blue,height: 0.0,
                          thickness: 1.5,
                        ),
                        Gap(7),
                      ],
                    );


                    //   Column(
                    //   children: [
                    //
                    //     ListTile(
                    //         tileColor: Colors.black12.withOpacity(0.04),
                    //         leading: Image.asset(
                    //        // IconButton(
                    //          // icon: Icon(
                    //             needHelp[index]["icon"],
                    //             scale: 4,
                    //           //),
                    //          // onPressed: () {},
                    //         ),
                    //         title: Text(
                    //           needHelp[index]["Name"],
                    //           style:
                    //           TextStyle(color: Colors.black, fontSize: 20),
                    //         ),
                    //         trailing:  Icon(
                    //                    Icons.arrow_forward_ios,
                    //                    color: Colors.blue,
                    //                   ),),
                    //     Divider(
                    //       color: Colors.blue,
                    //       thickness: 1.5,
                    //     ),
                    //     // Gap(5)
                    //   ],
                    // );
                  }),
            ),
          ],
        ),

      ),
    );
  }
}
