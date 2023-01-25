import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/adminWeb/subscribed_data_model/subscribed_Data_Model.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/utils.dart';

// ignore: must_be_immutable
class AdminWebSubscribed extends HookConsumerWidget {
  List<SubscribedDataModel> subscribedData = [
    SubscribedDataModel(
      name: "test1",
      email: "test1@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "IP",
      walletQuestions: "C",
      excution: "CR",
    ),
    SubscribedDataModel(
      name: "test2",
      email: "test2@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "IP",
      willQuestions: "IP",
      walletQuestions: "IP",
      excution: "N",
    ),
    SubscribedDataModel(
      name: "test3",
      email: "test3@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "C",
      walletQuestions: "C",
      excution: "DC",
    ),
    SubscribedDataModel(
      name: "test4",
      email: "test4@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "IP",
      walletQuestions: "C",
      excution: "P",
    ),
    SubscribedDataModel(
      name: "test5",
      email: "test5@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "IP",
      willQuestions: "C",
      walletQuestions: "IP",
      excution: "IP",
    ),
    SubscribedDataModel(
      name: "test6",
      email: "test6@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "C",
      walletQuestions: "C",
      excution: "C",
    ),
    SubscribedDataModel(
      name: "test7",
      email: "test7@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "IP",
      willQuestions: "IP",
      walletQuestions: "IP",
      excution: "C",
    ),
    SubscribedDataModel(
      name: "test8",
      email: "test8@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "C",
      walletQuestions: "C",
      excution: "IP",
    ),
    SubscribedDataModel(
      name: "test9",
      email: "test9@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "IP",
      willQuestions: "IP",
      walletQuestions: "IP",
      excution: "N",
    ),
    SubscribedDataModel(
      name: "test10",
      email: "test10@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "C",
      walletQuestions: "C",
      excution: "CR",
    ),
    SubscribedDataModel(
      name: "test11",
      email: "test11@gmail.com",
      individual: "abcdef",
      city: "Surat",
      state: "Gujarat",
      kyc: "C",
      willQuestions: "IP",
      walletQuestions: "C",
      excution: "N",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPages = useState<int>(0);
    final totalBookings = useState<int>(0);
    final iCount = useState<int>(10);
    final currPage = useState<int>(1);
    final pages = useState<List<int>>([]);
    final searchController =
        useState<TextEditingController>(TextEditingController());
    final horizontalScrollController =
        useState<ScrollController>(ScrollController());
    totalBookings.value = subscribedData.length;
    String s =
        "${((totalBookings.value / iCount.value) * iCount.value == totalBookings.value ? (totalBookings.value / iCount.value) : (totalBookings.value / iCount.value) + 1)}";
    int p = int.parse(s.split(".")[0]);
    totalPages.value = p * iCount.value == totalBookings.value ? p : p + 1;
    for (int i = 0; i < subscribedData.length; i++) {
      pages.value.add(i + 1);
    }
    return StatefulBuilder(
      builder: (context,setState) {
        return Container(
          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),
          // margin: EdgeInsets.only(right: 100),
          height: 860,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    string: "Subscribed",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: navyblue,
                  ),
                ],
              ),
              Gap(50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  border: Border.all(color: gerywhite.withOpacity(0.8), width: 5),
                ),
                height: 760,
                width: Utils.getWidth(context) / 1.3,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          string: "Clients",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            CustomText(
                              string: "Search :",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(10),
                            Container(
                              height: 30,
                              width: 130,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border:
                                      Border.all(color: dividerColor, width: 1)),
                              child: Center(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 5,left: 5,bottom: 18),
                                  border: InputBorder.none,
                                ),
                                controller: searchController.value,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Gap(10),

                    Row(
                      children: [
                        CustomText(
                          string: "Show",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        Gap(20),
                        Container(
                          height: Utils.getHeight(context) / 40,
                          padding: EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: webDropdownBoxColors,
                          )),
                          child: DropdownButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: webDropdownBoxColors,
                              size: 15,
                            ),
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: black),
                            value: iCount.value,
                            items: List.generate(
                                totalBookings.value > 10 ? 10 : totalBookings.value,
                                (index) {
                              return DropdownMenuItem(
                                value: pages.value[index],
                                child: Text("${pages.value[index]}"),
                              );
                            }),
                            underline: SizedBox(),
                            onChanged: (val) {
                              currPage.value = 1;
                              iCount.value = int.parse(val.toString());
                              String s =
                                  "${((totalBookings.value / iCount.value) * iCount.value == totalBookings.value ? (totalBookings.value / iCount.value) : (totalBookings.value / iCount.value) + 1)}";
                              int p = int.parse(s.split(".")[0]);
                              totalPages.value =
                                  p * iCount.value == totalBookings.value
                                      ? p
                                      : p + 1;
                            },
                          ),
                        ),
                        Gap(20),
                        CustomText(
                            string: "Entries",
                            fontSize: 14,
                            fontWeight: FontWeight.w400)
                      ],
                    ),


                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        controller: horizontalScrollController.value,
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            DataTable(
                              // columnSpacing: 1.0,
                              columnSpacing: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              showBottomBorder: true,
                              columns: [
                                DataColumn(
                                    label: CustomText(
                                        string: "Name",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Email",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Individual/Company",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "City",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "State",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Kyc",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Will Questions",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Wallet Questions",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                DataColumn(
                                    label: CustomText(
                                        string: "Excution",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ],
                              rows: List.generate(
                                currPage.value * iCount.value <=
                                        subscribedData.length - 1
                                    ? currPage.value * iCount.value
                                    : subscribedData.length,
                                (index) => DataRow(
                                  color: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    // All rows will have the same selected color.
                                    if (states.contains(MaterialState.selected)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.08);
                                    }
                                    // Even rows will have a grey color.
                                    if (index.isEven) {
                                      return webListTile;
                                    }
                                    return null; // Use default value for other states and odd rows.
                                  }),
                                  cells: [
                                    DataCell(
                                      CustomText(
                                          string: '${subscribedData[index].name}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string: '${subscribedData[index].email}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string: '${subscribedData[index].individual}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string: '${subscribedData[index].city}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string: '${subscribedData[index].state}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string:
                                              '${subscribedData[index].kyc == "C" ? "Complete" : "In Progress"}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string:
                                              '${subscribedData[index].willQuestions == "C" ? "Complete" : "In Progress"}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      CustomText(
                                          string:
                                              '${subscribedData[index].walletQuestions == "C" ? "Complete" : "In Progress"}',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    DataCell(
                                      Container(
                                        width: 150,
                                        height: 26,
                                        // margin:
                                        //     EdgeInsets.all(Utils.getWidth(context) / 200),
                                        decoration: BoxDecoration(
                                            color: subscribedData[index].excution ==
                                                    "CR"
                                                ? webCurrentlyRequired
                                                : subscribedData[index].excution == "N"
                                                    ? webNeeded
                                                    : subscribedData[index].excution ==
                                                            "DC"
                                                        ? webDocumentCollection
                                                        : subscribedData[index]
                                                                    .excution ==
                                                                "P"
                                                            ? webPreparation
                                                            : subscribedData[index]
                                                                        .excution ==
                                                                    "IP"
                                                                ? webInProgress
                                                                : webComplete,
                                            borderRadius: BorderRadius.circular(3)),
                                        child: Center(
                                            child: CustomText(
                                                string:
                                                    "${subscribedData[index].excution == "CR" ? "Currently Required" : subscribedData[index].excution == "N" ? "Needed" : subscribedData[index].excution == "DC" ? "Document Collection" : subscribedData[index].excution == "P" ? "Preparation" : subscribedData[index].excution == "IP" ? "In Progress" : "Complete"}",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: white)),
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
                    Gap(20),

                    AdaptiveScrollbar(
                      controller: horizontalScrollController.value,
                      position: ScrollbarPosition.bottom,
                      child: Container(),
                      underDecoration: BoxDecoration(
                        color: lightGray.withOpacity(0.1),
                      ),
                      sliderActiveColor: lightGray.withOpacity(0.2),
                      sliderDefaultColor: lightGray.withOpacity(0.2),
                    ),

                    /// test Purpose if this DataTable Widget you don't like
                    // Gap(25),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: Center(
                    //         child: CustomText(
                    //             string: "#",
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Center(
                    //         child: CustomText(
                    //             string: "Name",
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Center(
                    //         child: CustomText(
                    //             string: "Date",
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 3,
                    //       child: Center(
                    //         child: CustomText(
                    //             string: "Email",
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Center(
                    //         child: CustomText(
                    //             string: "Status",
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // Container(
                    //   height: Utils.getHeight(context)/ 1.8,
                    //   child: ListView.builder(
                    //     itemCount: clientData.length,
                    //     itemBuilder: (context, index) {
                    //       return Row(
                    //         children: [
                    //           Expanded(
                    //               flex: 1,
                    //               child: Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 10.0),
                    //                 child: Text("${index + 1}"),
                    //               )),
                    //           Expanded(
                    //               flex: 1,
                    //               child: CustomText(
                    //                   string: '${clientData[index].name}',
                    //                   fontSize: 13,
                    //                   fontWeight: FontWeight.w500)),
                    //           Expanded(
                    //               flex: 1,
                    //               child: CustomText(
                    //                   string: '${clientData[index].date}',
                    //                   fontSize: 13,
                    //                   fontWeight: FontWeight.w500)),
                    //           Expanded(
                    //               flex: 1,
                    //               child: CustomText(
                    //                   string: '${clientData[index].email}',
                    //                   fontSize: 13,
                    //                   fontWeight: FontWeight.w500)),
                    //           Expanded(
                    //             flex: 1,
                    //             child: Container(
                    //               margin:
                    //                   EdgeInsets.all(Utils.getWidth(context) / 200),
                    //               color: clientData[index].status!
                    //                   ? green
                    //                   : Colors.yellow,
                    //               child: Center(
                    //                   child: Text(
                    //                       "${clientData[index].status! ? "Subscribed" : "Not Subscribed"}")),
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    ///

                    Gap(36),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            string:
                                "Showing 1 to ${totalBookings.value > 10 ? 10 : totalBookings.value} of ${subscribedData.length} entries",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          // Gap(Utils.getWidth(context) / 3.2),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: lightGrey, width: 1)),
                            // padding: EdgeInsets.symmetric(vertical: 6),
                            height: 34,
                            width: 204,
                            // width: Utils.getWidth(context) / 9.5,
                            child: Row(
                              children: [
                                Gap(10),
                                Container(
                                child: Center(
                                    child: CustomText(
                                      string: "Previous",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Gap(10),
                                VerticalDivider(
                                  width: 3,
                                  color: lightGrey,
                                  thickness: 1, //thickness of divier line
                                ),
                                // Gap(5),
                                Container(
                                  width: 34,
                                  margin  : EdgeInsets.symmetric(vertical: 1),

                                  decoration: BoxDecoration(color: blue),
                                  child: Center(
                                      child: CustomText(
                                          string: "${currPage.value}",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: white)),
                                ),
                                // Gap(5),
                                VerticalDivider(
                                  width: 3,
                                  color: lightGrey,
                                  thickness: 1, //thickness of divier line
                                ),
                                // Gap(5),
                                Container(
                                  width: 34,
                                  margin: EdgeInsets.symmetric(vertical: 1),
                                  decoration: BoxDecoration(color: white),
                                  child: Center(
                                      child: CustomText(
                                          string: "${currPage.value + 1}",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: black)),
                                ),
                                // Gap(5),
                                VerticalDivider(
                                  width: 3,
                                  color: lightGrey,
                                  thickness: 1, //thickness of divier line
                                ),
                                Gap(10),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: Center(
                                      child: CustomText(
                                        string: "Next",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(10),
                              ],
                            ),
                          )
                        ],
                      ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
