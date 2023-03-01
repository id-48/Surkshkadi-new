import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/utils.dart';

class AdminWebDashBoard extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              string: "Dashboard",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: navyblue),
          Gap(30),

          // Container(
          //   height: Utils.getHeight(context)/ 0.001,
          //   child: GridView.builder(
          //     itemCount: 8,
          //       gridDelegate:
          //           SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape?4:2,
          //               crossAxisSpacing: 100,
          //               mainAxisSpacing: 200,
          //               childAspectRatio: (1 / 1),
          //           ),
          //       itemBuilder: (context, index) {
          //         return Container(
          //           decoration: BoxDecoration(
          //             borderRadius:
          //                 BorderRadius.circular(10),
          //             color: white,
          //             border: Border.all(
          //                 color: gerywhite.withOpacity(0.8),
          //                 width: 5),
          //           ),
          //           height: Utils.getHeight(context) / 5,
          //           width: Utils.getWidth(context) / 9,
          //           child: Column(
          //             mainAxisAlignment:
          //                 MainAxisAlignment.center,
          //             children: [
          //               CustomText(
          //                   string: '₹ 0',
          //                   fontSize: 32,
          //                   fontWeight: FontWeight.w600,
          //                   color: navyblue),
          //               CustomText(
          //                   string: 'Total AUM',
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w500,
          //                   color: black),
          //             ],
          //           ),
          //         );
          //       }),
          // ),

          ///
          // GridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 4,
          //   mainAxisSpacing: 100,
          //   crossAxisSpacing: 200,
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 5,
          //       width: Utils.getWidth(context) / 9,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 5,
          //       width: Utils.getWidth(context) / 9,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //     // Gap(100),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: white,
          //         border: Border.all(
          //             color: gerywhite.withOpacity(0.8),
          //             width: 5),
          //       ),
          //       height: Utils.getHeight(context) / 6,
          //       width: Utils.getWidth(context) / 10,
          //       child: Column(
          //         mainAxisAlignment:
          //         MainAxisAlignment.center,
          //         children: [
          //           CustomText(
          //               string: '₹ 0',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w600,
          //               color: navyblue),
          //           CustomText(
          //               string: 'Total AUM',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w500,
          //               color: black),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          ///
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            // Row(
            //   children: [
                Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '₹ 0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Submitted',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '1',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Declined',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Subscribed',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Hit Ratio',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(50),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '₹ 0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'New Business Premium',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '1',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Renewal Premium',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Total Premium',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                        // Gap(Utils.getWidth(context) / 20),
                        Container(
                          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            border: Border.all(
                                color: gerywhite.withOpacity(0.8), width: 5),
                          ),
                          // height: Utils.getHeight(context) / 5,
                          // width: Utils.getWidth(context) / 9,
                          height: 200,
                          width: 210,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  string: '0',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: navyblue),
                              Gap(20),
                              CustomText(
                                  string: 'Rewards Received',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              // ],
            // ),
          ),
          Gap(100),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Utils.getWidth(context) / 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                  child: Text("Inquire Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff3C87E0).withOpacity(0.9),
                      Color(0xff0E3563).withOpacity(0.6),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
        ],
      ),
    );
  }
}
