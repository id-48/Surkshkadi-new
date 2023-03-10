import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/req_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';

import '../../chatbot_screen/planchat_view_modal.dart';

///    Hook Widget ---------->>>>>>>>>>>>>>>>> code

class ChooseAssetMobile extends HookConsumerWidget {
  final List<ResponseSpeciality> dashboardResponse;
  List<PlanModule> selectedPlan;
  String? specificAssets;
  List<ChatMessage>? messagesList;

  ChooseAssetMobile({
    Key? key,
    this.specificAssets,
    required this.dashboardResponse,
    this.messagesList,
    required this.selectedPlan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double spacing = 8;
    double runSpacing = 8;
    // List<Specialities> dashboardHeader = [];
    // List<Specialities> dashboardBody = [];
    // List<String> checkedIDs = [];
    // double amountTotal = 0;

    final dashboardHeader = useState<List<ResponseSpeciality>>([]);
    final dashboardBody = useState<List<ResponseSpeciality>>([]);

    final selectedIndex = useState<int>(0);
    var checkedIDs = useState<List<String>>([]);
    var checkedIDsName = useState<List<String>>([]);

    Razorpay? _razorpay;

    void _handlePaymentSuccess(PaymentSuccessResponse response) async {


      String wpNumber = messagesList![3].messageContent[0] == "No"
          ? messagesList![3].messageContent[1]
          : "${getString((prefLoginNumber))}";

      ReqPlanChatBot dataPlanChatBot = ReqPlanChatBot(
        userId: getString(prefUserID),
        planId: getString(prefPlanIdMobile),
        wpNo: wpNumber,
        gender: "${messagesList![3].messageContent[0]}",
        dob: "${messagesList![5].messageContent[0]}",
        annualIncome: "${messagesList![7].messageContent[0]}",
        occupation: "${messagesList![7].messageContent[1]}",
        name: "${messagesList![9].messageContent[0]}",
        email: "${messagesList![11].messageContent[0]}",
        fatherName: "${messagesList![13].messageContent[0]}",
        isFatherAlive: 'Yes',
        nominee: "${messagesList![15].messageContent[0]}",
        nomineeRelation: "${messagesList![15].messageContent[1]}",
        postCode: "${messagesList![17].messageContent[0]}",
        address:
            "${messagesList![19].messageContent[0]},${messagesList![19].messageContent[1]}",
        state: "${messagesList![19].messageContent[2]}",
        city: "${messagesList![19].messageContent[3]}",
        covidDose: "${messagesList![21].messageContent[0]}",
        nicotineProducts: "${messagesList![23].messageContent[0]}",
        planAssets:
            "${checkedIDs.value}".replaceAll("[", "").replaceAll("]", ""),
        paymentAmount: '${getString(prefPlanPrice)}',
        transactionId: 'jhgytyjhgy',
        transactionStatus: 'Success',
      );

      await ref
          .read(planChatProvider.notifier)
          .planChatBotSub(context: context, data: dataPlanChatBot)
          .then((value) async {

        if (value!.status == 1) {
          displayToast(value.message.toString());
          setString(prefSubscriptionId,
              "${value.response.subscriptionId}");
          // setBool(prefSubChatBotCompletedMobile, true);

          navigationService.push(routeConfirmationPlan);
        } else {
          displayToast(value.message.toString());
        }
      });

      displayToast("${response.orderId}");
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      displayToast("${response.message}");
    }

    void _handleExternalWallet(ExternalWalletResponse response) {
      displayToast("${response.walletName}");
    }

    void openCheckout(String amount) async {
      // String razorpayKey = await getString(prefRazorpayId);
      // print('razorPay 95 ${razorpayKey}');
      print('razorPay 95  --${int.parse(amount) * 100}');
      var options = {
        'key': 'rzp_test_3FbPA4Jan9QLit',
        'amount': (int.parse(amount) * 100).toString(),
        'name': 'Surakshakadi',
        'description': 'Payment',
        'prefill': {
          'contact': '+91 7585982534',
          'email': 'surakshakadi@gmail.com'
        },
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay?.open(options);
      } catch (e) {
        debugPrint("$e");
      }
    }

    useEffect(() {

      if (selectedPlan.isNotEmpty) {
        selectedPlan.forEach((element) {
          if (element.specialityStatus == "Y") {
            var ind = dashboardResponse
                .indexWhere((ele) => ele.category == element.specialityName);
            dashboardHeader.value.add(dashboardResponse.elementAt(ind));
            dashboardBody.value.add(dashboardResponse.elementAt(ind));
          }
        });
      } else {
        dashboardHeader.value.addAll(dashboardResponse);
        dashboardBody.value.addAll(dashboardResponse);
      }

      for (int h = 0; h < dashboardBody.value.length; h++) {
        // dashboardBody.value[h].specialities = [];
        for (int i = 0; i < dashboardBody.value[h].specialities.length; i++) {
          dashboardBody.value[h].specialities[i].checkValue = false;
          // for (int j = 0; j < dashboardBody[h].specialities![i].specilityTitle!.length ; j++) {
          //   dashboardBody[h].specialities![i].checkValue.add(false);
          // }
        }
      }
      _razorpay = Razorpay();
      _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

      return null;
    }, []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: gerywhite,
            title: Text(
              chooseYourAssets,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: black,
                  letterSpacing: 1),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios, color: black, // add custom icons also
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 7),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pleaseSelectTheAssets,
                    style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500,
                      // fontFamily: 'Nunito Sans'
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.022,
                  ),
                  Container(
                    width: Utils.getWidth(context),
                    child: Wrap(
                      runSpacing: runSpacing,
                      spacing: spacing,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                          // dashboardResponse.length,
                          dashboardHeader.value.length, (index) {
                        // print("planModule---->>>>  ${dashSelectedPlan?[index].specialityStatus}");
                        return InkWell(
                          onTap: () {
                            if (index != selectedIndex.value) {
                              selectedIndex.value = index;

                              setState(() {
                                dashboardBody.value.clear();
                                dashboardBody.value.insert(0,
                                    dashboardHeader.value[selectedIndex.value]);
                                dashboardBody.value
                                    .addAll(dashboardHeader.value);
                                dashboardBody.value.removeAt(index + 1);

                                // dashboardBody.value.clear();
                                // dashboardBody.value.insert(0,dashboardResponse[selectedindex.value]);
                                // dashboardBody.value.addAll(dashboardResponse);
                                // dashboardBody.value.removeAt(index + 1);
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: Utils.getWidth(context) / 5,
                            decoration: BoxDecoration(
                              color: selectedIndex.value == index
                                  ? lightoreng
                                  : white,
                              border: Border.all(
                                  color: selectedIndex.value == index
                                      ? lightoreng
                                      : oreng,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                                // dashboardResponse[index].category,
                                dashboardHeader.value[index].category,
                                style: TextStyle(
                                    fontSize: 11.5,
                                    // fontFamily: 'Nunito Sans',
                                    color: selectedIndex.value == index
                                        ? white
                                        : black),
                                textAlign: TextAlign.center),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      // height: Utils.getHeight(context) * 0.7,
                      // padding: EdgeInsets.only(bottom: 100),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dashboardBody.value.length,
                        itemBuilder: (context, index) {
                          // var data = dashboardBody.value[index];
                          // print("speciality    ---->> ${dashboardBody.value[index].specialities}");

                          return Container(
                            // height: 180,
                            // width: w,
                            margin: EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(
                              12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderblue,
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    dashboardBody.value[index].category,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blue,
                                        letterSpacing: 0.5,
                                        fontSize: 15),
                                  ),
                                ),
                                ...dashboardBody.value[index].specialities
                                    .map((e) {
                                  // print("specilityTitle    ---->> ${e.specilityTitle}");
                                  return Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        e.checkValue =
                                            e.checkValue == true ? false : true;

                                        if (e.checkValue == true) {
                                          checkedIDs.value.add(e.specilityId.toString());
                                          checkedIDsName.value.add(e.specilityTitle.toString());
                                          print("Checked IDs-- ${checkedIDs.value}");
                                        } else {
                                          checkedIDs.value.remove(e.specilityId.toString());
                                          checkedIDsName.value.remove(e.specilityTitle.toString());
                                        }
                                        setState(() {});

                                        /// old code
                                        // for (int i = 0;
                                        //     i < dashboardBody.value.length;
                                        //     i++) {
                                        //   for (int j = 0;
                                        //       j < dashboardBody.value[i].specialities!.length;
                                        //       j++) {
                                        //     if (dashboardBody.value[i].specialities![j].checkValue ==
                                        //         true) {
                                        //       totalLength++;
                                        //     }
                                        //   }
                                        // }
                                      },
                                      child: Row(
                                        children: [
                                          e.checkValue == true
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: blue,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: blue,
                                                ),
                                          Gap(5),
                                          Text(
                                            '${e.specilityTitle}',
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
              height: Utils.getHeight(context) * 0.08,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff037EEE).withOpacity(0.15),
                    offset: const Offset(0.0, -3),
                    blurRadius: 0.7,
                    spreadRadius: 0.5,
                  ), //BoxShadow
                ],
              ),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  // text: "00",
                                  text: "${checkedIDs.value.length}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: blue)),
                              TextSpan(
                                  text: itemsSelectedInYourAssets,
                                  style: TextStyle(
                                      color: jerrygreen,
                                      fontSize: 14,
                                      letterSpacing: 0.5)),
                            ],
                          ),
                        ))),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      if (checkedIDs.value.isNotEmpty) {
                        if (specificAssets == "SpecificAssets") {
                          displayDialogCA(
                              context, ref, checkedIDs.value, false);
                        } else {
                          if (getBool(prefSubChatBotCompletedMobile) == false) {

                            String  wpNumber = messagesList![3].messageContent[0] == "No" ? messagesList![3].messageContent[1] : "${getString(prefLoginNumber)}";

                            setString(prefSelectAssets, "${checkedIDsName.value}".replaceAll("[", '').replaceAll("]", '') );

                            ReqPlanChatBot dataPlanChatBot = ReqPlanChatBot(
                              userId: getString(prefUserID),
                              planId: getString(prefPlanIdMobile),
                              wpNo: wpNumber,
                              gender: "${messagesList![3].messageContent[0]}",
                              dob: "${messagesList![5].messageContent[0]}",
                              annualIncome:"${messagesList![7].messageContent[0]}",
                              occupation: "${messagesList![7].messageContent[1]}",
                              name: "${messagesList![9].messageContent[0]}",
                              email: "${messagesList![11].messageContent[0]}",
                              fatherName:"${messagesList![13].messageContent[0]}",
                              isFatherAlive: "${messagesList![13].messageContent[1]}",
                              nominee: "${messagesList![15].messageContent[0]}",
                              nomineeRelation: "${messagesList![15].messageContent[1]}",
                              postCode:"${messagesList![17].messageContent[0]}",
                              address:"${messagesList![19].messageContent[0]}",
                              state: "${messagesList![19].messageContent[2]}",
                              city: "${messagesList![19].messageContent[1]}",
                              covidDose:"${messagesList![21].messageContent[0]}",
                              nicotineProducts: "${messagesList![23].messageContent[0]}",
                              planAssets: "${checkedIDs.value}"
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                              paymentAmount: '250500',
                              transactionId: 'gvcgjh',
                              transactionStatus: 'Success',
                            );

                            print("data  ---->>>>>>>  ${dataPlanChatBot.toJson()}");
                            await ref.read(planChatProvider.notifier)
                                .planChatBotSub(context: context, data: dataPlanChatBot)
                                .then((value) async {

                              if (value!.status == 1) {
                                displayToast(value.message.toString());
                                setString(prefSubscriptionId, "${value.response.subscriptionId}");
                                setString(prefPlanValidity, "${value.response.planValidity}");

                                // setBool(prefSubChatBotCompletedMobile, true);
                                // amountTotal.value = double.parse(
                                //     getString(prefPlanPrice).toString()) *
                                //     100;

                                navigationService.push(routeConfirmationPlan,arguments: {navChatBotDataFirst: value});

                                // openCheckout('22000');
                                // openCheckout('${amountTotal.value.toString()}');

                              }else {
                                displayToast(value.message.toString());
                                hideLoadingDialog(context: context);

                              }
                            });

                            // openCheckout('22000');
                          } else {
                            navigationService.push(routeConfirmationPlan);
                          }
                        }
                      } else {
                        displayToast("Please Select Assets");
                      }
                    },
                    child: Container(
                      height: Utils.getHeight(context) * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff0E3563).withOpacity(0.6),
                            Color(0xff3C87E0).withOpacity(0.9),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ])));
    });
  }
}

displayDialogCA(BuildContext context, ref, List<String> checkIDs, bool isWeb) {
  print(" welcome to display Dialog");
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      // insetPadding:
      //     const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: isWeb == true ? 240 : 160,
            // width: Utils.getWidth(context) * 0.2,
            padding: EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(
              // color: redFroly,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: indigo, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: isWeb ? 14 : 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Image.asset(
                      //   cross,
                      //   scale: 4,
                      //   color: white,
                      // ),
                      // Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          cross,
                          scale: isWeb == true ? 2.5 : 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 0),
                  child: Text(
                    "The quotation charges will be",
                    style: TextStyle(
                      fontWeight:
                          isWeb == true ? FontWeight.w600 : FontWeight.w500,
                      fontSize: isWeb == true ? 18 : 15,
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 0),
                  child: Text(
                    "₹ 99/-",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isWeb == true ? 18 : 15,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isWeb ? 80 : 0),
                  child: InkWell(
                    onTap: () {
                      if (isWeb == true) {
                        navigationService.push(routeAddInfoWeb);
                      } else {
                        ReqSingleUserAssets dataSingleCA = ReqSingleUserAssets(
                          userId: getString(prefUserID),
                          specialities: "${checkIDs}"
                              .replaceAll("[", "")
                              .replaceAll("]", ""),
                        );

                        print("rerere : ${dataSingleCA.toJson()}");

                        navigationService.push(routeAddInformationScreen,
                            arguments: {navSingleChooseAssetsAI: dataSingleCA});

                        // setString(
                        //     prefSpecificAssetsChoose, "SpecificAssetsChoose");
                        // // navigationService.push(routeAddInformationScreen);
                        //
                        // Map<String, dynamic> arrData = {};
                        //
                        // for (int i = 0; i < dashboardBody.length; i++) {
                        //   arrData.addAll({'${dashboardBody[i].title}': []});
                        //   for (int j = 0;
                        //       j < dashboardBody[i].dataDsc!.length;
                        //       j++) {
                        //     if (dashboardBody[i].checkValue![j] == true) {
                        //       arrData[dashboardBody[i].title]
                        //           .add(dashboardBody[i].dataDsc![j]);
                        //     }
                        //   }
                        // }
                        // ReqChooseAssets data = ReqChooseAssets.fromJson(arrData);
                        // ref.read(dashboardProvider.notifier).getSingleUserAssets(
                        //     context: context, data: data,);
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.08), //New
                              blurRadius: 2.0,
                              offset: Offset(-3, 5))
                        ],
                      ),
                      child: Text(
                        continuee,
                        style: TextStyle(color: white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          );
        },
      ),
    ),
  );
}
