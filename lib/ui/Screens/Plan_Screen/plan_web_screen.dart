import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';
import 'package:surakshakadi/widgets/loading.dart';

class PlansWeb extends HookConsumerWidget {
   PlansWeb({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState<int>( planIndexWeb ?? 1);
    final isCheck = useState<bool>( planTypeWeb ?? true);
    final planWebController = ref.watch(dashboardProvider);

    useEffect(() {
      ref.read(dashboardProvider.notifier).getDashboard(context: context);
    }, []);



    final selectedindex = useState<int>(2);

    print(
        'Enter Height ===> ${MediaQuery.of(context).size.height}');
    return planWebController.when(
        data: (data) {
          return Scaffold(
            key: scaffoldKey,
            drawer: Custome_drawer_web(index: selectedindex.value, button: true),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppbarWeb(button: true, index: 2,scaffoldkey: scaffoldKey,),
                  Gap(Utils.getHeight(context) * 0.02),
                  Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        transfer,
                        scale: 2,
                        height: Utils.getHeight(context) < 725 ? 100 : 120,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //
                      //     Gap(16),
                      //     Text(
                      //       weSimplyTheProcess,
                      //       style: TextStyle(
                      //           fontSize: 22,
                      //           fontWeight: FontWeight.w400,
                      //           color: navyblue),
                      //     ),
                      //     Text(
                      //       getBestIn,
                      //       style: TextStyle(
                      //           fontSize: 16, fontWeight: FontWeight.w400),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Gap(15),
                              Icon(Icons.check, color: pista, size: 25),
                              Gap(5),
                              Text(easyAndAff,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: pista)),
                            ],
                          ),
                          Gap(3),
                          Row(
                            children: [
                              Gap(15),
                              Icon(
                                Icons.check,
                                color: pista,
                                size: 25,
                              ),
                              Gap(5),
                              Text(safeSecure,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: pista)),
                            ],
                          ),
                          Gap(3),
                          Row(
                            children: [
                              Gap(15),
                              Icon(
                                Icons.check,
                                color: pista,
                                size: 25,
                              ),
                              Gap(5),
                              Text(buildByExperts,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: pista)),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  ResponsiveGridRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveGridCol(
                        // lg: 2,
                          xl: Utils.getWidth(context) < 1370 ? 1 : 1,
                          md: 1,
                          xs: 0,
                          child: Container()),
                      ResponsiveGridCol(
                        // lg: 2,
                          xl: 0,
                          md: 0,
                          xs: 0,
                          child: Gap(Utils.getWidth(context) <  1370 ? 0 : Utils.getWidth(context) * 0.05)),
                      ResponsiveGridCol(
                        // lg: 2,
                        xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                        md: 5,
                        xs: 12,
                        child: Container(
                          child: Align(
                            alignment: Utils.getWidth(context) < 1370 ? Alignment.center : Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              padding: EdgeInsets.only(left: 20,right: 20),
                              height: Utils.getHeight(context) < 725 ? 128 : 140,
                              width: Utils.getHeight(context) < 725 ? 210 : 240,
                              decoration: BoxDecoration(
                                  color: lowBlue,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 5,
                                        offset: Offset(0.0, 4)),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    willVector,
                                    scale: 4,
                                  ),
                                  // Gap(20),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      complementaryEWillCreation,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),



                      ResponsiveGridCol(
                        // lg: 2,
                        xl: 3,
                        md: 5,
                        xs: 12,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,

                            child: Container(
                              margin: EdgeInsets.only(top: 30),

                              padding: EdgeInsets.only(left: 20,right: 20),
                              height: Utils.getHeight(context) < 725 ? 130 : 140,
                              width: Utils.getHeight(context) < 725 ? 220 : 240,
                              decoration: BoxDecoration(
                                  color: lowBlue,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 5,
                                        offset: Offset(0.0, 4)),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    vactor,
                                    scale: 4,
                                  ),
                                  Gap(20),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      freeInsuranceCover,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ResponsiveGridCol(
                        // lg: 2,
                        xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                        md: 12,
                        xs: 12,
                        child: Container(
                          child: Align(
                            alignment: Utils.getWidth(context) < 1370 ? Alignment.center : Alignment.centerLeft,

                            child: Container(
                              margin: EdgeInsets.only(top: 30),

                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: Utils.getHeight(context) < 725 ? 130 : 140,
                              width: Utils.getHeight(context) < 725 ? 220 : 240,
                              decoration: BoxDecoration(
                                  color: lowBlue,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 5,
                                        offset: Offset(0.0, 4)),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    subscriptionModel,
                                    scale: 4,
                                  ),
                                  Gap(20),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      returnOfYourSubscription,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        // lg: 2,
                          xl: Utils.getWidth(context) < 1370 ? 0 : 1,
                          md: 1,
                          xs: 0,
                          child: Container()),
                    ],
                  ),
                  Gap(Utils.getHeight(context) * 0.045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          isCheck.value = true;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: Text(
                            "${data.response.plans[1].type}",

                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: isCheck.value == true
                                    ? navyblue
                                    : textColor,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 3.5,
                        color: oreng,
                      ),
                      InkWell(
                        onTap: () {
                          isCheck.value = false;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: Text(
                            "${data.response.plans[0].type}",

                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: isCheck.value == false
                                    ? navyblue
                                    : textColor,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Gap(Utils.getHeight(context) * 0.036),
                  Container(
                    width: 760,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    // color: redFroly,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              width: MediaQuery.of(context).size.width < 630 ? 140 : 220,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [

                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[0].planType}" == "" ? white :  Color(0xffD33E3E),
                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[0].planType}" == "" ? white :  Color(0xffFF9595),

                                      // Color(0xffD33E3E),
                                      // Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                isCheck.value == true
                                    ? "${data.response.plans[1].plans[0].planType}"
                                    : "${data.response.plans[0].plans[0].planType}",
                                // 'Top Seller',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width < 630 ? 15 : 19,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                            Gap(18),
                            GestureDetector(
                              onTap: () {
                                isSelected.value = 0;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width < 630 ? 140 : 220,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12,),
                                decoration: BoxDecoration(
                                  gradient: isSelected.value == 0
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xff2476D9),
                                            Color(0xff062B56),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : LinearGradient(colors: [
                                          Colors.white,
                                          Colors.white,
                                        ]),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      // 'SILVER',
                                      isCheck.value == true
                                          ? "${data.response.plans[1].plans[0].planTitle}"
                                          : "${data.response.plans[0].plans[0].planTitle}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected.value == 0
                                              ? white
                                              : black,
                                          letterSpacing: 0.5,
                                          fontSize: MediaQuery.of(context).size.width < 630 ? 22 :28),
                                    ),
                                    // Gap(3),
                                    Text(
                                      isCheck.value == true
                                          ? "₹${data.response.plans[1].plans[0].offerPrice}/-"
                                          : "₹${data.response.plans[0].plans[0].offerPrice}/-",

                                      // isCheck.value == true ? "${data.plans![0].yearly![1].offerPrice}/-" : "${data.plans![0].lifetime![1].offerPrice}/-" ,
                                      // isCheck.value == true ?
                                      // ' 2,499/-',
                                      // :
                                      // ' 24,999/-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: isSelected.value == 0
                                              ? white
                                              : black,
                                          letterSpacing: 0.5,
                                          fontSize:MediaQuery.of(context).size.width < 630 ? 26 : 38),
                                    ),
                                    Gap(2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // isCheck.value == true ? "${data.plans![0].yearly![0].offer}% off" : "${data.plans![0].lifetime![0].offer}% off" ,
                                          '50% off',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: MediaQuery.of(context).size.width < 630 ? 13 : 16,
                                              color: isSelected.value == 0
                                                  ? white
                                                  : cinnabarRed,
                                              // color: cinnabarRed,
                                              letterSpacing: 0.5),
                                        ),
                                        Gap(2),
                                        Text(
                                          isCheck.value == true
                                              ? '₹${data.response.plans[1].plans[0].actualPrice}/-'
                                              : "₹${data.response.plans[0].plans[0].actualPrice}/-",
                                          // isCheck.value == true ?
                                          // 'Rs 2,998/-' ,
                                          // :
                                          // 'Rs 29,998/-',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: isSelected.value == 0
                                                ? white
                                                : black,
                                            fontSize:MediaQuery.of(context).size.width < 630 ? 15 : 20,
                                            letterSpacing: 0.5,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              width: MediaQuery.of(context).size.width < 630 ? 140 : 220,

                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [

                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[1].planType}" == "" ? white :  Color(0xffD33E3E),
                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[1].planType}" == "" ? white :  Color(0xffFF9595),

                                      // Color(0xffD33E3E),
                                      // Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                isCheck.value == true
                                    ? "${data.response.plans[1].plans[1].planType}"
                                    : "${data.response.plans[0].plans[1].planType}",
                                // 'Top Seller',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width < 630 ? 15 : 19,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                            Gap(18),
                            GestureDetector(
                              onTap: () {
                                isSelected.value = 1;

                                // print('hhhhh : ${isSelected.value}');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width < 630 ? 140 : 220,

                                padding: EdgeInsets.symmetric(
                                    vertical: 12,),
                                decoration: BoxDecoration(
                                  gradient: isSelected.value == 1
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xff2476D9),
                                            Color(0xff062B56),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : LinearGradient(colors: [
                                          Colors.white,
                                          Colors.white,
                                        ]),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      // isCheck.value == true ? "${data.plans![0].yearly![1].title}"   :  "${data.plans![0].lifetime![1].title}" ,
                                      isCheck.value == true
                                          ? "${data.response.plans[1].plans[1].planTitle}"
                                          : "${data.response.plans[0].plans[1].planTitle}",
                                      // 'GOLD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color: isSelected.value == 1
                                              ? white
                                              : black,
                                          fontSize: MediaQuery.of(context).size.width < 630 ? 22 : 28),
                                    ),
                                    // Gap(3),
                                    Text(
                                      isCheck.value == true
                                          ? "₹${data.response.plans[1].plans[1].offerPrice}/-"
                                          : "₹${data.response.plans[0].plans[1].offerPrice}/-",

                                      // isCheck.value == true ? "${data.plans![0].yearly![1].offerPrice}/-" : "${data.plans![0].lifetime![1].offerPrice}/-" ,
                                      // isCheck.value == true ?
                                      // ' 2,499/-',
                                      // :
                                      // ' 24,999/-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: isSelected.value == 1
                                              ? white
                                              : black,
                                          letterSpacing: 0.5,
                                          fontSize:MediaQuery.of(context).size.width < 630 ? 26 : 38),
                                    ),
                                    Gap(2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // isCheck.value == true ? "${data.plans![0].yearly![1].offer}% off" : "${data.plans![0].lifetime![1].offer}% off" ,
                                          '50% off',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context).size.width < 630 ? 13 : 16,
                                              color: isSelected.value == 1
                                                  ? white
                                                  : cinnabarRed,
                                              letterSpacing: 0.5),
                                        ),
                                        Gap(2),
                                        Text(
                                          // isCheck.value == true ? 'Rs ${data.plans![0].yearly![1].price}/-' : "Rs ${data.plans![0].lifetime![1].price}/-" ,
                                          isCheck.value == true
                                              ? '₹${data.response.plans[1].plans[1].actualPrice}/-'
                                              : "₹${data.response.plans[0].plans[1].actualPrice}/-",
                                          // isCheck.value == true ?
                                          // 'Rs 4,998/-',
                                          // :
                                          // 'Rs 49,998/-',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize:MediaQuery.of(context).size.width < 630 ? 15 : 20,
                                            color: isSelected.value == 1
                                                ? white
                                                : black,
                                            letterSpacing: 0.5,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              width: MediaQuery.of(context).size.width < 630 ? 140 : 220,

                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [

                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[2].planType}" == "" ? white :  Color(0xffD33E3E),
                                      "${data.response.plans[isCheck.value == true ? 1 : 0].plans[2].planType}" == "" ? white :  Color(0xffFF9595),

                                      // Color(0xffD33E3E),
                                      // Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                isCheck.value == true
                                    ? "${data.response.plans[1].plans[2].planType}"
                                    : "${data.response.plans[0].plans[2].planType}",
                                // 'Value Pack',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:MediaQuery.of(context).size.width < 630 ? 15 : 19,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                            Gap(18),
                            GestureDetector(
                              onTap: () {
                                isSelected.value = 2;

                                // print('hhhhh : ${isSelected.value}');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width < 630 ? 140 : 220,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12,),
                                decoration: BoxDecoration(
                                  gradient: isSelected.value == 2
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xff2476D9),
                                            Color(0xff062B56),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : LinearGradient(colors: [
                                          Colors.white,
                                          Colors.white,
                                        ]),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      // isCheck.value == true ? "${data.plans![0].yearly![2].title}"   :  "${data.plans![0].lifetime![2].title}" ,
                                      isCheck.value == true
                                          ? "${data.response.plans[1].plans[2].planTitle}"
                                          : "${data.response.plans[0].plans[2].planTitle}",

                                      // 'TITANIUM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected.value == 2
                                              ? white
                                              : black,
                                          letterSpacing: 0.5,
                                          fontSize:MediaQuery.of(context).size.width < 630 ? 22 : 28),
                                    ),
                                    Text(
                                      isCheck.value == true
                                          ? "₹${data.response.plans[1].plans[2].offerPrice}/-"
                                          : "₹${data.response.plans[0].plans[2].offerPrice}/-",

                                      // isCheck.value == true ? "${data.plans![0].yearly![1].offerPrice}/-" : "${data.plans![0].lifetime![1].offerPrice}/-" ,
                                      // isCheck.value == true ?
                                      // ' 2,499/-',
                                      // :
                                      // ' 24,999/-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: isSelected.value == 2
                                              ? white
                                              : black,
                                          letterSpacing: 0.5,
                                          fontSize:MediaQuery.of(context).size.width < 630 ? 26 : 38),
                                    ),
                                    Gap(2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // isCheck.value == true ? "${data.plans![0].yearly![2].offer}% off" : "${data.plans![0].lifetime![2].offer}% off" ,
                                          '50% off',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: MediaQuery.of(context).size.width < 630 ? 13 : 16,
                                              color: isSelected.value == 2
                                                  ? white
                                                  : cinnabarRed,
                                              letterSpacing: 0.5),
                                        ),
                                        Gap(2),
                                        Text(
                                          isCheck.value == true
                                              ? '₹${data.response.plans[1].plans[2].actualPrice}/-'
                                              : "₹${data.response.plans[0].plans[2].actualPrice}/-",
                                          // isCheck.value == true ? 'Rs ${data.plans![0].yearly![2].price}/-' : "Rs ${data.plans![0].lifetime![2].price}/-" ,
                                          // isCheck.value == true ?
                                          // 'Rs 6,998/-',
                                          // :
                                          // 'Rs 69,998/-',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: isSelected.value == 2
                                                ? white
                                                : black,
                                            fontSize: MediaQuery.of(context).size.width < 630 ? 15 : 20,
                                            letterSpacing: 0.5,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(Utils.getHeight(context) * 0.036),
                  Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: assetsData.response.specialities.length,
                        itemBuilder: (context, index) {
                          return CustomWebRow(context,
                              planData: isCheck.value == true
                                  ? assetsData.response.plans[1].plans
                                  : assetsData.response.plans[0].plans,
                              index: index,
                              assetsName: assetsData.response.specialities,
                              selecetdIndex: isSelected.value);
                        }),
                  ),
                  Gap(50),
                  GestureDetector(
                    onTap: () {


                      navigationService.push(routePlanChatBotWeb);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                      child: Text(buyNow,
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
                  Gap(30),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                      Text(pricingAreExclusive, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: Utils.getWidth(context) * 0.005,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                      Text(haveAQuerry, style: TextStyle(fontSize: 16)),
                      Gap(3),
                      InkWell(
                        onTap: (){
                          navigationService.push(routeAboutUsWeb);
                        },
                        child: Text(contactUs,
                            style: TextStyle(fontSize: 16, color: indigo)),
                      )
                    ],
                  ),
                  Gap(40),
                  CustomWebBottomBar(bgColor: true,),
                ],
              ),
            ),
          );
        },
        error: (obj, trace) => ErrorWidget(obj),
        loading: () => const Loading());
  }
}

CustomWebRow(
  context, {
  required List<PlanPlan> planData,
  required int index,
  required List<ResponseSpeciality>? assetsName,
  int selecetdIndex = 1,
}) {
  return Column(
    children: [
      Gap(20),
      Container(
        width: 700,
        // color: redFroly,
        margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.27,
            // ),
            Text(planData[0].planModules[index].specialityName,
                // assetsName![index].category,
                style: TextStyle(
                  fontSize: 18,
                )),
            Gap(10),
            InkWell(
              onTap: () {
                displayDialogWeb(context, data: assetsName![index]);
              },
              child: Icon(
                Icons.info_outline,
                color: greyFontColor,
                size: 16,
              ),
            )
          ],
        ),
      ),
      Gap(10),
      Container(
        width: 700,
        margin: EdgeInsets.symmetric(horizontal: 20),
        // color: redFroly,
        child: InkWell(
          onTap: () {
            displayDialogWeb(context, data: assetsName![index]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width < 630 ? 140 :  180 ,

                // width: MediaQuery.of(context).size.width * 0.13,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: selecetdIndex == 0 ? gradientblue : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                    planData[0].planModules[index].specialityStatus,
                    style: TextStyle(
                      fontSize: 20,
                      color: selecetdIndex == 0
                          ? green
                          : planData[0].planModules[index].specialityStatus ==
                                  "X"
                              ? jerrygreen
                              : green,
                    )),
              ),
              // Gap(56),
              Container(
                width: MediaQuery.of(context).size.width < 630 ? 140 : 180 ,
                // margin: EdgeInsets.symmetric(horizontal: 30),
                // width: MediaQuery.of(context).size.width * 0.13,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selecetdIndex == 1 ? gradientblue : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child:
                    Text(planData[1].planModules[index].specialityStatus,
                        style: TextStyle(
                          fontSize: 20,
                          // color: green,
                          color: selecetdIndex == 1
                              ? green
                              : planData[1].planModules[index].specialityStatus ==
                              "X"
                              ? jerrygreen
                              : green,
                        )),
              ),
              // Gap(56),
              Container(
                width: MediaQuery.of(context).size.width < 630 ? 140 : 180   ,
                // width: MediaQuery.of(context).size.width * 0.13,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: selecetdIndex == 2 ? gradientblue : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child:
                    Text(planData[2].planModules[index].specialityStatus ,
                        style: TextStyle(
                          fontSize: 20,
                          // color: green,
                          color: selecetdIndex == 2
                              ? green
                              : planData[2].planModules[index].specialityStatus ==
                              "X"
                              ? jerrygreen
                              : green,
                        )),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

displayDialogWeb(
  BuildContext context, {
  required ResponseSpeciality data,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      insetPadding:
          const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: 220,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        cross,
                        scale: 4,
                        color: white,
                      ),
                      Spacer(),
                      Image.network(
                        "${data.image}",
                        scale: 3.5,
                      ),
                      // SizedBox(width: 20,),
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
                ),
                Gap(8),
                Center(
                  child: Text(
                    data.category,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Gap(8),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...data.specialities
                          .map(
                            (e) => Text(
                              '• ${e.specilityTitle}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: black,
                                  height: 1.3),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
