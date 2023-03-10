import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_bottomnavigationbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/loading.dart';

import '../../../utils/constants/navigation_route_constants.dart';

class PlanScreen extends HookConsumerWidget {
  PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState<int>(planIndex ?? 1);
    // final isSelectedPlanId = useState<int>(1);
    // final isPlanIndex = useState<int>(0);
    final isCheck = useState<bool>(planType ?? true);

    final planController = ref.watch(dashboardProvider);

    useEffect(() {
      ref.read(dashboardProvider.notifier).getDashboard(context: context);
      return null;
    }, []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return planController.when(
        data: (data) {
          return Scaffold(
            appBar: CustomAppBar(
              title: plans,
              backonTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Custom_BottomNavigationBar(
                              index: 0,
                            )));
              },
              notionTap: () {},
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          transfer,
                          scale: 3.2,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                Gap(15),
                                Icon(Icons.check, color: pista, size: 20),
                                Gap(5),
                                Text(easyAndAff,
                                    style: TextStyle(
                                        fontSize: 12,
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
                                  size: 20,
                                ),
                                Gap(5),
                                Text(safeSecure,
                                    style: TextStyle(
                                        fontSize: 12,
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
                                  size: 20,
                                ),
                                Gap(5),
                                Text(buildByExperts,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: pista)),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                    Gap(10),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: lowBlue,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.shade300,
                                //     spreadRadius: 1,
                                //     blurRadius: 1,
                                //   ),
                                // ]
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    willVector,
                                    scale: 7,
                                  ),
                                  Gap(6),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      complementaryEWillCreation,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Gap(4),
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: lowBlue,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.shade300,
                                //     spreadRadius: 1,
                                //     blurRadius: 1,
                                //   ),
                                // ]
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    vactor,
                                    scale: 7,
                                  ),
                                  Gap(6),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      freeInsuranceCover,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Gap(4),
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: lowBlue,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.shade300,
                                //     spreadRadius: 1,
                                //     blurRadius: 1,
                                //   ),
                                // ]
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    subscriptionModel,
                                    scale: 7,
                                  ),
                                  Gap(6),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      returnOfYourSubscription,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Gap(14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            isCheck.value = true;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(
                              "${data.response.plans[1].type}",
                              // "Yearly",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: fontFamily,
                                  color: isCheck.value == true
                                      ? navyblue
                                      : textColor),
                            ),
                          ),
                        ),
                        Container(
                          height: 18,
                          width: 3,
                          color: oreng,
                        ),
                        InkWell(
                          onTap: () {
                            isCheck.value = false;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(
                              "${data.response.plans[0].type}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: fontFamily,
                                  color: isCheck.value == false
                                      ? navyblue
                                      : textColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Container(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: white,
                              )),
                          Gap(10),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffD33E3E),
                                      Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                topSeller,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffD33E3E),
                                      Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                valuePack,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(7),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  isSelected.value = 0;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
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
                                        isCheck.value == true
                                            ? "${data.response.plans[1].plans[0].planTitle}"
                                            : "${data.response.plans[0].plans[0].planTitle}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelected.value == 0
                                                ? white
                                                : black,
                                            letterSpacing: 0.5,
                                            fontSize: 12),
                                      ),
                                      // Gap(3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Text(
                                              'Rs ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: isSelected.value == 0
                                                      ? white
                                                      : black,
                                                  letterSpacing: 0.5,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? "${data.response.plans[1].plans[0].offerPrice}/-"
                                                : "${data.response.plans[0].plans[0].offerPrice}/-",
                                            // isCheck.value == true ?  '1,499/-' : '14,999/-',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: isSelected.value == 0
                                                    ? white
                                                    : black,
                                                letterSpacing: 0.5,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Gap(2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            // isCheck.value == true ? "${data.plans!.yearly![0].offer}% off" : "${data.plans!.lifetime![0].offer}% off" ,
                                            '50% off',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: isSelected.value == 0
                                                    ? white
                                                    : cinnabarRed,
                                                // color: cinnabarRed,
                                                letterSpacing: 0.5),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? 'Rs ${data.response.plans[1].plans[0].actualPrice}/-'
                                                : "Rs ${data.response.plans[0].plans[0].actualPrice}/-",
                                            // isCheck.value == true ? 'Rs 2,998/-' : 'Rs 29,998/-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: isSelected.value == 0
                                                  ? white
                                                  : black,
                                              fontSize: 10,
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
                        ),
                        Gap(8),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  isSelected.value = 1;

                                  // print('hhhhh : ${isSelected.value}');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
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
                                            fontSize: 12),
                                      ),
                                      // Gap(3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Text(
                                              'Rs',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: isSelected.value == 1
                                                      ? white
                                                      : black,
                                                  letterSpacing: 0.5,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? "${data.response.plans[1].plans[1].offerPrice}/-"
                                                : "${data.response.plans[0].plans[1].offerPrice}/-",

                                            // isCheck.value == true ?   ' 2,499/-' : ' 24,999/-',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: isSelected.value == 1
                                                    ? white
                                                    : black,
                                                letterSpacing: 0.5,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Gap(2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            // isCheck.value == true ? "${data.plans!.yearly![1].offer}% off" : "${data.plans!.lifetime![1].offer}% off" ,
                                            '50% off',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: isSelected.value == 1
                                                    ? white
                                                    : cinnabarRed,
                                                letterSpacing: 0.5),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? 'Rs ${data.response.plans[1].plans[1].actualPrice}/-'
                                                : "Rs ${data.response.plans[0].plans[1].actualPrice}/-",

                                            // isCheck.value == true ?  'Rs 4,998/-' : 'Rs 49,998/-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
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
                        ),
                        Gap(8),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  isSelected.value = 2;

                                  // print('hhhhh : ${isSelected.value}');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
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
                                            fontSize: 12),
                                      ),
                                      // Gap(3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Text(
                                              'Rs',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: isSelected.value == 2
                                                      ? white
                                                      : black,
                                                  letterSpacing: 0.5,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? "${data.response.plans[1].plans[2].offerPrice}/-"
                                                : "${data.response.plans[0].plans[2].offerPrice}/-",
                                            // isCheck.value == true ?  ' 3,499/-' : '  3,4999/-',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: isSelected.value == 2
                                                    ? white
                                                    : black,
                                                letterSpacing: 0.5,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Gap(2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            // isCheck.value == true ? "${data.plans!.yearly![2].offer}% off" : "${data.plans!.lifetime![2].offer}% off" ,
                                            '50% off',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: isSelected.value == 2
                                                    ? white
                                                    : cinnabarRed,
                                                letterSpacing: 0.5),
                                          ),
                                          Gap(2),
                                          Text(
                                            isCheck.value == true
                                                ? 'Rs ${data.response.plans[1].plans[2].actualPrice}/-'
                                                : "Rs ${data.response.plans[0].plans[2].actualPrice}/-",
                                            // isCheck.value == true ?  'Rs 6,998/-' : 'Rs 69,998/-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: isSelected.value == 2
                                                  ? white
                                                  : black,
                                              fontSize: 10,
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
                        ),
                      ],
                    ),

                    Gap(30),

                    // Container(
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemCount: planData.length,
                    //       itemBuilder: (context, index) {
                    //         return CustomRow(planData[index], context,
                    //             selecetdIndex: isSelected.value);
                    //       }
                    //       ),
                    // ),

                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: assetsData.response.specialities.length,
                          itemBuilder: (context, index) {
                            return CustomRow(context,
                                planData: isCheck.value == true
                                    ? assetsData.response.plans[1].plans
                                    : assetsData.response.plans[0].plans,
                                index: index,
                                assetsName: assetsData.response.specialities,
                                selecetdIndex: isSelected.value);
                          }),
                    ),

                    Gap(30),

                    // Center(
                    //   child: CustomButton(
                    //     title: buyNow,
                    //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    //     onTap: () async{
                    //       ReqStoreCPDetails StoreCPDetailsData = ReqStoreCPDetails(
                    //         userId: "3",
                    //         // userId: "${getString(prefUserID)}",
                    //         partnerType: "Company",
                    //         companyName: "test Company",
                    //         firstName: "test",
                    //         lastName: 'test Company',
                    //         email: "test@gmail.com",
                    //         contactNumber: "1023654789",
                    //         state: "Gujarat",
                    //         city: "Surat",
                    //       );
                    //
                    //       print('yashu patel------>>>>>> individual ');
                    //
                    //       await ref.read(
                    //           storeCPDetailsProvider.notifier)
                    //           .storeCPDetails(context: context,
                    //           data: StoreCPDetailsData)
                    //           .then((value) {
                    //         print('yashu patel------>>>>>> individual 111111');
                    //         print('yashu patel------>>>>>> individual status 111111 ${value?.status} ');
                    //         if (value!.status == 1) {
                    //           print("Yashu Patel");
                    //           displayToast(value.message);
                    //           // Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));
                    //           // eKYC.value = true;
                    //         } else {
                    //           displayToast(value.message);
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ),

                    ///    plan mobile
                    Center(
                      child: CustomButton(
                        title: buyNow,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        onTap: () {

                            if(getString(prefFirstChatBotStatus) == '0'){

                              var planId = isCheck.value == true
                                  ? "${data.response.plans[1].plans[isSelected.value].planId}"
                                  : "${data.response.plans[0].plans[isSelected.value].planId}";

                              var planPrice = isCheck.value == true
                                  ? "${data.response.plans[1].plans[isSelected.value].offerPrice}"
                                  : "${data.response.plans[0].plans[isSelected.value].offerPrice}";

                              var planTitle = isCheck.value == true
                                  ? "${data.response.plans[1].plans[isSelected.value].planTitle}"
                                  : "${data.response.plans[0].plans[isSelected.value].planTitle}";


                              List<PlanModule> planSelected =
                              isCheck.value == true
                                  ? data.response.plans[1]
                                  .plans[isSelected.value].planModules
                                  : data.response.plans[0]
                                  .plans[isSelected.value].planModules;

                              setString(prefPlanIdMobile, planId);
                              setString(prefPlanPrice, planPrice);
                              setString(prefPlanTitle, planTitle);
                              setBool(prefPlanType, isCheck.value );

                              navigationService.push(routePlanChatBotMobile,
                                  arguments: {navSelectedPlanCB: planSelected});


                            }else if(getString(prefKycStatus) == '1') {
                              navigationService.push(routeKycScreen);

                            }else if(getString(prefSecondChatBotStatus) == "1"){
                              navigationService.push(routeKYCChatBotMobile);

                            }else if(getString(prefBeneficiaryStatus) == "0"){
                              navigationService.push(routeBeneficiary);

                            }else if(getString(prefWillDocumentStatus) == "0") {
                              navigationService.push(routeWillReview);

                            }else if(getString(prefWillReviewStatus) == "0") {
                              navigationService.push(routeWillReviewIssueDetail);

                            }else if(getString(prefAssetDetailsStatus) == "0") {
                              navigationService.push(routeAssetScreen);

                            }else {
                              displayToast("You have already subscribe");
                            }



                        },
                      ),
                    ),

                    Gap(30),

                    Text(pricingAreExclusive, style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: Utils.getWidth(context) * 0.005,
                    ),
                    Gap(5),
                    Row(
                      children: [
                        Text(haveAQuerry, style: TextStyle(fontSize: 14)),
                        Gap(3),
                        Text(callUs,
                            style: TextStyle(fontSize: 14, color: oreng))
                      ],
                    ),
                    Gap(40),
                  ],
                ),
              ),
            ),
          );
        },
        error: (obj, trace) => ErrorWidget(obj),
        loading: () => const Loading());
  }
}

List planData = [
  {
    "title": "Banking and Insurance",
    "imageone": 'Y',
    "imagetwo": "Y",
    "imagethree": "Y",
    "color": lightindigo,
    "colortwo": lightindigotwo,
    "description": [
      {
        "descrip": 'Bank accounts and deposits',
        "details": ['Account No.', "Nominee's", 'IFSC Code']
      },
      {
        "descrip": "Bank Locker",
        "details": [
          "Bank Locker No.",
          "Joint Locker Holder’s Name (if any)",
          "Nominee’s Name (if any)",
          "Bank name & Branch"
        ]
      },
      {
        "descrip": "Fixed deposits",
        "details": [
          "F.D.R. No.",
          "Joint F.D.R. Holder’s Name (if any)",
          "Nominee’s Name (if any)",
          "Bank name & Branch",
          "IFSC Code"
        ]
      },
      {
        "descrip": "Life Insurance",
        "details": [
          "Name of the Insurance Company",
          "Type of Insurance",
          "Policy No.",
          "Name of Beneficiary (ies)",
          "Relationship with the Beneficiary(ies)"
        ]
      },
    ],
    "image": bank
  },
  {
    "title": "Utility",
    "imageone": "Y",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": utility,
    "color": lightyellow,
    "colortwo": lightyellowtwo,
    "description": [
      {"descrip": "Electricity", "details": []},
      {"descrip": "Phone", "details": []},
      {"descrip": "Gas", "details": []},
      {"descrip": "Internet", "details": []},
    ],
  },
  {
    "title": "Government Schemes",
    "imageone": "Y",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": government,
    "color": teal,
    "colortwo": tealtwo,
    "description": [
      {
        "descrip": "Public Provident Fund (PPF)",
        "details": [
          "PPF Acc. No.",
          "Bank name & Branch/ Post Office",
          "Nominee’s Name (if any)"
        ]
      },
      {
        "descrip": "Employee Provident Fund (EPF)",
        "details": [
          "Universal Acc. No.",
          "EPF Acc. No.",
          "Name of the company/Employer",
          "Nominee’s Name (if any)"
        ]
      },
      {
        "descrip": "National Pension Scheme (NPS)",
        "details": [
          "NPS Acc. No.",
          "Type of NPS Acc. (Tier - I or Tier - II)",
          "Bank name & Branch/ Post Office",
          "Nominee’s Name (if any)"
        ]
      },
      {
        "descrip": "Atal Pension Yojana (APY)",
        "details": [
          "APY Acc. No.",
          "Bank name & Branch/ Post Office",
          "Name of the Spouse (default nominee)",
          "Nominee’s Name (if any)"
        ]
      },
      {
        "descrip": "Kisan Vikas Patra (KVP)",
        "details": [
          "KVP Acc. No.",
          "Name of the Joint Acc. Holder (if any)",
          "Bank name & Branch/ Post Office",
          "Nominee’s Name (if any)"
        ]
      },
      {"descrip": "Any Other", "details": []},
    ],
  },
  {
    "title": "Investments",
    "imageone": "Y",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": investments,
    "color": lightpink,
    "colortwo": lightpinktwo,
    "description": [
      {
        "descrip": "Demat account",
        "details": [
          "Demat Account No.",
          "Joint Account Holder’s Name",
          "Nominee’s Name (if any)",
          "Bank name & Branch",
          "IFSC Code"
        ]
      },
      {"descrip": "Shares and Mutual Fund Liquidation", "details": []},
    ],
  },
  {
    "title": "Immovable Assets",
    "imageone": "X",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": immovable,
    "color": lightindigo,
    "colortwo": lightindigotwo,
    "description": [
      {"descrip": "Land", "details": []},
      {"descrip": "Building", "details": []},
    ],
  },
  {
    "title": "Personal",
    "imageone": "X",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": personal,
    "color": teal,
    "colortwo": tealtwo,
    "description": [
      {"descrip": "Vehicle", "details": []},
      {"descrip": "Precious stones,metals,jewellery", "details": []},
      {"descrip": "Clubs and other memberships", "details": []},
    ],
  },
  {
    "title": "Company and GST",
    "imageone": "X",
    "imagetwo": "Y",
    "imagethree": "Y",
    "image": companygst,
    "color": lightpink,
    "colortwo": lightpinktwo,
    "description": [
      {
        "descrip": "Company Transfer",
        "details": ["", "", ""]
      },
      {
        "descrip": "GST Transfer",
        "details": ["", "", ""]
      },
      {
        "descrip": "Any other",
        "details": ["", "", ""]
      },
    ],
  },
  // {
  //   "title": "Insurance Cover",
  //   "imageone": "Y",
  //   "imagetwo": "Y",
  //   "imagethree": "Y",
  //   "image": companygst,
  //   "description": [
  //     {"details": []},
  //   ],
  //   "color": lightindigo,
  //   "colortwo": lightindigotwo,
  // },
];

CustomRow(context,
    {required List<PlanPlan> planData,
    required int index,
    required List<ResponseSpeciality>? assetsName,
    int selecetdIndex = 1}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Text(planData[0].planModules[index].specialityName,
                // assetsName![index].category,
                style: TextStyle(
                  fontSize: 12,
                )),
            Gap(10),
            InkWell(
              onTap: () {
                displayDialog(context, data: assetsName![index]);
              },
              child: Icon(
                Icons.info_outline,
                color: greyFontColor,
                size: 16,
              ),
            )
          ],
        ),
        Gap(5),
        Container(
          // height: 35,
          child: InkWell(
            onTap: () {
              displayDialog(context, data: assetsName![index]);
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text(planData[0].planModules[index].specialityStatus,
                        style: TextStyle(
                          fontSize: 20,
                          color: selecetdIndex == 0
                              ? green
                              : planData[0]
                                          .planModules[index]
                                          .specialityStatus ==
                                      "X"
                                  ? jerrygreen
                                  : green,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text(planData[1].planModules[index].specialityStatus,
                        style: TextStyle(
                          fontSize: 20,
                          color: selecetdIndex == 1
                              ? green
                              : planData[1]
                                          .planModules[index]
                                          .specialityStatus ==
                                      "X"
                                  ? jerrygreen
                                  : green,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text(planData[2].planModules[index].specialityStatus,
                        style: TextStyle(
                          fontSize: 20,
                          color: selecetdIndex == 2
                              ? green
                              : planData[2]
                                          .planModules[index]
                                          .specialityStatus ==
                                      "X"
                                  ? jerrygreen
                                  : green,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(7),
      ],
    ),
  );
}

displayDialog(
  BuildContext context, {
  required ResponseSpeciality data,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      insetPadding:
          const EdgeInsets.only(left: 85, right: 85, top: 0, bottom: 0),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: 200,
            padding: EdgeInsets.only(
              top: 7,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: indigo, width: 2),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white38,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 5.0)),
                ]),
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

///old CustomRow

//CustomRow(var data, context, {int selecetdIndex = 1}) {
//   return Container(
//     child: Column(
//       children: [
//         Row(
//           children: [
//
//             Text(data["title"], style: TextStyle(
//                 fontSize:  12,
//             )),
//
//             Gap(10),
//             InkWell(
//               onTap: () {
//                 displayDialog(context, data);
//               },
//               child: Icon(
//                 Icons.info_outline,
//                 color: greyFontColor,
//                 size: 16,
//               ),
//             )
//           ],
//         ),
//         Gap(5),
//         Container(
//           height: 35,
//           child: InkWell(
//             onTap: () {
//               displayDialog(context, data);
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: selecetdIndex == 0 ? gradientblue : Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Text(data["imageone"],
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: selecetdIndex == 0
//                               ? green
//                               : data["imageone"] == "X"
//                                   ? jerrygreen
//                                   : green,
//                         )),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: selecetdIndex == 1 ? gradientblue : Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Text(data["imagetwo"],
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: green,
//                         )),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: selecetdIndex == 2 ? gradientblue : Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Text(data["imagethree"],
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: green,
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Gap(7),
//       ],
//     ),
//   );
// }
///old DisplayDialog
//displayDialog(BuildContext context, var data) {
// // print("Hello ${data['description']}");
//   showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       insetPadding:
//           const EdgeInsets.only(left: 85, right: 85, top: 270, bottom: 300),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5.0))),
//       content: Builder(
//         builder: (context) {
//           return Container(
//             padding: EdgeInsets.only(top: 7,),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(color: indigo, width: 2),
//               boxShadow:  [ BoxShadow(
//               color: Colors.white38,
//               blurRadius: 1.0,
//                 offset: Offset(0.0,5.0)
//             ),]
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only( left: 15, right: 5),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         cross,
//                         scale: 4,
//                         color: white,
//                       ),
//                       Spacer(),
//                       Image.asset(
//                         data["image"],
//                         scale: 3.5,
//                       ),
//                       // SizedBox(width: 20,),
//                       Spacer(),
//                       InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Image.asset(
//                             cross,
//                             scale: 3.5,
//                           )),
//                     ],
//                   ),
//                 ),
//                 Gap(8),
//                 Center(
//                   child: Text(
//                     data["title"],
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         color: black,
//                         letterSpacing: 0.5,),
//                   ),
//                 ),
//                 Gap(8),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15, right: 5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ...data["description"]
//                           .map(
//                             (e) => Text(
//                               '• ${e["descrip"]}',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 11,
//                                   color: black,
//                                   height: 1.3),
//                             ),
//                           )
//                           .toList(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
