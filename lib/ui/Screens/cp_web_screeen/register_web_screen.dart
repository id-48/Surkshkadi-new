import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/confirmation_cp_partner_web.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_validation.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class RegisterWeb extends HookConsumerWidget {
  const RegisterWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final individualCheck = useState<bool>(true);
    final companyCheck = useState<bool>(false);
    final statee = useState<String>('');
    final cityy = useState<String>('');
    final selectedindex = useState<int>(0);
    final formkey = GlobalKey<FormState>();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final mailController = useTextEditingController();
    final mobileController = useTextEditingController();
    final adharCardController = useTextEditingController();
    final pANCardController = useTextEditingController();
    final adharCardOTPController = useTextEditingController();
    final pANCardOTPController = useTextEditingController();

    List fillTextField = [
      {"title": "First Name", "controller": firstNameController},
      {"title": "Last Name", "controller": lastNameController},
      {"title": "Email Id", "controller": mailController},
      {"title": "Mobile No.", "controller": mobileController}
    ];

    List selectStateCity = [
      {
        "title": "State",
        "dataList": ["Gujarat", "Rajasthan", "Kerala", "Goa"]
      },
      {
        "title": "City",
        "dataList": ["Amreli", "Rajkot", "Ahmedabad", "Surat"]
      },
    ];




    print(" widhth :::: ${MediaQuery.of(context).size.width}");
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppbarWeb(
              index: 3,
              boxShadow: true,
            ),
            Gap(50),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.08
                      : 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            individualCheck.value = true;
                            if (individualCheck.value == true) {
                              companyCheck.value = false;
                            }
                          },
                          child: Container(
                            height: 60,
                            color:
                                individualCheck.value == true ? oreng : amber,
                            alignment: Alignment.center,
                            child: Text(
                              stepOneBasic,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: individualCheck.value == true
                                      ? white
                                      : black),
                            ),
                          ),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          companyCheck.value = true;
                          if (companyCheck.value == true) {
                            individualCheck.value = false;
                          }
                        },
                        child: Container(
                          height: 60,
                          color: companyCheck.value == true ? oreng : amber,
                          alignment: Alignment.center,
                          child: Text(
                            stepTwoUpload,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: companyCheck.value == true ? white : black),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                  Gap(40),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width * 0.053
                          : 20,
                      vertical: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width * 0.043
                          : 20,
                    ),
                    color: boxColors,
                    child: Container(
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2.0,
                            offset: Offset(0.0, 8.0)),
                      ]),
                      child: individualCheck.value == true
                          ? Column(
                              children: [
                                Container(
                                  height: 80,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Color(0xFFA0C1D8),
                                        Color(0xFFffffff),
                                        Color(0xFFffffff),
                                        Color(0xFFffffff),
                                        Color(0xFFffffff),
                                        Color(0xFFffffff),
                                        Color(0xFFffffff),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    basicDetails,
                                    style: GoogleFonts.bonaNova(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context)
                                                .orientation ==
                                            Orientation.landscape
                                        ? MediaQuery.of(context).size.width *
                                            0.055
                                        : 20,
                                    // vertical: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.04 : 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Gap(50),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            iAm,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: blue),
                                          ),
                                          Gap(20),
                                          InkWell(
                                            onTap: () {
                                              // individualCheck.value = true;
                                              // if (individualCheck.value ==
                                              //     true) {
                                              //   companyCheck.value = false;
                                              // }
                                            },
                                            child: individualCheck.value == true
                                                ? Icon(
                                                    Icons.check_box,
                                                    size: 30,
                                                    color: blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank_sharp,
                                                    size: 30,
                                                    color: blue,
                                                  ),
                                          ),
                                          Gap(8),
                                          Text(
                                            individual,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Gap(20),
                                          InkWell(
                                            onTap: () {
                                              // companyCheck.value = true;
                                              // if (companyCheck.value == true) {
                                              //   individualCheck.value = false;
                                              // }
                                            },
                                            child: companyCheck.value == true
                                                ? Icon(
                                                    Icons.check_box,
                                                    size: 30,
                                                    color: blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank_sharp,
                                                    size: 30,
                                                    color: blue,
                                                  ),
                                          ),
                                          Gap(8),
                                          Text(
                                            company,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Gap(50),
                                      ResponsiveGridRow(
                                        children: [
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
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
                                                            right: 20.0,
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
                                          ),
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  sm: 5,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: lastName,
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
                                                      right: 20.0,
                                                      bottom: 10,
                                                      top: 10,
                                                    ),
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
                                                          lastNameController,
                                                      textStyle: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(5),
                                      ResponsiveGridRow(
                                        children: [
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  sm: 5,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: mailId,
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
                                                            right: 20.0,
                                                            top: 10,
                                                            bottom: 10),
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
                                                          mailController,
                                                      textStyle: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
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
                                                      right: 20.0,
                                                      bottom: 10,
                                                      top: 10,
                                                    ),
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
                                                          mobileController,
                                                      textStyle: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(5),

                                      ResponsiveGridRow(
                                        children: [
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  sm: 5,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: states,
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
                                                            right: 20.0,
                                                            top: 10,
                                                            bottom: 10),
                                                    child: CustomSelectWeb(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 4.0,
                                                          offset: Offset(
                                                            0.0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                      iconColor: webBorder,
                                                      textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: greenjerry,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      color: white,
                                                      onChanged: (val) {
                                                        statee.value = val;
                                                      },
                                                      items: selectStateCity[0]
                                                          ["dataList"],
                                                      hint: '',
                                                      borderCon: BorderSide(
                                                        width: 1.0,
                                                        color: webBorder,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ResponsiveGridCol(
                                            sm: 6,
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  sm: 5,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: "City",
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
                                                      right: 20.0,
                                                      top: 10,
                                                      bottom: 10,
                                                    ),
                                                    child: CustomSelectWeb(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 4.0,
                                                          offset: Offset(
                                                            0.0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                      iconColor: webBorder,
                                                      textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: greenjerry,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      color: white,
                                                      onChanged: (val) {
                                                        statee.value = val;
                                                      },
                                                      items: selectStateCity[1]
                                                          ["dataList"],
                                                      hint: '',
                                                      borderCon: BorderSide(
                                                        width: 1.0,
                                                        color: webBorder,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      /// old code
                                      // Center(
                                      //   child: Container(
                                      //     height: MediaQuery.of(context)
                                      //                 .orientation ==
                                      //             Orientation.landscape
                                      //         ? 140
                                      //         : 300,
                                      //     // width: 900,
                                      //     child: GridView.builder(
                                      //       physics:
                                      //           NeverScrollableScrollPhysics(),
                                      //       // itemCount: 4,
                                      //       itemCount: fillTextField.length,
                                      //       gridDelegate:
                                      //           SliverGridDelegateWithFixedCrossAxisCount(
                                      //         crossAxisCount:
                                      //             MediaQuery.of(context)
                                      //                         .orientation ==
                                      //                     Orientation.landscape
                                      //                 ? 2
                                      //                 : 1,
                                      //         // crossAxisCount: 2,
                                      //         crossAxisSpacing: 30,
                                      //         // mainAxisSpacing: 15,
                                      //         childAspectRatio: (9 / 1),
                                      //       ),
                                      //       itemBuilder: (context, index) {
                                      //         return Container(
                                      //           width: MediaQuery.of(context)
                                      //                       .orientation ==
                                      //                   Orientation.landscape
                                      //               ? MediaQuery.of(context)
                                      //                       .size
                                      //                       .width *
                                      //                   0.3
                                      //               : MediaQuery.of(context)
                                      //                       .size
                                      //                       .width *
                                      //                   0.7,
                                      //           child: Row(
                                      //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //             children: [
                                      //               Expanded(
                                      //                 flex: 3,
                                      //                 child: RichText(
                                      //                   text: TextSpan(
                                      //                     children: <TextSpan>[
                                      //                       TextSpan(
                                      //                           text: fillTextField[
                                      //                                   index]
                                      //                               ["title"],
                                      //                           style: TextStyle(
                                      //                               fontWeight:
                                      //                                   FontWeight
                                      //                                       .w400,
                                      //                               fontSize: MediaQuery.of(context).orientation ==
                                      //                                       Orientation.landscape
                                      //                                   ? 20
                                      //                                   : 17)),
                                      //                       TextSpan(
                                      //                         text: star,
                                      //                         style: TextStyle(
                                      //                             fontWeight:
                                      //                                 FontWeight
                                      //                                     .bold,
                                      //                             color:
                                      //                                 cinnabarRed,
                                      //                             fontSize: 20),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //               Expanded(
                                      //                 flex: 4,
                                      //                 child: CustomTextfeild(
                                      //                   height: 44,
                                      //                   textCapitalization:
                                      //                       TextCapitalization
                                      //                           .none,
                                      //                   contentPadding:
                                      //                       EdgeInsets.only(
                                      //                     left: 10,
                                      //                     bottom: 5,
                                      //                   ),
                                      //                   blurRadius: 4.0,
                                      //                   maxLines: 1,
                                      //                   offset: Offset(
                                      //                     0.0,
                                      //                     4,
                                      //                   ),
                                      //                   containerborder:
                                      //                       Border.all(
                                      //                           color:
                                      //                               webBorder),
                                      //                   containercolor: white,
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(10),
                                      //                   controller:
                                      //                       fillTextField[index]
                                      //                           ["controller"],
                                      //                   textStyle: TextStyle(
                                      //                       fontSize: 20),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         );
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),
                                      //
                                      //
                                      /// old code
                                      // Center(
                                      //   child: Container(
                                      //     height: MediaQuery.of(context)
                                      //                 .orientation ==
                                      //             Orientation.landscape
                                      //         ? 70
                                      //         : 126,
                                      //     // width: 900,
                                      //     child: GridView.builder(
                                      //       physics:
                                      //           NeverScrollableScrollPhysics(),
                                      //       // itemCount: 4,
                                      //       itemCount: selectStateCity.length,
                                      //       gridDelegate:
                                      //           SliverGridDelegateWithFixedCrossAxisCount(
                                      //         crossAxisCount:
                                      //             MediaQuery.of(context)
                                      //                         .orientation ==
                                      //                     Orientation.landscape
                                      //                 ? 2
                                      //                 : 1,
                                      //         // crossAxisCount: 2,
                                      //         crossAxisSpacing: 20,
                                      //         mainAxisSpacing: 15,
                                      //         childAspectRatio: (9 / 1),
                                      //       ),
                                      //       itemBuilder: (context, index) {
                                      //         return Container(
                                      //           // height: 60,
                                      //           width: MediaQuery.of(context)
                                      //                       .orientation ==
                                      //                   Orientation.landscape
                                      //               ? MediaQuery.of(context)
                                      //                       .size
                                      //                       .width *
                                      //                   0.3
                                      //               : MediaQuery.of(context)
                                      //                       .size
                                      //                       .width *
                                      //                   0.7,
                                      //
                                      //           child: Row(
                                      //             children: [
                                      //               Expanded(
                                      //                 flex: 3,
                                      //                 child: RichText(
                                      //                   text: TextSpan(
                                      //                     children: <TextSpan>[
                                      //                       TextSpan(
                                      //                           text: selectStateCity[
                                      //                                   index]
                                      //                               ["title"],
                                      //                           style: TextStyle(
                                      //                               fontWeight:
                                      //                                   FontWeight
                                      //                                       .w400,
                                      //                               fontSize: MediaQuery.of(context).orientation ==
                                      //                                       Orientation.landscape
                                      //                                   ? 20
                                      //                                   : 17)),
                                      //                       TextSpan(
                                      //                         text: star,
                                      //                         style: TextStyle(
                                      //                             fontWeight:
                                      //                                 FontWeight
                                      //                                     .bold,
                                      //                             color:
                                      //                                 cinnabarRed,
                                      //                             fontSize: 20),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //               Expanded(
                                      //                 flex: 4,
                                      //                 child: CustomSelectWeb(
                                      //                   boxShadow: [
                                      //                     BoxShadow(
                                      //                       color:
                                      //                           Colors.black26,
                                      //                       blurRadius: 4.0,
                                      //                       offset: Offset(
                                      //                         0.0,
                                      //                         4,
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                   iconColor: webBorder,
                                      //                   textStyle: TextStyle(
                                      //                     fontSize: 16,
                                      //                     color: greenjerry,
                                      //                     fontWeight:
                                      //                         FontWeight.w600,
                                      //                   ),
                                      //                   color: white,
                                      //                   onChanged: (val) {
                                      //                     statee.value = val;
                                      //                   },
                                      //                   items: selectStateCity[
                                      //                       index]["dataList"],
                                      //                   hint: '',
                                      //                   borderCon: BorderSide(
                                      //                     width: 1.0,
                                      //                     color: webBorder,
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         );
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),
                                      Gap(20),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 60),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: oreng,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.2),
                                                  blurRadius: 3.0,
                                                  offset: Offset(0.0, 5))
                                            ],
                                          ),
                                          child: Text(
                                            proceed,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22,
                                                color: white),
                                          ),
                                        ),
                                      ),
                                      Gap(20),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: iAgreeToAbide,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .orientation ==
                                                            Orientation
                                                                .landscape
                                                        ? 20
                                                        : 17)),
                                            TextSpan(
                                              text: privacyPolicy,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: cinnabarRed,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(40),


                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  height: 80,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Color(0xFFA0C1D8),
                                        Color(0xFFffffff),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    AttachTheFollowing,
                                    style: GoogleFonts.bonaNova(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context)
                                                .orientation ==
                                            Orientation.landscape
                                        ? MediaQuery.of(context).size.width *
                                            0.055
                                        : 20,
                                    // vertical: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.04 : 20,
                                  ),
                                  child: Form(
                                    key: formkey,
                                    child: Column(
                                      children: [
                                        Gap(30),
                                        Text(
                                          uploadYourProof,
                                          style: TextStyle(
                                              color: Color(0xFF2F75C9),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24),
                                        ),
                                        Gap(30),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: borderblue)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  md: 6,
                                                  xs: 12,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        pleaseAddYourAdharCard,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2F75C9),
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20),
                                                      ),
                                                      Gap(20),
                                                      Text(
                                                        aadharCardNo,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                      Gap(10),
                                                      customeFormTextField(
                                                        height: 42,
                                                        maxLines: 1,
                                                        context: context,
                                                        borderColor: borderblue,
                                                        controller:
                                                            adharCardController,
                                                        validation:
                                                            validateName,
                                                      ),
                                                      Text(
                                                        enterOTP,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                      Gap(10),
                                                      customeFormTextField(
                                                        height: 42,
                                                        maxLines: 1,
                                                        context: context,
                                                        borderColor: borderblue,
                                                        controller:
                                                            adharCardOTPController,
                                                        validation:
                                                            validateName,
                                                      ),
                                                      Gap(20),
                                                      Text(
                                                        resend,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),

                                                      // Expanded(
                                                      //   flex: 4,
                                                      //   child:
                                                      //       CustomTextfeild(
                                                      //     height: 44,
                                                      //     textCapitalization:
                                                      //         TextCapitalization
                                                      //             .none,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .only(
                                                      //       left: 10,
                                                      //       bottom: 5,
                                                      //     ),
                                                      //     blurRadius: 0.0,
                                                      //     maxLines: 1,
                                                      //     offset: Offset(
                                                      //       0.0,
                                                      //       0,
                                                      //     ),
                                                      //     containerborder:
                                                      //         Border.all(
                                                      //             color:
                                                      //                 borderblue),
                                                      //     containercolor:
                                                      //         white,
                                                      //     borderRadius:
                                                      //         BorderRadius
                                                      //             .circular(
                                                      //                 10),
                                                      //     controller:
                                                      //         fillTextField[
                                                      //                 index]
                                                      //             [
                                                      //             "controller"],
                                                      //     textStyle:
                                                      //         TextStyle(
                                                      //             fontSize:
                                                      //                 20),
                                                      //   ),
                                                      // ),
                                                      // Expanded(
                                                      //   flex: 3,
                                                      //   child: RichText(
                                                      //     text: TextSpan(
                                                      //       children: <
                                                      //           TextSpan>[
                                                      //         TextSpan(
                                                      //             text: fillTextField[
                                                      //                     index]
                                                      //                 [
                                                      //                 "title"],
                                                      //             style: TextStyle(
                                                      //                 fontWeight: FontWeight
                                                      //                     .w400,
                                                      //                 fontSize: MediaQuery.of(context).orientation == Orientation.landscape
                                                      //                     ? 20
                                                      //                     : 17)),
                                                      //         TextSpan(
                                                      //           text: star,
                                                      //           style: TextStyle(
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .bold,
                                                      //               color:
                                                      //                   cinnabarRed,
                                                      //               fontSize:
                                                      //                   20),
                                                      //         ),
                                                      //       ],
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      // Expanded(
                                                      //   flex: 4,
                                                      //   child:
                                                      //       CustomTextfeild(
                                                      //     height: 44,
                                                      //     textCapitalization:
                                                      //         TextCapitalization
                                                      //             .none,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .only(
                                                      //       left: 10,
                                                      //       bottom: 5,
                                                      //     ),
                                                      //     blurRadius: 4.0,
                                                      //     maxLines: 1,
                                                      //     offset: Offset(
                                                      //       0.0,
                                                      //       4,
                                                      //     ),
                                                      //     containerborder:
                                                      //         Border.all(
                                                      //             color:
                                                      //                 webBorder),
                                                      //     containercolor:
                                                      //         white,
                                                      //     borderRadius:
                                                      //         BorderRadius
                                                      //             .circular(
                                                      //                 10),
                                                      //     controller:
                                                      //         fillTextField[
                                                      //                 index]
                                                      //             [
                                                      //             "controller"],
                                                      //     textStyle:
                                                      //         TextStyle(
                                                      //             fontSize:
                                                      //                 20),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                ResponsiveGridCol(
                                                  md: 6,
                                                  xs: 12,
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          uploadAdharCard,
                                                          scale: 3),
                                                      Text(
                                                        "Upload Aadhar Card here.",
                                                        style: TextStyle(
                                                            fontSize: 8),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Gap(30),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: borderblue)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            child: ResponsiveGridRow(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ResponsiveGridCol(
                                                  md: 6,
                                                  xs: 12,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        pleaseAddYourPANCard,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2F75C9),
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20),
                                                      ),
                                                      Gap(20),
                                                      Text(
                                                        pANCardNo,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                      Gap(10),
                                                      customeFormTextField(
                                                        height: 42,
                                                        maxLines: 1,
                                                        context: context,
                                                        borderColor: borderblue,
                                                        controller:
                                                            pANCardController,
                                                        validation:
                                                            validateName,
                                                      ),
                                                      Text(
                                                        enterOTP,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito Sans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                      Gap(10),
                                                      customeFormTextField(
                                                        height: 42,
                                                        maxLines: 1,
                                                        context: context,
                                                        borderColor: borderblue,
                                                        controller:
                                                            pANCardOTPController,
                                                        validation:
                                                            validateName,
                                                      ),
                                                      Gap(20),
                                                      Text(
                                                        resend,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ResponsiveGridCol(
                                                  md: 6,
                                                  xs: 12,
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          uploadAdharCard,
                                                          scale: 3),
                                                      Text(
                                                        "Upload PAN Card here.",
                                                        style: TextStyle(
                                                            fontSize: 8),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Gap(30),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: borderblue)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  addSelfie,
                                                  style: TextStyle(
                                                      color: Color(0xFF2F75C9),
                                                      fontFamily: "Nunito Sans",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                                Center(
                                                  child: Image.asset(takeSelfie,
                                                      scale: 3),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Gap(30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));

                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 50),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: oreng,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12
                                                            .withOpacity(0.2),
                                                        blurRadius: 3.0,
                                                        offset: Offset(0.0, 5))
                                                  ],
                                                ),
                                                child: Text(
                                                  proceed,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                            Gap(20),
                                            InkWell(
                                              onTap: () {
                                                // print("yashu Patel");
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
                                                navigationService.pop();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 50),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border:
                                                      Border.all(color: oreng),
                                                  color: white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12
                                                            .withOpacity(0.2),
                                                        blurRadius: 3.0,
                                                        offset: Offset(0.0, 5))
                                                  ],
                                                ),
                                                child: Text(
                                                  back,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gap(50),

                                        /// old code
                                        // Center(
                                        //   child: Container(
                                        //     height: MediaQuery.of(context)
                                        //                 .orientation ==
                                        //             Orientation.landscape
                                        //         ? 140
                                        //         : 300,
                                        //     // width: 900,
                                        //     child: GridView.builder(
                                        //       physics:
                                        //           NeverScrollableScrollPhysics(),
                                        //       // itemCount: 4,
                                        //       itemCount: fillTextField.length,
                                        //       gridDelegate:
                                        //           SliverGridDelegateWithFixedCrossAxisCount(
                                        //         crossAxisCount:
                                        //             MediaQuery.of(context)
                                        //                         .orientation ==
                                        //                     Orientation.landscape
                                        //                 ? 2
                                        //                 : 1,
                                        //         // crossAxisCount: 2,
                                        //         crossAxisSpacing: 20,
                                        //         mainAxisSpacing: 15,
                                        //         childAspectRatio: (9 / 1),
                                        //       ),
                                        //       itemBuilder: (context, index) {
                                        //         return Container(
                                        //           width: MediaQuery.of(context)
                                        //                       .orientation ==
                                        //                   Orientation.landscape
                                        //               ? MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.3
                                        //               : MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.7,
                                        //           child: Container(
                                        //             decoration: BoxDecoration(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                         10),
                                        //                 border: Border.all(
                                        //                     color: Colors
                                        //                         .blueAccent)),
                                        //             child: Form(
                                        //               key: formkey,
                                        //               child: Row(
                                        //                 children: [
                                        //                   Column(
                                        //                     children: [
                                        //                       Text(
                                        //                         pleaseAddYourAdharCard,
                                        //                         style: GoogleFonts.bonaNova(
                                        //                             textStyle: TextStyle(
                                        //                                 color: Color(
                                        //                                     0xFF2F75C9),
                                        //                                 fontWeight:
                                        //                                     FontWeight
                                        //                                         .w700,
                                        //                                 fontSize:
                                        //                                     24)),
                                        //                       ),
                                        //                       Text(
                                        //                         aadharCardNo,
                                        //                         style: GoogleFonts.bonaNova(
                                        //                             textStyle: TextStyle(
                                        //                                 color: Color(
                                        //                                     0xFF2F75C9),
                                        //                                 fontWeight:
                                        //                                     FontWeight
                                        //                                         .w700,
                                        //                                 fontSize:
                                        //                                     24)),
                                        //                       ),
                                        //                       Container(
                                        //                         height: 100,
                                        //                         width: 100,
                                        //                         child:
                                        //                             customeFormTextField(
                                        //                           // height: 100,
                                        //                           maxLines: 1,
                                        //                           context:
                                        //                               context,
                                        //                           name:
                                        //                               "Share More Details",
                                        //                           controller:
                                        //                               firstNameController,
                                        //                           validation:
                                        //                               validateName,
                                        //                         ),
                                        //                       ),
                                        //                       // Expanded(
                                        //                       //   flex: 4,
                                        //                       //   child:
                                        //                       //       CustomTextfeild(
                                        //                       //     height: 44,
                                        //                       //     textCapitalization:
                                        //                       //         TextCapitalization
                                        //                       //             .none,
                                        //                       //     contentPadding:
                                        //                       //         EdgeInsets
                                        //                       //             .only(
                                        //                       //       left: 10,
                                        //                       //       bottom: 5,
                                        //                       //     ),
                                        //                       //     blurRadius: 0.0,
                                        //                       //     maxLines: 1,
                                        //                       //     offset: Offset(
                                        //                       //       0.0,
                                        //                       //       0,
                                        //                       //     ),
                                        //                       //     containerborder:
                                        //                       //         Border.all(
                                        //                       //             color:
                                        //                       //                 borderblue),
                                        //                       //     containercolor:
                                        //                       //         white,
                                        //                       //     borderRadius:
                                        //                       //         BorderRadius
                                        //                       //             .circular(
                                        //                       //                 10),
                                        //                       //     controller:
                                        //                       //         fillTextField[
                                        //                       //                 index]
                                        //                       //             [
                                        //                       //             "controller"],
                                        //                       //     textStyle:
                                        //                       //         TextStyle(
                                        //                       //             fontSize:
                                        //                       //                 20),
                                        //                       //   ),
                                        //                       // ),
                                        //                       // Expanded(
                                        //                       //   flex: 3,
                                        //                       //   child: RichText(
                                        //                       //     text: TextSpan(
                                        //                       //       children: <
                                        //                       //           TextSpan>[
                                        //                       //         TextSpan(
                                        //                       //             text: fillTextField[
                                        //                       //                     index]
                                        //                       //                 [
                                        //                       //                 "title"],
                                        //                       //             style: TextStyle(
                                        //                       //                 fontWeight: FontWeight
                                        //                       //                     .w400,
                                        //                       //                 fontSize: MediaQuery.of(context).orientation == Orientation.landscape
                                        //                       //                     ? 20
                                        //                       //                     : 17)),
                                        //                       //         TextSpan(
                                        //                       //           text: star,
                                        //                       //           style: TextStyle(
                                        //                       //               fontWeight:
                                        //                       //                   FontWeight
                                        //                       //                       .bold,
                                        //                       //               color:
                                        //                       //                   cinnabarRed,
                                        //                       //               fontSize:
                                        //                       //                   20),
                                        //                       //         ),
                                        //                       //       ],
                                        //                       //     ),
                                        //                       //   ),
                                        //                       // ),
                                        //                       // Expanded(
                                        //                       //   flex: 4,
                                        //                       //   child:
                                        //                       //       CustomTextfeild(
                                        //                       //     height: 44,
                                        //                       //     textCapitalization:
                                        //                       //         TextCapitalization
                                        //                       //             .none,
                                        //                       //     contentPadding:
                                        //                       //         EdgeInsets
                                        //                       //             .only(
                                        //                       //       left: 10,
                                        //                       //       bottom: 5,
                                        //                       //     ),
                                        //                       //     blurRadius: 4.0,
                                        //                       //     maxLines: 1,
                                        //                       //     offset: Offset(
                                        //                       //       0.0,
                                        //                       //       4,
                                        //                       //     ),
                                        //                       //     containerborder:
                                        //                       //         Border.all(
                                        //                       //             color:
                                        //                       //                 webBorder),
                                        //                       //     containercolor:
                                        //                       //         white,
                                        //                       //     borderRadius:
                                        //                       //         BorderRadius
                                        //                       //             .circular(
                                        //                       //                 10),
                                        //                       //     controller:
                                        //                       //         fillTextField[
                                        //                       //                 index]
                                        //                       //             [
                                        //                       //             "controller"],
                                        //                       //     textStyle:
                                        //                       //         TextStyle(
                                        //                       //             fontSize:
                                        //                       //                 20),
                                        //                       //   ),
                                        //                       // ),
                                        //                     ],
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         );
                                        //       },
                                        //     ),
                                        //   ),
                                        // ),
                                        // Gap(500),
                                        // Container(
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.start,
                                        //     children: [
                                        //       // Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.02 : 10),
                                        //       Expanded(
                                        //         child: Text(
                                        //           selectTheCities,
                                        //           style: TextStyle(
                                        //               fontWeight: FontWeight.w500,
                                        //               fontSize: 20,
                                        //               color: blue,
                                        //               letterSpacing: 0.7),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Gap(40),
                                        // Center(
                                        //   child: Container(
                                        //     height: MediaQuery.of(context)
                                        //                 .orientation ==
                                        //             Orientation.landscape
                                        //         ? 90
                                        //         : 136,
                                        //     // width: 900,
                                        //     // color: Colors.greenAccent,
                                        //     child: GridView.builder(
                                        //       physics:
                                        //           NeverScrollableScrollPhysics(),
                                        //       // itemCount: 4,
                                        //       itemCount: selectCity.length,
                                        //       gridDelegate:
                                        //           SliverGridDelegateWithFixedCrossAxisCount(
                                        //         crossAxisCount:
                                        //             MediaQuery.of(context)
                                        //                         .orientation ==
                                        //                     Orientation.landscape
                                        //                 ? 3
                                        //                 : 2,
                                        //         // crossAxisCount: 2,
                                        //         crossAxisSpacing: 20,
                                        //         mainAxisSpacing: 15,
                                        //         childAspectRatio: (4 / 1),
                                        //       ),
                                        //       itemBuilder: (context, index) {
                                        //         return Container(
                                        //           // height: 60,
                                        //           width: MediaQuery.of(context)
                                        //                       .orientation ==
                                        //                   Orientation.landscape
                                        //               ? MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.3
                                        //               : MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.7,
                                        //           decoration: BoxDecoration(
                                        //               // border: Border.all( color: borderColor,width: 5),
                                        //               // boxShadow: [
                                        //               //   BoxShadow(
                                        //               //     color: Colors.black26,
                                        //               //     blurRadius: 4.0,
                                        //               //     offset: Offset(0.0, 4,),
                                        //               //   ),
                                        //               // ],
                                        //               ),
                                        //           child: CustomSelectWeb(
                                        //             borderCon: BorderSide(
                                        //               width: 1.0,
                                        //               color: webBorder,
                                        //             ),
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 color: Colors.black26,
                                        //                 blurRadius: 4.0,
                                        //                 offset: Offset(
                                        //                   0.0,
                                        //                   4,
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //             iconColor: webBorder,
                                        //             textStyle: TextStyle(
                                        //               fontSize: 16,
                                        //               color: greenjerry,
                                        //               fontWeight: FontWeight.w600,
                                        //             ),
                                        //             color: white,
                                        //             onChanged: (val) {
                                        //               statee.value = val;
                                        //             },
                                        //             items: selectCity[index]
                                        //                 ["dataList"],
                                        //             hint: selectCity[index]
                                        //                 ["hintText"],
                                        //           ),
                                        //         );
                                        //       },
                                        //     ),
                                        //   ),
                                        // ),
                                        // Gap(160),
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
            Gap(70),
            CustomWebBottomBar(
              bgColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
