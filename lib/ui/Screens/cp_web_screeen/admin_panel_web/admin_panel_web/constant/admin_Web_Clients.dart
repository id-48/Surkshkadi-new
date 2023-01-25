import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/data/model/home/adminWeb/clients_data_model/client_Data_Model.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_clients/req_get_client.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/client_view_modal.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/loading.dart';

import '../../../../../../utils/strings.dart';
import '../../../../../../widgets/custom_textfeild.dart';

class AdminWebClients extends HookConsumerWidget {
  List<ClientDataModel> clientData = [
    ClientDataModel(
        name: "Mann",
        date: "04-01-2023",
        email: "Mann@gmail.com",
        status: true),
    ClientDataModel(
        name: "Jem", date: "04-01-2023", email: "Jem@gmail.com", status: false),
    ClientDataModel(
        name: "Yash",
        date: "04-01-2023",
        email: "Yash@gmail.com",
        status: false),
    ClientDataModel(
        name: "Test2",
        date: "04-01-2023",
        email: "Test2@gmail.com",
        status: true),
    ClientDataModel(
        name: "Hari",
        date: "04-01-2023",
        email: "Hari@gmail.com",
        status: false),
    ClientDataModel(
        name: "Dhruvil",
        date: "04-01-2023",
        email: "Dhruvil@gmail.com",
        status: true),
    ClientDataModel(
        name: "test",
        date: "04-01-2023",
        email: "test@gmail.com",
        status: true),
    ClientDataModel(
        name: "test",
        date: "04-01-2023",
        email: "test@gmail.com",
        status: true),
    ClientDataModel(
        name: "test",
        date: "04-01-2023",
        email: "test@gmail.com",
        status: true),
    ClientDataModel(
        name: "test",
        date: "04-01-2023",
        email: "test@gmail.com",
        status: true),
    ClientDataModel(
        name: "test",
        date: "04-01-2023",
        email: "test@gmail.com",
        status: true),
    ClientDataModel(
        name: "Hari",
        date: "04-01-2023",
        email: "Hari@gmail.com",
        status: false),
    ClientDataModel(
        name: "Hari",
        date: "04-01-2023",
        email: "Hari@gmail.com",
        status: false),
    ClientDataModel(
        name: "Hari",
        date: "04-01-2023",
        email: "Hari@gmail.com",
        status: false),
  ];

  // int totalBookings = 0;
  // int iCount = 5;
  // int totalPages = 0;
  // int currPage = 1;
  // List<int> pages = [];

  // getData() {
  //   totalBookings = clientData.length;
  //   String s =
  //       "${((totalBookings / iCount) * iCount == totalBookings ? (totalBookings / iCount) : (totalBookings / iCount) + 1)}";
  //   int p = int.parse(s.split(".")[0]);
  //   totalPages = p * iCount == totalBookings ? p : p + 1;
  //   for (int i = 0; i < clientData.length; i++) {
  //     pages.add(i + 1);
  //     // percentage = (((i + 1) / widget.bm.length) * 100).toStringAsFixed(2);
  //
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPages = useState<int>(0);
    final totalBookings = useState<int>(0);
    final iCount = useState<int>(10);
    final currPage = useState<int>(1);
    final pages = useState<List<int>>([]);
    final searchController =
        useState<TextEditingController>(TextEditingController());

    useEffect(() {
      ReqGetClient GetClientData = ReqGetClient(cpUserId: 1);

      ref
          .read(clientProvider.notifier)
          .getClient(context: context, data: GetClientData);
    }, []);

    totalBookings.value = clientData.length;
    String s =
        "${((totalBookings.value / iCount.value) * iCount.value == totalBookings.value ? (totalBookings.value / iCount.value) : (totalBookings.value / iCount.value) + 1)}";
    int p = int.parse(s.split(".")[0]);
    totalPages.value = p * iCount.value == totalBookings.value ? p : p + 1;
    for (int i = 0; i < clientData.length; i++) {
      pages.value.add(i + 1);
    }

    final getClientController = ref.watch(clientProvider);

    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
          margin: EdgeInsets.only(right: Utils.getWidth(context) / 20),

          // margin: EdgeInsets.only(right: 100),
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    string: "Clients",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: navyblue,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      addClientDialogWeb(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text("+ Add Clients",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
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
                    ),
                  ),
                ],
              ),
              Gap(50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  border:
                      Border.all(color: gerywhite.withOpacity(0.8), width: 5),
                ),
                height: 740,
                // height: Utils.getHeight(context) / 1.35,
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

                              // height: Utils.getHeight(context) / 35,
                              // width: Utils.getWidth(context) / 13,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: dividerColor, width: 1)),
                              child: Center(
                                child: TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        right: 5, left: 5, bottom: 20),
                                    border: InputBorder.none,
                                  ),
                                  controller: searchController.value,
                                ),
                              ),
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
                        // Text("Page: ${currPage.value} of ${totalPages.value} "),

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
                                totalBookings.value > 10
                                    ? 10
                                    : totalBookings.value, (index) {
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

                    getClientController.when(
                        data: (data) {
                          return SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                // columnSpacing: 1.0,
                                columnSpacing: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                showBottomBorder: true,
                                columns: [
                                  DataColumn(
                                    label: Text("S. No."),
                                  ),
                                  DataColumn(
                                    label: Text("Name"),
                                  ),
                                  DataColumn(
                                    label: Text("Date"),
                                  ),
                                  DataColumn(
                                    label: Text("Emails"),
                                  ),
                                  DataColumn(
                                    label: Text("Status"),
                                  ),
                                ],
                                rows: List.generate(
                                  currPage.value * iCount.value <=
                                          data.response.length - 1
                                      ? currPage.value * iCount.value
                                      : data.response.length,
                                  (index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>((Set<MaterialState> states) {
                                      // All rows will have the same selected color.
                                      if (states
                                          .contains(MaterialState.selected)) {
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0.0),
                                          child: Container(
                                            // height: Utils.getHeight(context) / 25,
                                            // width: Utils.getWidth(context) / 50,
                                            decoration: BoxDecoration(
                                                color: lightGrey,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              clientIcon,
                                              scale: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        CustomText(
                                            string:
                                                '${data.response[index].name}',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      DataCell(
                                        CustomText(
                                            string:
                                                '${data.response[index].registeredOn}',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      DataCell(
                                        CustomText(
                                            string:
                                                '${data.response[index].email}',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      DataCell(
                                        Container(
                                          width: 150,
                                          height: 20,
                                          // margin:
                                          //     EdgeInsets.all(Utils.getWidth(context) / 200),
                                          decoration: BoxDecoration(
                                              color: data.response[index].status == "Subscribed"
                                                  ? webSubscribed
                                                  : webNotSubscribed,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                              child: CustomText(
                                                  string:
                                                      "${data.response[index].status}",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        error: (obj, trace) => ErrorWidget(obj),
                        loading: () => const Loading()),

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
                      children: [
                        CustomText(
                          string:
                              "Showing 1 to ${totalBookings.value > 10 ? 10 : totalBookings.value} of ${clientData.length} entries",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: lightGrey, width: 1)),
                          padding: EdgeInsets.symmetric(vertical: 1),
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
                              Container(
                                width: 34,
                                margin: EdgeInsets.symmetric(vertical: 1),
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
      },
    );
  }
}

addClientDialogWeb(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      insetPadding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(
        builder: (context) {
          TextEditingController firstNameController = TextEditingController();
          TextEditingController phoneController = TextEditingController();
          TextEditingController emailController = TextEditingController();

          return Container(
            height: Utils.getWidth(context) <= 570 ? 420 : 350,
            width: Utils.getWidth(context) * 0.3,
            padding: EdgeInsets.only(
              top: 7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: indigo, width: 2),
              // boxShadow:  [ BoxShadow(
              //     color: Colors.white38,
              //     blurRadius: 1.0,
              //     offset: Offset(0.0,5.0)
              // ),]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            cross,
                            scale: 3.5,
                          )),
                    ],
                  ),
                  Gap(20),




                  ResponsiveGridRow(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      ResponsiveGridCol(
                        sm: 5,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: firstName,
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w400,
                                      fontSize: MediaQuery.of(context)
                                          .orientation ==
                                          Orientation
                                              .landscape
                                          ? 20
                                          : 17)),
                              TextSpan(
                                text: star,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    color:
                                    cinnabarRed,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        sm: 7,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(

                              bottom: 10,
                              top: 10),
                          child: CustomTextfeild(
                            height: 44,
                            textCapitalization:
                            TextCapitalization
                                .none,
                            contentPadding:
                            EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            blurRadius: 4.0,
                            maxLines: 1,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                            containerborder:
                            Border.all(
                                color: webBorder),
                            containercolor: white,
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            controller:
                            firstNameController,
                            textStyle: TextStyle(
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(6),




                  ResponsiveGridRow(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      ResponsiveGridCol(
                        sm: 5,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: emaill,
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w400,
                                      fontSize: MediaQuery.of(context)
                                          .orientation ==
                                          Orientation
                                              .landscape
                                          ? 20
                                          : 17)),
                              TextSpan(
                                text: star,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    color:
                                    cinnabarRed,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        sm: 7,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(

                              bottom: 10,
                              top: 10),
                          child: CustomTextfeild(
                            height: 44,
                            textCapitalization:
                            TextCapitalization
                                .none,
                            contentPadding:
                            EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            blurRadius: 4.0,
                            maxLines: 1,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                            containerborder:
                            Border.all(
                                color: webBorder),
                            containercolor: white,
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            controller:
                            emailController,
                            textStyle: TextStyle(
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(6),

                  ResponsiveGridRow(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      ResponsiveGridCol(
                        sm: 5,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: mobileNo,
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w400,
                                      fontSize: MediaQuery.of(context)
                                          .orientation ==
                                          Orientation
                                              .landscape
                                          ? 20
                                          : 17)),
                              TextSpan(
                                text: star,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    color:
                                    cinnabarRed,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        sm: 7,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(

                              bottom: 10,
                              top: 10),
                          child: CustomTextfeild(
                            height: 44,
                            textCapitalization:
                            TextCapitalization
                                .none,
                            contentPadding:
                            EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            blurRadius: 4.0,
                            maxLines: 1,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                            containerborder:
                            Border.all(
                                color: webBorder),
                            containercolor: white,
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            controller:
                            phoneController,
                            textStyle: TextStyle(
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20),

                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,

                    children: [
                      Gap(Utils.getWidth(context)*0.02),
                      Expanded(
                        flex:1,
                        child:    GestureDetector(
                          onTap: (){
                            navigationService.pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 9),
                            child:
                            Text("Close", style: TextStyle(color: Colors.blue)),
                            decoration: BoxDecoration(
                              color: white,

                              border: Border.all(color: blue),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  // spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                )
                              ],

                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Gap(Utils.getWidth(context)*0.02),
                      Expanded(
                        flex: 1,
                        child:  CustomButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          title: "Add",
                          onTap: (){

                          },
                        ),
                      ),
                      Gap(Utils.getWidth(context)*0.02),
                    ],
                  ),





                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
