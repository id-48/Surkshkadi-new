
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/req_store_cp_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/resgister_view_model.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class RegisterWeb extends HookConsumerWidget {
  const RegisterWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basicDetail = useState<bool>(true);
    final eKYC = useState<bool>(false);
    final individualCheck = useState<bool>(true);
    final companyCheck = useState<bool>(false);
    final statee = useState<String>('');
    final cityy = useState<String>('');
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final mailController = useTextEditingController();
    final companyNameController = useTextEditingController();
    final mobileController = useTextEditingController();

    final cityList = useState<List<String>>([]);

    useEffect(() {
      ref.read(stateProvider.notifier).getState(context: context).then((value) {

        if (value!.status == 1) {

          for (int i = 0; i < value.response.states.length; i++) {

            stateList.add(value.response.states[i].name);
          }
        } else {
          displayToast("${value.message}");
        }
      });
    },[]);





    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppbarWeb(
              index: 3,
              boxShadow: true,
              button: false,
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
                            basicDetail.value = true;
                            if (basicDetail.value == true) {
                              eKYC.value = false;
                            }
                          },
                          child: Container(
                            height: 60,
                            color: basicDetail.value == true ? oreng : amber,
                            alignment: Alignment.center,
                            child: Text(
                              stepOneBasic,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: basicDetail.value == true
                                      ? white
                                      : black),
                            ),
                          ),
                        ),
                      ),
                      // Gap(5),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       eKYC.value = true;
                      //       if (eKYC.value == true) {
                      //         basicDetail.value = false;
                      //       }
                      //     },
                      //     child: Container(
                      //       height: 60,
                      //       color: eKYC.value == true ? oreng : amber,
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         stepTwoUpload,
                      //         style: TextStyle(
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.w400,
                      //             color: eKYC.value == true ? white : black),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                      child: Column(
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
                                              individualCheck.value = true;
                                              if (individualCheck.value ==
                                                  true) {
                                                companyCheck.value = false;
                                              }
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
                                              companyCheck.value = true;
                                              if (companyCheck.value == true) {
                                                individualCheck.value = false;
                                              }
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
                                      ResponsiveGridRow (
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
                                                                color: black,
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
                                                                color: black,
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
                                                      maxLength: 10,
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
                                                                color: black,
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
                                                                color: black,
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
                                      if (companyCheck.value == true) ...[
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
                                                              text: companyName,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: black,
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
                                                                color:
                                                                    webBorder),
                                                        containercolor: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        controller:
                                                            companyNameController,
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
                                              child: Container(),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                                                color: black,
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
                                                      onChanged:
                                                          (stateVal) async {
                                                        cityList.value.clear();
                                                        statee.value = stateVal;

                                                        ReqCity cityData = ReqCity(
                                                            state:
                                                                "${stateVal}");

                                                        await ref
                                                            .read(cityProvider
                                                                .notifier)
                                                            .getCity(
                                                                context:
                                                                    context,
                                                                data: cityData)
                                                            .then((value) {
                                                          if (value!.status ==
                                                              1) {
                                                            // displayToast("${value.message}");
                                                            for (int j = 0;
                                                                j <
                                                                    value
                                                                        .response
                                                                        .cities
                                                                        .length;
                                                                j++) {
                                                              cityList.value
                                                                  .add(value
                                                                      .response
                                                                      .cities[j]
                                                                      .name);
                                                            }
                                                          } else {
                                                            displayToast(
                                                                "${value.message}");
                                                          }
                                                        });
                                                      },
                                                      items: stateList,
                                                      // items: selectStateCity[0]
                                                      // ["dataList"],
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
                                                                color: black,
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
                                                        cityy.value = val;
                                                      },
                                                      items: cityList.value,
                                                      // items: selectStateCity[1]
                                                      // ["dataList"],
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
                                      Gap(20),
                                      InkWell(
                                        onTap: () async {
                                          // ReqStoreCPDetails StoreCPDetailsData =
                                          //     ReqStoreCPDetails(
                                          //   userId: "5",
                                          //   // userId: "${getString(prefUserID)}",
                                          //   partnerType: "Company",
                                          //   companyName: "test Company",
                                          //   firstName: "test",
                                          //   lastName: 'test Company',
                                          //   email: "test@gmail.com",
                                          //   contactNumber: "1023654789",
                                          //   state: "Gujarat",
                                          //   city: "Surat",
                                          // );
                                          //
                                          // print(
                                          //     'yashu patel------>>>>>> individual ');
                                          //
                                          // await ref
                                          //     .read(storeCPDetailsProvider
                                          //         .notifier)
                                          //     .storeCPDetails(
                                          //         context: context,
                                          //         data: StoreCPDetailsData)
                                          //     .then((value) {
                                          //   print(
                                          //       'yashu patel------>>>>>> individual 111111');
                                          //   print(
                                          //       'yashu patel------>>>>>> individual status 111111 ${value?.status} ');
                                          //   if (value!.status == 1) {
                                          //     print("Yashu Patel");
                                          //     displayToast(value.message);
                                          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));
                                          //     // eKYC.value = true;
                                          //   } else {
                                          //     displayToast(value.message);
                                          //   }
                                          // });
///
                                          print("Test ---}");

                                          if(companyCheck.value == true) {
                                            if(mobileController.text.length == 10){
                                            if (firstNameController.text.isNotEmpty
                                                && lastNameController.text.isNotEmpty
                                                && mailController.text.isNotEmpty
                                                && mobileController.text.isNotEmpty
                                                && statee.value.isNotEmpty
                                                && cityy.value.isNotEmpty
                                                && companyNameController.text.isNotEmpty

                                            ) {
                                              setString(prefCompanyName,
                                                  "${ individualCheck.value
                                                      ? ""
                                                      : companyNameController
                                                      .text}");
                                              setString(prefClientType,
                                                  "${ individualCheck.value
                                                      ? "Individual"
                                                      : "Company"}");


                                              ReqStoreCPDetails StoreCPDetailsData = ReqStoreCPDetails(
                                                userId: "3",
                                                // userId: "${getString(prefUserID)}",
                                                partnerType: individualCheck
                                                    .value
                                                    ? "Individual"
                                                    : "Company",
                                                companyName: individualCheck
                                                    .value
                                                    ? ""
                                                    : companyNameController
                                                    .text,
                                                firstName: firstNameController
                                                    .text,
                                                lastName: lastNameController
                                                    .text,
                                                email: mailController.text,
                                                contactNumber: mobileController
                                                    .text,
                                                state: statee.value,
                                                city: cityy.value,
                                              );

                                              print(
                                                  'yashu patel company ------>>>>>>');

                                              await ref.read(
                                                  storeCPDetailsProvider
                                                      .notifier)
                                                  .storeCPDetails(
                                                  context: context,
                                                  data: StoreCPDetailsData)
                                                  .then((value) {
                                                print(
                                                    'yashu patel------>>>>>> company 111111');
                                                print(
                                                    'yashu patel------>>>>>> company status 111111 ${value
                                                        ?.status} ');
                                                if (value!.status == 1) {
                                                  print(
                                                      "Yashu Patel company Success");
                                                  displayToast(value.message);
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));
                                                  eKYC.value = true;
                                                } else {
                                                  print(
                                                      "Yashu Patel company Error");

                                                  displayToast(value.message);
                                                }
                                              });
                                            }else{
                                              displayToast("Enter 10 Digit Number");

                                            }
                                            } else {
                                              displayToast("Please Provide Details");
                                            }
                                          }
                                          else{
                                            if (firstNameController.text.isNotEmpty
                                                && lastNameController.text.isNotEmpty
                                                && mailController.text.isNotEmpty
                                                && mobileController.text.isNotEmpty
                                                && statee.value.isNotEmpty
                                                && cityy.value.isNotEmpty

                                            ) {

                                              setString(prefCompanyName, "${ individualCheck.value ? "" : companyNameController.text}");
                                              setString(prefClientType, "${ individualCheck.value ? "Individual" : "Company"}");



                                              ReqStoreCPDetails StoreCPDetailsData = ReqStoreCPDetails(
                                                userId: "3",
                                                // userId: "${getString(prefUserID)}",
                                                partnerType: individualCheck.value? "Individual" : "Company",
                                                companyName: individualCheck.value ? "" : companyNameController.text,
                                                firstName: firstNameController.text,
                                                lastName: lastNameController.text,
                                                email: mailController.text,
                                                contactNumber: mobileController.text,
                                                state: statee.value,
                                                city: cityy.value,
                                              );

                                              print('yashu patel------>>>>>> individual ');

                                              await ref.read(
                                                  storeCPDetailsProvider.notifier)
                                                  .storeCPDetails(context: context,
                                                  data: StoreCPDetailsData)
                                                  .then((value) {
                                                print('yashu patel------>>>>>> individual 111111');
                                                print('yashu patel------>>>>>> individual status 111111 ${value?.status} ');
                                                if (value!.status == 1) {
                                                  print("Yashu Patel");
                                                  displayToast(value.message);
                                                  navigationService.push(routeStartPartnerWithWeb);
                                                  eKYC.value = true;
                                                } else {
                                                  displayToast(value.message);
                                                }
                                              });


                                            } else {
                                              displayToast("Please Provide Details");
                                            }
                                          }


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



///     KYC code  in web -------- Not Remove  ------

//final adharCardController = useTextEditingController();
// final pANCardController = useTextEditingController();
// final adharCardOTPController = useTextEditingController();
// final pANCardOTPController = useTextEditingController();
//
// final isOtp = useState<bool>(false);
// final aadharClientId = useState<String>("");
//
// final aadharFrontType = useState<String>("");
// final aadharBackType = useState<String>("");
// final panFrontType = useState<String>("");
// final selfieType = useState<String>("");
// final isAadhar = useState<bool>(false);
// final isPanCard = useState<bool>(false);
// ImagePicker _picker = ImagePicker();
//
// final aadharImage = useState<XFile?>(XFile(''));
// final aadharPickedImage = useState<File>(File(""));
// final isAadharPicked = useState<bool>(false);
//
// final aadharBackImage = useState<XFile?>(XFile(''));
// final aadharBackPickedImage = useState<File>(File(""));
// final isAadharBackPicked = useState<bool>(false);
//
// final panImage = useState<XFile?>(XFile(''));
// final panPickedImage = useState<File>(File(""));
// final isPanPicked = useState<bool>(false);
//
// final selfieImage = useState<XFile?>(XFile(''));
// final selfiePickedImage = useState<File>(File(""));
// final isSelfiePicked = useState<bool>(false);


///
//Column(
//                               children: [
//                                 Container(
//                                   height: 80,
//                                   alignment: Alignment.bottomCenter,
//                                   decoration: BoxDecoration(
//                                     color: Colors.greenAccent,
//                                     gradient: LinearGradient(
//                                       begin: FractionalOffset.topCenter,
//                                       end: FractionalOffset.bottomCenter,
//                                       colors: [
//                                         Color(0xFFA0C1D8),
//                                         Color(0xFFffffff),
//                                       ],
//                                     ),
//                                   ),
//                                   child: Text(
//                                     AttachTheFollowing,
//                                     style: GoogleFonts.bonaNova(
//                                         textStyle: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 24)),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: MediaQuery.of(context)
//                                                 .orientation ==
//                                             Orientation.landscape
//                                         ? MediaQuery.of(context).size.width *
//                                             0.055
//                                         : 20,
//                                     // vertical: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.04 : 20,
//                                   ),
//                                   child: Form(
//                                     key: formkey,
//                                     child: Column(
//                                       children: [
//                                         Gap(30),
//                                         Text(
//                                           uploadYourProof,
//                                           style: TextStyle(
//                                               color: Color(0xFF2F75C9),
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 24),
//                                         ),
//                                         Gap(30),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               border: Border.all(
//                                                   color: borderblue)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 50, vertical: 20),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 ResponsiveGridRow(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     ResponsiveGridCol(
//                                                       md: 6,
//                                                       xs: 12,
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             pleaseAddYourAdharCard,
//                                                             style: TextStyle(
//                                                                 color: Color(
//                                                                     0xFF2F75C9),
//                                                                 fontFamily:
//                                                                     fontFamily,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                                 fontSize: 20),
//                                                           ),
//                                                           Gap(20),
//                                                           Text(
//                                                             aadharCardNo,
//                                                             style: TextStyle(
//                                                                 fontFamily:
//                                                                     fontFamily,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600,
//                                                                 fontSize: 16),
//                                                           ),
//                                                           Gap(10),
//                                                           customeFormTextField(
//                                                             enabled: isOtp.value
//                                                                 ? false
//                                                                 : true,
//                                                             height: 42,
//                                                             maxLines: 1,
//                                                             context: context,
//                                                             borderColor:
//                                                                 borderblue,
//                                                             controller:
//                                                                 adharCardController,
//                                                             validation:
//                                                                 validateName,
//                                                           ),
//                                                           CustomButton(
//                                                             padding: EdgeInsets
//                                                                 .symmetric(
//                                                                     vertical: 6,
//                                                                     horizontal:
//                                                                         12),
//                                                             onTap:
//                                                                 isOtp.value
//                                                                     ? () {}
//                                                                     : () async {
//                                                                         if (adharCardController
//                                                                             .text
//                                                                             .isNotEmpty) {
//                                                                           ReqAadharNo
//                                                                               aadharCardNo =
//                                                                               ReqAadharNo(aadhaarNumber: adharCardController.text);
//
//                                                                           ref
//                                                                               .read(aadharNoProvider.notifier)
//                                                                               .getAadharNo(
//                                                                                 context: context,
//                                                                                 data: aadharCardNo,
//                                                                               )
//                                                                               .then((value) {
//                                                                             if (value!.result!.statusCode ==
//                                                                                 200) {
//                                                                               displayToast("OTP Sent."); //OTP Sent.
//
//                                                                               print("Your Pan Card Verify");
//                                                                               print("Your Name --->> ${value.toJson()}");
//                                                                               print("Your Name --->> ${value.result!.message}");
//                                                                               aadharClientId.value = "${value.result!.data!.clientId}";
//                                                                               isOtp.value = true;
//                                                                             } else {
//                                                                               displayToast("Enter Valid Aadhar Card Number");
//                                                                             }
//                                                                           });
//                                                                         } else {
//                                                                           displayToast(
//                                                                               "Please Enter Your Aadhar Card No.");
//                                                                         }
//                                                                       },
//                                                             title: sendOtp,
//                                                           ),
//
//                                                           if (isOtp.value) ...[
//                                                             Gap(20),
//                                                             Text(
//                                                               enterOTP,
//                                                               style: TextStyle(
//                                                                   fontFamily:
//                                                                       fontFamily,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   fontSize: 16),
//                                                             ),
//                                                             Gap(10),
//                                                             customeFormTextField(
//                                                             enabled: isAadhar.value
//                                                                 ? false
//                                                                 : true,
//                                                               height: 42,
//                                                               maxLines: 1,
//                                                               context: context,
//                                                               borderColor:
//                                                                   borderblue,
//                                                               controller:
//                                                                   adharCardOTPController,
//                                                               validation:
//                                                                   validateName,
//                                                             ),
//                                                             GestureDetector(
//                                                               onTap: isAadhar.value
//                                                                   ? () {}
//                                                                   :(){
//                                                                 if (adharCardController
//                                                                     .text
//                                                                     .isNotEmpty) {
//                                                                   ReqAadharNo
//                                                                   aadharCardNo =
//                                                                   ReqAadharNo(aadhaarNumber: adharCardController.text);
//
//                                                                   ref
//                                                                       .read(aadharNoProvider.notifier)
//                                                                       .getAadharNo(
//                                                                     context: context,
//                                                                     data: aadharCardNo,
//                                                                   )
//                                                                       .then((value) {
//                                                                     if (value!.result!.statusCode ==
//                                                                         200) {
//                                                                       displayToast("OTP Sent."); //OTP Sent.
//
//                                                                       print("Your Pan Card Verify");
//                                                                       print("Your Name --->> ${value.toJson()}");
//                                                                       print("Your Name --->> ${value.result!.message}");
//                                                                       aadharClientId.value = "${value.result!.data!.clientId}";
//                                                                       isOtp.value = true;
//                                                                     } else {
//                                                                       displayToast("Enter Valid Aadhar Card Number");
//                                                                     }
//                                                                   });
//                                                                 } else {
//                                                                   displayToast(
//                                                                       "Please Enter Your Aadhar Card No.");
//                                                                 }
//                                                               },
//                                                               child: Text(
//                                                                 resend,
//                                                                 style: TextStyle(
//                                                                     fontFamily:
//                                                                     fontFamily,
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .w600,
//                                                                     fontSize: 16),
//                                                               ),
//                                                             ),
//                                                             Gap(20),
//                                                             CustomButton(
//                                                               padding: EdgeInsets.symmetric(
//                                                                   vertical: 6, horizontal: 12),
//                                                               onTap: isAadhar.value
//                                                                   ? () {}
//                                                                   : () async {
//                                                                 if (adharCardOTPController
//                                                                     .text.isNotEmpty) {
//                                                                   ReqAadharOtp aadharCardOtp =
//                                                                   ReqAadharOtp(
//                                                                       otp:
//                                                                       adharCardOTPController
//                                                                           .text,
//                                                                       clientId:
//                                                                       aadharClientId
//                                                                           .value);
//
//                                                                   ///          422364183120
//                                                                   await ref
//                                                                       .read(aadharOtpProvider
//                                                                       .notifier)
//                                                                       .getAadharOtp(
//                                                                     context: context,
//                                                                     data: aadharCardOtp,
//                                                                   )
//                                                                       .then((value) {
//                                                                     if (value!.result.statusCode == 200) {
//                                                                       isAadhar.value = true;
//
//                                                                       // print("image --->> ${value.result.data.profileImage}");
//
//                                                                       displayToast(
//                                                                           "Your Aadhar Card Verify");
//                                                                       print(
//                                                                           "Your Pan Card Verify");
//                                                                       print(
//                                                                           "Your Name --->> ${value.toJson()}");
//                                                                     } else {
//                                                                       displayToast(
//                                                                           "Enter Your Right OTP");
//                                                                     }
//                                                                   });
//                                                                 } else {
//                                                                   displayToast(
//                                                                       "Please Enter Your Aadhar OTP");
//                                                                 }
//                                                               },
//                                                               title: verify,
//                                                             ),
//                                                             Gap(20),
//                                                           ],
//
//
//                                                           // Expanded(
//                                                           //   flex: 4,
//                                                           //   child:
//                                                           //       CustomTextfeild(
//                                                           //     height: 44,
//                                                           //     textCapitalization:
//                                                           //         TextCapitalization
//                                                           //             .none,
//                                                           //     contentPadding:
//                                                           //         EdgeInsets
//                                                           //             .only(
//                                                           //       left: 10,
//                                                           //       bottom: 5,
//                                                           //     ),
//                                                           //     blurRadius: 0.0,
//                                                           //     maxLines: 1,
//                                                           //     offset: Offset(
//                                                           //       0.0,
//                                                           //       0,
//                                                           //     ),
//                                                           //     containerborder:
//                                                           //         Border.all(
//                                                           //             color:
//                                                           //                 borderblue),
//                                                           //     containercolor:
//                                                           //         white,
//                                                           //     borderRadius:
//                                                           //         BorderRadius
//                                                           //             .circular(
//                                                           //                 10),
//                                                           //     controller:
//                                                           //         fillTextField[
//                                                           //                 index]
//                                                           //             [
//                                                           //             "controller"],
//                                                           //     textStyle:
//                                                           //         TextStyle(
//                                                           //             fontSize:
//                                                           //                 20),
//                                                           //   ),
//                                                           // ),
//                                                           // Expanded(
//                                                           //   flex: 3,
//                                                           //   child: RichText(
//                                                           //     text: TextSpan(
//                                                           //       children: <
//                                                           //           TextSpan>[
//                                                           //         TextSpan(
//                                                           //             text: fillTextField[
//                                                           //                     index]
//                                                           //                 [
//                                                           //                 "title"],
//                                                           //             style: TextStyle(
//                                                           //                 fontWeight: FontWeight
//                                                           //                     .w400,
//                                                           //                 fontSize: MediaQuery.of(context).orientation == Orientation.landscape
//                                                           //                     ? 20
//                                                           //                     : 17)),
//                                                           //         TextSpan(
//                                                           //           text: star,
//                                                           //           style: TextStyle(
//                                                           //               fontWeight:
//                                                           //                   FontWeight
//                                                           //                       .bold,
//                                                           //               color:
//                                                           //                   cinnabarRed,
//                                                           //               fontSize:
//                                                           //                   20),
//                                                           //         ),
//                                                           //       ],
//                                                           //     ),
//                                                           //   ),
//                                                           // ),
//                                                           // Expanded(
//                                                           //   flex: 4,
//                                                           //   child:
//                                                           //       CustomTextfeild(
//                                                           //     height: 44,
//                                                           //     textCapitalization:
//                                                           //         TextCapitalization
//                                                           //             .none,
//                                                           //     contentPadding:
//                                                           //         EdgeInsets
//                                                           //             .only(
//                                                           //       left: 10,
//                                                           //       bottom: 5,
//                                                           //     ),
//                                                           //     blurRadius: 4.0,
//                                                           //     maxLines: 1,
//                                                           //     offset: Offset(
//                                                           //       0.0,
//                                                           //       4,
//                                                           //     ),
//                                                           //     containerborder:
//                                                           //         Border.all(
//                                                           //             color:
//                                                           //                 webBorder),
//                                                           //     containercolor:
//                                                           //         white,
//                                                           //     borderRadius:
//                                                           //         BorderRadius
//                                                           //             .circular(
//                                                           //                 10),
//                                                           //     controller:
//                                                           //         fillTextField[
//                                                           //                 index]
//                                                           //             [
//                                                           //             "controller"],
//                                                           //     textStyle:
//                                                           //         TextStyle(
//                                                           //             fontSize:
//                                                           //                 20),
//                                                           //   ),
//                                                           // ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     ResponsiveGridCol(
//                                                       md: 6,
//                                                       xs: 12,
//                                                       child: Column(
//                                                         children: [
//                                                           GestureDetector(
//                                                             onTap: () async {
//                                                               print(
//                                                                   '------------->>>>>>>>>>>>>>>>>.image ');
//                                                               aadharImage
//                                                                       .value =
//                                                                   await _picker
//                                                                       .pickImage(
//                                                                           source:
//                                                                               ImageSource.gallery);
//
//                                                               if (aadharImage
//                                                                       .value !=
//                                                                   null) {
//                                                                 aadharPickedImage
//                                                                         .value =
//                                                                     File(aadharImage
//                                                                         .value!
//                                                                         .path);
//                                                                 print('image path 200 -->>>>>>> ${aadharPickedImage.value.path}');
//                                                                 print('image path 200 -->>>>>>> ${aadharPickedImage.value}');
//
//                                                                 File aadharFront = new File(aadharPickedImage.value.path.toString());
//
//                                                                 var aadharImageBytes = await aadharFront.readAsBytesSync();
//                                                                 String  selfieBase64Image = base64Encode(aadharImageBytes);
//
//                                                                 print('image path 200 111111-->>>>>>> ${selfieBase64Image}');
//
//                                                                 // aadharFrontType.value  = "data:image/" + '${aadharPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";
//
//                                                                 // print("front type --- >>>> ${aadharFrontType.value}");
//
//                                                                 isAadharPicked
//                                                                         .value =
//                                                                     true;
//                                                               }
//                                                             },
//                                                             child: Container(
//                                                               height: 200,
//                                                               width: 300,
//
//                                                               // width: double.infinity,
//
//                                                               // margin: EdgeInsets.only(top: 10),
//                                                               child: isAadharPicked
//                                                                           .value
//                                                                   ? Image
//                                                                       .network(
//                                                                       aadharPickedImage
//                                                                           .value
//                                                                           .path,
//                                                                       fit: BoxFit
//                                                                           .fill,
//                                                                     )
//                                                                   : Image.asset(
//                                                                       uploadAdharCard,
//                                                                       scale: 3,
//                                                                     ),
//                                                             ),
//
//                                                             // child: Image.asset(
//                                                             //     uploadAdharCard,
//                                                             //     scale: 3),
//                                                           ),
//                                                           Text(
//                                                             uploadAadharFront,
//                                                             style: TextStyle(
//                                                                 fontSize: 8),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Gap(20),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () async {
//                                                         print(
//                                                             '------------->>>>>>>>>>>>>>>>>.image ');
//                                                         aadharBackImage.value =
//                                                             await _picker.pickImage(
//                                                                 source:
//                                                                     ImageSource
//                                                                         .gallery);
//
//                                                         if (aadharBackImage
//                                                                 .value !=
//                                                             null) {
//                                                           aadharBackPickedImage
//                                                                   .value =
//                                                               File(
//                                                                   aadharBackImage
//                                                                       .value!
//                                                                       .path);
//                                                           print(
//                                                               ' --image path 200 -->>>>>>> ${aadharBackPickedImage.value}');
//
//                                                           // aadharFrontType.value = "data:image/" + '${aadharPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";
//
//                                                           // print("front type --- >>>> ${aadharFrontType.value}");
//
//                                                           isAadharBackPicked
//                                                               .value = true;
//                                                         }
//                                                       },
//                                                       child: Container(
//                                                         height: 200,
//                                                         width: 300,
//
//                                                         // width: double.infinity,
//
//                                                         // margin: EdgeInsets.only(top: 10),
//                                                         child: isAadharBackPicked
//                                                                     .value
//                                                             ? Image.network(
//                                                                 aadharBackPickedImage
//                                                                     .value.path,
//                                                                 fit:
//                                                                     BoxFit.fill,
//                                                               )
//                                                             : Image.asset(
//                                                                 uploadAdharCard,
//                                                                 scale: 3,
//                                                               ),
//                                                       ),
//
//                                                       // child: Image.asset(
//                                                       //     uploadAdharCard,
//                                                       //     scale: 3),
//                                                     ),
//                                                     Text(
//                                                       uploadAadharBack,
//                                                       style: TextStyle(
//                                                           fontSize: 8),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Gap(30),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               border: Border.all(
//                                                   color: borderblue)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 50, vertical: 20),
//                                             child: ResponsiveGridRow(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 ResponsiveGridCol(
//                                                   md: 6,
//                                                   xs: 12,
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         pleaseAddYourPANCard,
//                                                         style: TextStyle(
//                                                             color: Color(
//                                                                 0xFF2F75C9),
//                                                             fontFamily:
//                                                                 fontFamily,
//                                                             fontWeight:
//                                                                 FontWeight.w700,
//                                                             fontSize: 20),
//                                                       ),
//                                                       Gap(20),
//                                                       Text(
//                                                         pANCardNo,
//                                                         style: TextStyle(
//                                                             fontFamily:
//                                                                 fontFamily,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             fontSize: 16),
//                                                       ),
//                                                       Gap(10),
//                                                       customeFormTextField(
//                                                         textCapitalization: TextCapitalization.characters,
//                                                         enabled:  isPanCard.value? false :true,
//                                                         height: 42,
//                                                         maxLines: 1,
//                                                         context: context,
//
//                                                         borderColor: borderblue,
//                                                         controller:
//                                                             pANCardController,
//                                                         validation:
//                                                             validateName,
//                                                       ),
//                                                       Gap(20),
//                                                       GestureDetector(
//                                                         onTap: isPanCard.value
//                                                             ? () {}
//                                                             : () async {
//                                                           if (pANCardController
//                                                               .text.isNotEmpty) {
//                                                             ReqPancardNo panCardData =
//                                                             ReqPancardNo(
//                                                                 pan: pANCardController
//                                                                     .text
//                                                                     .toUpperCase());
//
//                                                             await ref
//                                                                 .read(panCardNoProvider
//                                                                 .notifier)
//                                                                 .getPanCard(
//                                                               context: context,
//                                                               data: panCardData,
//                                                             )
//                                                                 .then((value) {
//                                                               /// bmfpc0772f test number
//                                                               if (value!.result.essentials
//                                                                   .number.isNotEmpty) {
//                                                                 displayToast(
//                                                                     "Your Pan Card Verify Success");
//                                                                 isPanCard.value = true;
//                                                               } else {
//                                                                 displayToast(
//                                                                     "Your Pan Card Detail Wrong");
//                                                               }
//                                                             });
//                                                           } else {
//                                                             displayToast(
//                                                                 "Please Enter Your Pan Card No.");
//                                                           }
//                                                         },
//                                                         child: Text(
//                                                           verify,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight.w600,
//                                                               fontSize: 16),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 ResponsiveGridCol(
//                                                   md: 6,
//                                                   xs: 12,
//                                                   child: Column(
//                                                     children: [
//                                                       GestureDetector(
//                                                         onTap: () async {
//                                                           print(
//                                                               '------------->>>>>>>>>>>>>>>>>.image ');
//                                                           panImage.value =
//                                                               await _picker.pickImage(
//                                                                   source: ImageSource
//                                                                       .gallery);
//
//                                                           if (panImage.value !=
//                                                               null) {
//                                                             panPickedImage
//                                                                     .value =
//                                                                 File(panImage
//                                                                     .value!
//                                                                     .path);
//                                                             print(
//                                                                 ' --image path 200 -->>>>>>> ${panPickedImage.value}');
//
//                                                             // aadharFrontType.value = "data:image/" + '${aadharPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";
//
//                                                             // print("front type --- >>>> ${aadharFrontType.value}");
//
//                                                             isPanPicked.value =
//                                                                 true;
//                                                           }
//                                                         },
//                                                         child: Container(
//                                                           height: 200,
//                                                           width: 300,
//
//                                                           // width: double.infinity,
//
//                                                           // margin: EdgeInsets.only(top: 10),
//                                                           child: isPanPicked
//                                                                       .value ==
//                                                                   true
//                                                               ? Image.network(
//                                                                   panPickedImage
//                                                                       .value
//                                                                       .path,
//                                                                   fit: BoxFit
//                                                                       .fill,
//                                                                 )
//                                                               : Image.asset(
//                                                                   uploadAdharCard,
//                                                                   scale: 3,
//                                                                 ),
//                                                         ),
//
//                                                         // child: Image.asset(
//                                                         //     uploadAdharCard,
//                                                         //     scale: 3),
//                                                       ),
//                                                       Text(
//                                                         "Upload PAN Card here.",
//                                                         style: TextStyle(
//                                                             fontSize: 8),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Gap(30),
//                                         Container(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               border: Border.all(
//                                                   color: borderblue)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 50, vertical: 20),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   addSelfie,
//                                                   style: TextStyle(
//                                                       color: Color(0xFF2F75C9),
//                                                       fontFamily: fontFamily,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       fontSize: 20),
//                                                 ),
//                                                 Center(
//                                                   child: GestureDetector(
//                                                     onTap: () async {
//                                                       print(
//                                                           '------------->>>>>>>>>>>>>>>>>.image ');
//                                                       selfieImage.value =
//                                                           await _picker.pickImage(
//                                                               source:
//                                                                   ImageSource
//                                                                       .gallery);
//
//                                                       if (selfieImage.value !=
//                                                           null) {
//                                                         selfiePickedImage
//                                                                 .value =
//                                                             File(selfieImage
//                                                                 .value!.path);
//                                                         print(
//                                                             ' --image path 200 -->>>>>>> ${selfiePickedImage.value}');
//
//                                                         // aadharFrontType.value = "data:image/" + '${aadharPickedImage.value.absolute}'.split('.')[3].replaceAll("'", "") + ";base64,";
//
//                                                         // print("front type --- >>>> ${aadharFrontType.value}");
//
//                                                         isSelfiePicked.value =
//                                                             true;
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       height: 200,
//                                                       width: 200,
//
//                                                       // width: double.infinity,
//
//                                                       // margin: EdgeInsets.only(top: 10),
//                                                       child: isSelfiePicked
//                                                                   .value ==
//                                                               true
//                                                           ? Image.network(
//                                                               selfiePickedImage
//                                                                   .value.path,
//                                                               fit: BoxFit.fill,
//                                                             )
//                                                           : Image.asset(
//                                                               takeSelfie,
//                                                               scale: 3,
//                                                             ),
//                                                     ),
//
//                                                     // child: Image.asset(
//                                                     //     uploadAdharCard,
//                                                     //     scale: 3),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Gap(30),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             InkWell(
//                                               onTap: () async {
//                                                 // // if (isAadhar.value) {
//                                                 // //   if (isPanCard.value) {
//                                                 //     if (isAadharPicked.value) {
//                                                 //       var aadharFrontImageBytes =
//                                                 //           await aadharPickedImage.value.readAsBytesSync();
//                                                 //           String aadharFrontBase64Image = base64Encode(aadharFrontImageBytes);
//                                                 //            print("Test ---1");
//                                                 //
//                                                 //       if (isAadharBackPicked.value) {
//                                                 //         var aadharBackImageBytes = await aadharBackPickedImage.value.readAsBytesSync();
//                                                 //         String aadharBackBase64Image = base64Encode(aadharBackImageBytes);
//                                                 //
//                                                 //         if (isPanPicked.value) {
//                                                 //           var panImageBytes =
//                                                 //               await panPickedImage
//                                                 //                   .value
//                                                 //                   .readAsBytesSync();
//                                                 //           String
//                                                 //               panBase64Image =
//                                                 //               base64Encode(
//                                                 //                   panImageBytes);
//                                                 //
//                                                 //           if (isSelfiePicked
//                                                 //               .value) {
//                                                 //             var selfieImageBytes = await selfiePickedImage.value.readAsBytesSync();
//                                                 //             String  selfieBase64Image = base64Encode(selfieImageBytes);
//                                                 //
//                                                 //             if (isSelfiePicked
//                                                 //                 .value) {
//                                                 //               print(
//                                                 //                   "image in aadharFront ---->>>");
//                                                 //               print(aadharFrontType
//                                                 //                       .value +
//                                                 //                   aadharFrontBase64Image);
//                                                 //               print(
//                                                 //                   "image in aadharBack ---->>> ");
//                                                 //               print(aadharBackType
//                                                 //                       .value +
//                                                 //                   aadharBackBase64Image);
//                                                 //               print(
//                                                 //                   "image in panCard ---->>> ");
//                                                 //               print(panFrontType
//                                                 //                       .value +
//                                                 //                   panBase64Image);
//                                                 //               print(
//                                                 //                   "image in panCard ---->>> ");
//                                                 //               print(selfieType
//                                                 //                       .value +
//                                                 //                   selfieBase64Image);
//                                                 //
//                                                 //               print(
//                                                 //                   "image in userId ---->>> ");
//                                                 //
//                                                 //               ReqSubmitKyc
//                                                 //                   submitKycDataWeb =
//                                                 //                   ReqSubmitKyc(
//                                                 //                 // userId: getString(prefUserID),
//                                                 //
//                                                 //                 userId: "6",
//                                                 //                 userType:
//                                                 //                     "CP",
//                                                 //                 aadharNo: "gaudsg73d23r",
//                                                 //                 // aadharNo: adharCardController.text,
//                                                 //                 aadharFrontImage:
//                                                 //                     "${aadharFrontType.value + aadharFrontBase64Image}",
//                                                 //                 aadharBackImage:
//                                                 //                     "${aadharBackType.value + aadharBackBase64Image}",
//                                                 //                 panNo: "pANCardController.text",
//                                                 //                 // panNo: pANCardController.text,
//                                                 //                 panFrontImage:
//                                                 //                     "${panFrontType.value + panBase64Image}",
//                                                 //                 selfImage:
//                                                 //                     "${selfieType.value + selfieBase64Image}",
//                                                 //               );
//                                                 //
//                                                 //               await ref
//                                                 //                   .read(submitKycProvider
//                                                 //                       .notifier)
//                                                 //                   .submitKyc(
//                                                 //                       context:
//                                                 //                           context,
//                                                 //                       data:
//                                                 //                           submitKycDataWeb)
//                                                 //                   .then(
//                                                 //                       (value) {
//                                                 //                 if (value!
//                                                 //                         .status ==
//                                                 //                     1) {
//                                                 //                   displayToast(
//                                                 //                       "${value.message}");
//                                                 //                   navigationService
//                                                 //                       .push(
//                                                 //                           routeCPPartnerConfirmationWeb);
//                                                 //                 } else {
//                                                 //                   displayToast(
//                                                 //                       "${value.message}");
//                                                 //                 }
//                                                 //               });
//                                                 //             }
//                                                 //           } else {
//                                                 //             displayToast(
//                                                 //                 "Please Selfie Image Upload");
//                                                 //           }
//                                                 //         } else {
//                                                 //           displayToast(
//                                                 //               "Please Pan Card Front Image Upload");
//                                                 //         }
//                                                 //       } else {
//                                                 //         displayToast(
//                                                 //             "Please Aadhar Card Back Image Upload");
//                                                 //       }
//                                                 //     } else {
//                                                 //       displayToast(
//                                                 //           "Please Aadhar Card Front Image Upload");
//                                                 //     }
//                                                 // //   } else {
//                                                 // //     displayToast(
//                                                 // //         "Please Verify Pan Card");
//                                                 // //   }
//                                                 // // } else {
//                                                 // //   displayToast(
//                                                 // //       "Please Verify Aadhar Card");
//                                                 // // }
//
//                                             ///
//
//
//                                                     var headers = {
//                                                       'Cookie': 'ci_session=2f00200d957cf5675e376eaa3b9781f9da96276e'
//                                                     };
//                                                     var request = MultipartRequest('POST', Uri.parse('https://backends.surakshakadi.com/submit-kyc'));
//                                                     request.fields.addAll({
//                                                       'user_id': '6',
//                                                       'user_type': 'CP',
//                                                       'aadhar_no': '34253u7bsd',
//                                                       'aadhar_front_image': '5dgb4gr',
//                                                       'aadhar_back_image': 'dbtg45',
//                                                       'pan_no': 'duiug45y',
//                                                       'pan_front_image': 'dyg4y5y',
//                                                       'self_image': 'fdgryr5'
//                                                     });
//
//                                                     request.headers.addAll(headers);
//
//                                                     StreamedResponse response = await request.send();
//
//                                                     if (response.statusCode == 200) {
//                                                       print(await response.stream.bytesToString());
//                                                     }
//                                                     else {
//                                                       print(response.reasonPhrase);
//                                                     }
//
//
//                                               },
//                                               child: Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 8,
//                                                     horizontal: 50),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                   color: oreng,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                         color: Colors.black12
//                                                             .withOpacity(0.2),
//                                                         blurRadius: 3.0,
//                                                         offset: Offset(0.0, 5))
//                                                   ],
//                                                 ),
//                                                 child: Text(
//                                                   proceed,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       fontSize: 22,
//                                                       color: white),
//                                                 ),
//                                               ),
//                                             ),
//                                             Gap(20),
//                                             InkWell(
//                                               onTap: () {
//                                                 // print("yashu Patel");
//                                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
//                                                 navigationService.pop();
//                                               },
//                                               child: Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 8,
//                                                     horizontal: 50),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                   border:
//                                                       Border.all(color: oreng),
//                                                   color: white,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                         color: Colors.black12
//                                                             .withOpacity(0.2),
//                                                         blurRadius: 3.0,
//                                                         offset: Offset(0.0, 5))
//                                                   ],
//                                                 ),
//                                                 child: Text(
//                                                   back,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       fontSize: 22,
//                                                       color: black),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Gap(50),
//
//                                         /// old code
//                                         // Center(
//                                         //   child: Container(
//                                         //     height: MediaQuery.of(context)
//                                         //                 .orientation ==
//                                         //             Orientation.landscape
//                                         //         ? 140
//                                         //         : 300,
//                                         //     // width: 900,
//                                         //     child: GridView.builder(
//                                         //       physics:
//                                         //           NeverScrollableScrollPhysics(),
//                                         //       // itemCount: 4,
//                                         //       itemCount: fillTextField.length,
//                                         //       gridDelegate:
//                                         //           SliverGridDelegateWithFixedCrossAxisCount(
//                                         //         crossAxisCount:
//                                         //             MediaQuery.of(context)
//                                         //                         .orientation ==
//                                         //                     Orientation.landscape
//                                         //                 ? 2
//                                         //                 : 1,
//                                         //         // crossAxisCount: 2,
//                                         //         crossAxisSpacing: 20,
//                                         //         mainAxisSpacing: 15,
//                                         //         childAspectRatio: (9 / 1),
//                                         //       ),
//                                         //       itemBuilder: (context, index) {
//                                         //         return Container(
//                                         //           width: MediaQuery.of(context)
//                                         //                       .orientation ==
//                                         //                   Orientation.landscape
//                                         //               ? MediaQuery.of(context)
//                                         //                       .size
//                                         //                       .width *
//                                         //                   0.3
//                                         //               : MediaQuery.of(context)
//                                         //                       .size
//                                         //                       .width *
//                                         //                   0.7,
//                                         //           child: Container(
//                                         //             decoration: BoxDecoration(
//                                         //                 borderRadius:
//                                         //                     BorderRadius.circular(
//                                         //                         10),
//                                         //                 border: Border.all(
//                                         //                     color: Colors
//                                         //                         .blueAccent)),
//                                         //             child: Form(
//                                         //               key: formkey,
//                                         //               child: Row(
//                                         //                 children: [
//                                         //                   Column(
//                                         //                     children: [
//                                         //                       Text(
//                                         //                         pleaseAddYourAdharCard,
//                                         //                         style: GoogleFonts.bonaNova(
//                                         //                             textStyle: TextStyle(
//                                         //                                 color: Color(
//                                         //                                     0xFF2F75C9),
//                                         //                                 fontWeight:
//                                         //                                     FontWeight
//                                         //                                         .w700,
//                                         //                                 fontSize:
//                                         //                                     24)),
//                                         //                       ),
//                                         //                       Text(
//                                         //                         aadharCardNo,
//                                         //                         style: GoogleFonts.bonaNova(
//                                         //                             textStyle: TextStyle(
//                                         //                                 color: Color(
//                                         //                                     0xFF2F75C9),
//                                         //                                 fontWeight:
//                                         //                                     FontWeight
//                                         //                                         .w700,
//                                         //                                 fontSize:
//                                         //                                     24)),
//                                         //                       ),
//                                         //                       Container(
//                                         //                         height: 100,
//                                         //                         width: 100,
//                                         //                         child:
//                                         //                             customeFormTextField(
//                                         //                           // height: 100,
//                                         //                           maxLines: 1,
//                                         //                           context:
//                                         //                               context,
//                                         //                           name:
//                                         //                               "Share More Details",
//                                         //                           controller:
//                                         //                               firstNameController,
//                                         //                           validation:
//                                         //                               validateName,
//                                         //                         ),
//                                         //                       ),
//                                         //                       // Expanded(
//                                         //                       //   flex: 4,
//                                         //                       //   child:
//                                         //                       //       CustomTextfeild(
//                                         //                       //     height: 44,
//                                         //                       //     textCapitalization:
//                                         //                       //         TextCapitalization
//                                         //                       //             .none,
//                                         //                       //     contentPadding:
//                                         //                       //         EdgeInsets
//                                         //                       //             .only(
//                                         //                       //       left: 10,
//                                         //                       //       bottom: 5,
//                                         //                       //     ),
//                                         //                       //     blurRadius: 0.0,
//                                         //                       //     maxLines: 1,
//                                         //                       //     offset: Offset(
//                                         //                       //       0.0,
//                                         //                       //       0,
//                                         //                       //     ),
//                                         //                       //     containerborder:
//                                         //                       //         Border.all(
//                                         //                       //             color:
//                                         //                       //                 borderblue),
//                                         //                       //     containercolor:
//                                         //                       //         white,
//                                         //                       //     borderRadius:
//                                         //                       //         BorderRadius
//                                         //                       //             .circular(
//                                         //                       //                 10),
//                                         //                       //     controller:
//                                         //                       //         fillTextField[
//                                         //                       //                 index]
//                                         //                       //             [
//                                         //                       //             "controller"],
//                                         //                       //     textStyle:
//                                         //                       //         TextStyle(
//                                         //                       //             fontSize:
//                                         //                       //                 20),
//                                         //                       //   ),
//                                         //                       // ),
//                                         //                       // Expanded(
//                                         //                       //   flex: 3,
//                                         //                       //   child: RichText(
//                                         //                       //     text: TextSpan(
//                                         //                       //       children: <
//                                         //                       //           TextSpan>[
//                                         //                       //         TextSpan(
//                                         //                       //             text: fillTextField[
//                                         //                       //                     index]
//                                         //                       //                 [
//                                         //                       //                 "title"],
//                                         //                       //             style: TextStyle(
//                                         //                       //                 fontWeight: FontWeight
//                                         //                       //                     .w400,
//                                         //                       //                 fontSize: MediaQuery.of(context).orientation == Orientation.landscape
//                                         //                       //                     ? 20
//                                         //                       //                     : 17)),
//                                         //                       //         TextSpan(
//                                         //                       //           text: star,
//                                         //                       //           style: TextStyle(
//                                         //                       //               fontWeight:
//                                         //                       //                   FontWeight
//                                         //                       //                       .bold,
//                                         //                       //               color:
//                                         //                       //                   cinnabarRed,
//                                         //                       //               fontSize:
//                                         //                       //                   20),
//                                         //                       //         ),
//                                         //                       //       ],
//                                         //                       //     ),
//                                         //                       //   ),
//                                         //                       // ),
//                                         //                       // Expanded(
//                                         //                       //   flex: 4,
//                                         //                       //   child:
//                                         //                       //       CustomTextfeild(
//                                         //                       //     height: 44,
//                                         //                       //     textCapitalization:
//                                         //                       //         TextCapitalization
//                                         //                       //             .none,
//                                         //                       //     contentPadding:
//                                         //                       //         EdgeInsets
//                                         //                       //             .only(
//                                         //                       //       left: 10,
//                                         //                       //       bottom: 5,
//                                         //                       //     ),
//                                         //                       //     blurRadius: 4.0,
//                                         //                       //     maxLines: 1,
//                                         //                       //     offset: Offset(
//                                         //                       //       0.0,
//                                         //                       //       4,
//                                         //                       //     ),
//                                         //                       //     containerborder:
//                                         //                       //         Border.all(
//                                         //                       //             color:
//                                         //                       //                 webBorder),
//                                         //                       //     containercolor:
//                                         //                       //         white,
//                                         //                       //     borderRadius:
//                                         //                       //         BorderRadius
//                                         //                       //             .circular(
//                                         //                       //                 10),
//                                         //                       //     controller:
//                                         //                       //         fillTextField[
//                                         //                       //                 index]
//                                         //                       //             [
//                                         //                       //             "controller"],
//                                         //                       //     textStyle:
//                                         //                       //         TextStyle(
//                                         //                       //             fontSize:
//                                         //                       //                 20),
//                                         //                       //   ),
//                                         //                       // ),
//                                         //                     ],
//                                         //                   ),
//                                         //                 ],
//                                         //               ),
//                                         //             ),
//                                         //           ),
//                                         //         );
//                                         //       },
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         // Gap(500),
//                                         // Container(
//                                         //   child: Row(
//                                         //     mainAxisAlignment:
//                                         //         MainAxisAlignment.start,
//                                         //     children: [
//                                         //       // Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.02 : 10),
//                                         //       Expanded(
//                                         //         child: Text(
//                                         //           selectTheCities,
//                                         //           style: TextStyle(
//                                         //               fontWeight: FontWeight.w500,
//                                         //               fontSize: 20,
//                                         //               color: blue,
//                                         //               letterSpacing: 0.7),
//                                         //         ),
//                                         //       ),
//                                         //     ],
//                                         //   ),
//                                         // ),
//                                         // Gap(40),
//                                         // Center(
//                                         //   child: Container(
//                                         //     height: MediaQuery.of(context)
//                                         //                 .orientation ==
//                                         //             Orientation.landscape
//                                         //         ? 90
//                                         //         : 136,
//                                         //     // width: 900,
//                                         //     // color: Colors.greenAccent,
//                                         //     child: GridView.builder(
//                                         //       physics:
//                                         //           NeverScrollableScrollPhysics(),
//                                         //       // itemCount: 4,
//                                         //       itemCount: selectCity.length,
//                                         //       gridDelegate:
//                                         //           SliverGridDelegateWithFixedCrossAxisCount(
//                                         //         crossAxisCount:
//                                         //             MediaQuery.of(context)
//                                         //                         .orientation ==
//                                         //                     Orientation.landscape
//                                         //                 ? 3
//                                         //                 : 2,
//                                         //         // crossAxisCount: 2,
//                                         //         crossAxisSpacing: 20,
//                                         //         mainAxisSpacing: 15,
//                                         //         childAspectRatio: (4 / 1),
//                                         //       ),
//                                         //       itemBuilder: (context, index) {
//                                         //         return Container(
//                                         //           // height: 60,
//                                         //           width: MediaQuery.of(context)
//                                         //                       .orientation ==
//                                         //                   Orientation.landscape
//                                         //               ? MediaQuery.of(context)
//                                         //                       .size
//                                         //                       .width *
//                                         //                   0.3
//                                         //               : MediaQuery.of(context)
//                                         //                       .size
//                                         //                       .width *
//                                         //                   0.7,
//                                         //           decoration: BoxDecoration(
//                                         //               // border: Border.all( color: borderColor,width: 5),
//                                         //               // boxShadow: [
//                                         //               //   BoxShadow(
//                                         //               //     color: Colors.black26,
//                                         //               //     blurRadius: 4.0,
//                                         //               //     offset: Offset(0.0, 4,),
//                                         //               //   ),
//                                         //               // ],
//                                         //               ),
//                                         //           child: CustomSelectWeb(
//                                         //             borderCon: BorderSide(
//                                         //               width: 1.0,
//                                         //               color: webBorder,
//                                         //             ),
//                                         //             boxShadow: [
//                                         //               BoxShadow(
//                                         //                 color: Colors.black26,
//                                         //                 blurRadius: 4.0,
//                                         //                 offset: Offset(
//                                         //                   0.0,
//                                         //                   4,
//                                         //                 ),
//                                         //               ),
//                                         //             ],
//                                         //             iconColor: webBorder,
//                                         //             textStyle: TextStyle(
//                                         //               fontSize: 16,
//                                         //               color: greenjerry,
//                                         //               fontWeight: FontWeight.w600,
//                                         //             ),
//                                         //             color: white,
//                                         //             onChanged: (val) {
//                                         //               statee.value = val;
//                                         //             },
//                                         //             items: selectCity[index]
//                                         //                 ["dataList"],
//                                         //             hint: selectCity[index]
//                                         //                 ["hintText"],
//                                         //           ),
//                                         //         );
//                                         //       },
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         // Gap(160),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),



