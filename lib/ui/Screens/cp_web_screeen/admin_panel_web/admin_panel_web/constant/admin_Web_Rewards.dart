import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/adminWeb/rewards_data_model/rewards_Data_Model.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/utils.dart';

// ignore: must_be_immutable
class AdminWebRewards extends HookConsumerWidget {
  List<RewardsDataModel> clientData = [
    RewardsDataModel(
      name: "Mann",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test1",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test2",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test3",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test4",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test5",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test6",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test7",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test8",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test9",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test10",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test11",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test12",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test13",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
    ),
    RewardsDataModel(
      name: "test14",
      amountPaid: "29999",
      planSelected: "Gold_Yearly",
      rewardReceived: "2999",
      startDate: "05-01-2023",
      endDate: "04-01-2024",
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

    totalBookings.value = clientData.length;
    String s =
        "${((totalBookings.value / iCount.value) * iCount.value == totalBookings.value ? (totalBookings.value / iCount.value) : (totalBookings.value / iCount.value) + 1)}";
    int p = int.parse(s.split(".")[0]);
    totalPages.value = p * iCount.value == totalBookings.value ? p : p + 1;
    for (int i = 0; i < clientData.length; i++) {
      pages.value.add(i + 1);
    }
    return Container(
      margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),
      height: 900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                string: "Rewards",
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
            height: 740,
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
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: dividerColor, width: 1)),
                          child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 5,left: 5,bottom: 21),
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
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      // columnSpacing: 1.0,
                      columnSpacing: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      showBottomBorder: true,
                      columns: [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Plan selected")),
                        DataColumn(label: Text("Start Date")),
                        DataColumn(label: Text("End Date")),
                        DataColumn(label: Text("Amount Paid")),
                        DataColumn(label: Text("Rewards Received")),
                      ],
                      rows: List.generate(
                        currPage.value * iCount.value <= clientData.length - 1
                            ? currPage.value * iCount.value
                            : clientData.length,
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
                                  string: '${clientData[index].name}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            DataCell(
                              CustomText(
                                  string: '${clientData[index].planSelected}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            DataCell(
                              CustomText(
                                  string: '${clientData[index].startDate}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            DataCell(
                              CustomText(
                                  string: '${clientData[index].endDate}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            DataCell(
                              CustomText(
                                  string: '₹${clientData[index].amountPaid}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            DataCell(
                              CustomText(
                                  string:
                                      '₹${clientData[index].rewardReceived}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                Gap(35),



                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      string:
                          "Showing 1 to ${totalBookings.value > 10 ? 10 : totalBookings.value} of ${clientData.length} entries",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    // Gap(50),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: lightGrey, width: 1)),
                      padding: EdgeInsets.symmetric(vertical: 1),
                      height: 34,
                      // width: 300,
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
                          Container(
                            width: 34,
                            decoration: BoxDecoration(color: blue),
                            child: Center(
                                child: CustomText(
                                    string: "${currPage.value}",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: white)),
                          ),
                          VerticalDivider(
                            width: 3,
                            color: lightGrey,
                            thickness: 1, //thickness of divier line
                          ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
