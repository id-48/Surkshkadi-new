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
import 'package:surakshakadi/ui/Screens/bot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/ui/Screens/bot_screen/planchat_view_modal.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/payment_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_toast.dart';

///    StateFulWidget ---------->>>>>>>>>>>>>>>>> code
// class ChooseAssetMobile extends StatefulWidget {
//   final List<Specialities> dashboardResponse;
//    String? specificAssets;
//    List<ChatMessage>? messagesList;
//
//   ChooseAssetMobile({Key? key,this.specificAssets,required this.dashboardResponse, this.messagesList})
//       : super(key: key);
//
//   @override
//   State<ChooseAssetMobile> createState() => _ChooseAssetMobileState();
// }
//
// class _ChooseAssetMobileState extends State<ChooseAssetMobile> {
//   int selectedindex = 0;
//   int totalLength = 0;
//   double spacing = 8;
//   double runSpacing = 8;
//   List<Specialities> dashboardHeader = [];
//   List<Specialities> dashboardBody = [];
//   List<String> checkedIDs = [];
//  double amountTotal = 0;
//
//   Razorpay? _razorpay;
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//
//
//
//     // ReqPlanChatSubPayment PlanChatSubPayment = ReqPlanChatSubPayment(
//     //     paymentAmount: "${getString(prefPlanPrice)}",
//     //     subscriptionId: "${getString(prefSingleUAId)}",
//     //     transactionId: response.paymentId,
//     //     transactionStatus: "Success"
//     // );
//     //
//     //  print("data plan Payment --${PlanChatSubPayment.toJson()}");
//     //
//     // ref.read(planChatSubPaymentProvider.notifier)
//     //     .planChatSubPayment(context: context, data: PlanChatSubPayment)
//     //     .then((value) {
//     //   if(value!.status == 1){
//     //     displayToast(value.message);
//         navigationService.push(routeConfirmationPlan);
//       // }
//     // } );
//
//
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     ToastUtils.showCustomToast(
//         context, 'ERROR' + response.message!, 'warning');
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ToastUtils.showCustomToast(
//         context, 'SUCCESS' + response.walletName!, 'SUCCES');
//   }
//
//   void openCheckout(String amount) async {
//     String razorpayKey = await getString(prefRazorpayId);
//     print('razorPay 95 ${razorpayKey}');
//     print('razorPay 95  --${amount}');
//     var options = {
//       'key': 'rzp_test_NNbwJ9tmM0fbxj',
//       'amount': amount,
//       'name': 'Surakshakadi',
//       'description': 'Payment',
//       'prefill': {
//         'contact': '+91 7585982534',
//         'email': 'surakshakadi@gmail.com'
//       },
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//
//     try {
//       _razorpay!.open(options);
//     } catch (e) {
//       debugPrint("$e");
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     dashboardHeader.addAll(widget.dashboardResponse);
//     // dashboardBody.addAll(widget.dashboardResponse);
//     //
//     // for(int h = 0; h < dashboardBody.length; h++) {
//     //   dashboardBody[h].specialities = [];
//     //   for (int i = 0; i < dashboardBody[h].specialities!.length; i++) {
//     //     dashboardBody[h].specialities![i].checkValue = [];
//     //     for (int j = 0; j < dashboardBody[h].specialities![i].specilityTitle!.length ; j++) {
//     //       dashboardBody[h].specialities![i].checkValue?.add(false);
//     //     }
//     //   }
//     // }
//     _razorpay = Razorpay();
//     _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//
//   }
//
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: gerywhite,
//         title: Text(
//           chooseYourAssets,
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: black,
//               letterSpacing: 1),
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios, color: black, // add custom icons also
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 7),
//         child: Container(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   pleaseSelectTheAssets,
//                   style: TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.w500,
//                     // fontFamily: 'Nunito Sans'
//                   ),
//                 ),
//                 SizedBox(
//                   height: Utils.getHeight(context) * 0.022,
//                 ),
//
//                 Container(
//                   width: Utils.getWidth(context),
//                   child: Wrap(
//                     runSpacing: runSpacing,
//                     spacing: spacing,
//                     alignment: WrapAlignment.center,
//                     children: List.generate(dashboardHeader.length, (index) {
//                       return InkWell(
//                         onTap: () {
//                           if (index != selectedindex) {
//                             selectedindex = index;
//                             dashboardBody.clear();
//                             dashboardBody.insert(
//                                 0, widget.dashboardResponse[index]);
//                             dashboardBody.addAll(widget.dashboardResponse);
//                             dashboardBody.removeAt(index + 1);
//                             setState(() {});
//                           }
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 45,
//                           width: Utils.getWidth(context) / 5,
//                           decoration: BoxDecoration(
//                             color: selectedindex == index ? lightoreng : white,
//                             border: Border.all(
//                                 color:
//                                     selectedindex == index ? lightoreng : oreng,
//                                 width: 1.0),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Text(dashboardHeader[index].category ?? "",
//                               style: TextStyle(
//                                   fontSize: 11.5,
//                                   // fontFamily: 'Nunito Sans',
//                                   color:
//                                       selectedindex == index ? white : black),
//                               textAlign: TextAlign.center),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 Container(
//                   height: Utils.getHeight(context) * 0.7,
//                   padding: EdgeInsets.only(bottom: 100),
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount:  widget.dashboardResponse.length,
//                       itemBuilder: (context, index) {
//                         var data = widget.dashboardResponse[index];
//                         return Container(
//                           // height: 180,
//                           // width: w,
//                           margin: EdgeInsets.only(bottom: 15),
//                           padding: const EdgeInsets.all(
//                             12,
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: borderblue,
//                               width: 1.2,
//                             ),
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 5),
//                                 child: Text(
//                                   data.category ?? "",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: blue,
//                                       letterSpacing: 0.5,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                               ...data.specialities!.map((e) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       e.checkValue = e.checkValue == true ? false : true ;
//                                           // !dashboardBody[index].checkValue![data.dataDsc!.indexOf(e)];
//                                       totalLength = 0;
//                                     });
//
//
//                                     // for (int i = 0; i < dashboardHeader.length; i++) {
//                                     //
//                                     //   for (int j = 0; j < dashboardHeader[i].specialities!.length; j++) {
//
//                                         if (e.checkValue == true) {
//                                           // print("fals1 : ${e.specilityId.toString()}");
//                                           // totalLength++;
//                                           checkedIDs.add(e.specilityId.toString());
//
//                                           print("Checked IDs-- ${checkedIDs}");
//
//                                         }else{
//                                           // print("fals : ${e.specilityId.toString()}");
//                                           checkedIDs.remove(e.specilityId.toString());
//                                         // print("Checked IDs11-- ${checkedIDs}");
//                                         }
//                                     //    break;
//                                     //   }
//                                     //   break;
//                                     // }
//
//                                     /// old
//                                     // for (int i = 0;
//                                     //     i < dashboardBody.length;
//                                     //     i++) {
//                                     //   for (int j = 0;
//                                     //       j < dashboardBody[i].dataDsc!.length;
//                                     //       j++) {
//                                     //     if (dashboardBody[i].checkValue![j] ==
//                                     //         true) {
//                                     //       totalLength++;
//                                     //     }
//                                     //   }
//                                     // }
//                                   },
//                                   child: Row(
//                                     children: [
//                                       e.checkValue == true
//                                           ? Icon(
//                                               Icons.check_box,
//                                               color: blue,
//                                             )
//                                           : Icon(
//                                               Icons.check_box_outline_blank,
//                                               color: blue,
//                                             ),
//                                       Gap(5),
//                                       Text(
//                                         '${e.specilityTitle}',
//                                         style: TextStyle(fontSize: 16),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                             ],
//                           ),
//                         );
//                        },
//                       ),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: Utils.getHeight(context) * 0.08,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xff037EEE).withOpacity(0.15),
//               offset: const Offset(0.0, -3),
//               blurRadius: 0.7,
//               spreadRadius: 0.5,
//             ), //BoxShadow
//           ],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                     alignment: Alignment.center,
//                     child: RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                               // text: "00",
//                               text: "${checkedIDs.length}",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                   color: blue)),
//                           TextSpan(
//                               text: itemsSelectedInYourAssets,
//                               style: TextStyle(
//                                   color: jerrygreen,
//                                   fontSize: 14,
//                                   letterSpacing: 0.5)),
//                         ],
//                       ),
//                     ))),
//             Expanded(
//                 flex: 1,
//                 child: HookConsumer(
//                   builder: (context, ref, child) {
//                     return InkWell(
//                       onTap: () async {
//
//                         if(checkedIDs.isNotEmpty) {
//                           if (widget.specificAssets == "SpecificAssets") {
//                             displayDialog(context, ref, checkedIDs);
//                           } else {
//                             print( "fatherName: ${widget.messagesList![21].messageContent[0]}");
//                             ReqPlanChatBot dataPlanChatBot = ReqPlanChatBot(
//
//                               userId: getString(prefUserID),
//                               planId: getString(prefPlanIdMobile),
//                               processStatus: "${widget.messagesList![1].messageContent[0]}",
//                               gender: "${widget.messagesList![3].messageContent[0]}",
//                               name: "${widget.messagesList![5].messageContent[0]}",
//                               dob: "${widget.messagesList![7].messageContent[0]}",
//                               address: "${widget.messagesList![9].messageContent[0]}",
//                               state: "${widget.messagesList![11].messageContent[0]}",
//                               city: "${widget.messagesList![11].messageContent[1]}",
//                               postCode: "${widget.messagesList![13].messageContent[0]}",
//                               wpNo: "${widget.messagesList![15].messageContent[0]}",
//                               email: "${widget.messagesList![17].messageContent[0]}",
//                               annualIncome: "${widget.messagesList![19].messageContent[0]}",
//                               occupation: "${widget.messagesList![19].messageContent[1]}",
//                               fatherName: "${widget.messagesList![21].messageContent[0]}",
//                               nominee: "${widget.messagesList![23].messageContent[0]}",
//                               nomineeRelation: "${widget.messagesList![25].messageContent[0]}",
//                               covidDose: "${widget.messagesList![27].messageContent[0]}",
//                               nicotineProducts: "${widget.messagesList![29].messageContent[0]}",
//                               planAssets: "${checkedIDs}"
//                                   .replaceAll("[", "")
//                                   .replaceAll("]", ""),
//                             );
//
//
//                             print("Hello yash  --->> ${dataPlanChatBot.toJson()}");
//                             await ref
//                                 .read(planChatProvider.notifier)
//                                 .planChatBotSub(
//                                 context: context, data: dataPlanChatBot)
//                                 .then((value) async {
//                               print("Hello yashu");
//                               if (value!.status == 1) {
//                                 print("Hello yashu patel");
//
//                                 displayToast(value.message.toString());
//                                print("pricer  -- ${getString(prefPlanPrice)}");
//
//                                 setString(prefSubscriptionId, "${value.response.subscriptionId}");
//
//                                 amountTotal = double.parse(getString(prefPlanPrice).toString()) * 100 ;
//                                 print("total ___>>>>${amountTotal.toString()}");
//
//                                 openCheckout('${amountTotal.toString()}');
//                               }
//                             });
//
//
//                             // navigationService.push(routeConfirmationPlan);
//
//                             //   Map<String, dynamic> arrData = {};
//                             //
//                             //   for (int i = 0; i < dashboardBody.length; i++) {
//                             //     arrData.addAll({'${dashboardBody[i].title}': []});
//                             //     for (int j = 0;
//                             //         j < dashboardBody[i].dataDsc!.length;
//                             //         j++) {
//                             //       if (dashboardBody[i].checkValue![j] == true) {
//                             //         arrData[dashboardBody[i].title]
//                             //             .add(dashboardBody[i].dataDsc![j]);
//                             //       }
//                             //     }
//                             //   }
//                             //   ReqChooseAssets data = ReqChooseAssets.fromJson(arrData);
//                             //
//                             //   ref.read(dashboardProvider.notifier).getSingleUserAssets(
//                             //       context: context, data: data,).then((value) {
//                             //         if(value!.status == true){
//                             //           // openCheckout(getString(prefSingleAssetsPrice));
//                             //           openCheckout('100');
//                             //         }
//                             //   });
//
//                           }
//                         }else{
//                           displayToast("Please Select in one Assets");
//                         }
//
//
//                       },
//                       child: Container(
//                         height: Utils.getHeight(context) * 0.08,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color(0xff3C87E0).withOpacity(0.9),
//                               Color(0xff0E3563).withOpacity(0.9)
//                             ],
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                           ),
//                         ),
//                         child: Text(
//                           continuee,
//                           style: TextStyle(
//                               color: white,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5),
//                         ),
//                       ),
//                     );
//                   },
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }

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
    // int selectedindex = 0;
    int totalLength = 0;
    double spacing = 8;
    double runSpacing = 8;
    // List<Specialities> dashboardHeader = [];
    // List<Specialities> dashboardBody = [];
    // List<String> checkedIDs = [];
    // double amountTotal = 0;

    final dashboardHeader = useState<List<ResponseSpeciality>>([]);
    final dashboardBody = useState<List<ResponseSpeciality>>([]);

    final selectedindex = useState<int>(0);
    var checkedIDs = useState<List<String>>([]);
    final amountTotal = useState<double>(0);

    Razorpay? _razorpay;

    void _handlePaymentSuccess(PaymentSuccessResponse response) async {
      print("yashtotal333333 ___>>>>");
      setString(prefPaymentId, response.paymentId.toString());

      print("getString ");

      ReqPlanChatSubPayment PlanChatSubPayment = ReqPlanChatSubPayment(
          paymentAmount: "${getString(prefPlanPrice)}",
          subscriptionId: "${getString(prefSubscriptionId)}",
          transactionId: response.paymentId,
          transactionStatus: "Success");

      print("data plan Payment --${PlanChatSubPayment.toJson()}");

      ref
          .read(planChatSubPaymentProvider.notifier)
          .planChatSubPayment(context: context, data: PlanChatSubPayment)
          .then((value) {
        if (value!.status == 1) {
          planChatBotSP = value.response;
          displayToast(value.message);
          navigationService.push(routeConfirmationPlan);
        }
      });
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      ToastUtils.showCustomToast(
          context, 'ERROR' + response.message!, 'warning');
    }

    void _handleExternalWallet(ExternalWalletResponse response) {
      ToastUtils.showCustomToast(
          context, 'SUCCESS' + response.walletName!, 'SUCCES');
    }

    void openCheckout(String amount) async {
      print("yashtotal11111 ___>>>>");
      // String razorpayKey = await getString(prefRazorpayId);
      // print('razorPay 95 ${razorpayKey}');
      print('razorPay 95  --${amount}');
      var options = {
        'key': 'rzp_test_3FbPA4Jan9QLit',
        'amount': "60000",
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
        print("yashtotal2222 ___>>>>");
        _razorpay!.open(options);
      } catch (e) {
        debugPrint("$e");
      }
    }

    useEffect(() {
      print("yashupatel ___>>>>");

      if (selectedPlan.isNotEmpty) {
           selectedPlan.forEach((element) {
             if (element.specialityStatus == "Y") {
               var ind = dashboardResponse.indexWhere(
                 (ele) => ele.category == element.specialityName);
               dashboardHeader.value.add(dashboardResponse.elementAt(ind));
               dashboardBody.value.add(dashboardResponse.elementAt(ind));
            }
          }
        );
      }else {
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
                            if (index != selectedindex.value) {
                              selectedindex.value = index;

                              setState(() {
                                dashboardBody.value.clear();
                                dashboardBody.value.insert(0,dashboardHeader.value[selectedindex.value]);
                                dashboardBody.value.addAll(dashboardHeader.value);
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
                              color: selectedindex.value == index
                                  ? lightoreng
                                  : white,
                              border: Border.all(
                                  color: selectedindex.value == index
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
                                    color: selectedindex.value == index
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
                                          checkedIDs.value
                                              .add(e.specilityId.toString());
                                          print(
                                              "Checked IDs-- ${checkedIDs.value}");
                                        } else {
                                          checkedIDs.value
                                              .remove(e.specilityId.toString());
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
                      print("mobile number ----->>> ${getString(prefLoginNumber)}");

                      String  wpNumber = messagesList![3].messageContent[0] == "No" ? messagesList![3].messageContent[1] : "4324";
                      print("mobile WatsApp number ----->>> ${wpNumber}");

                      if (checkedIDs.value.isNotEmpty) {
                        if (specificAssets == "SpecificAssets") {
                          displayDialogCA(
                              context, ref, checkedIDs.value, false);
                        } else {
                          if (getBool(prefSubChatBotCompletedMobile) == false) {
                            print(
                                "fatherName: ${messagesList![21].messageContent[0]}");
                            ReqPlanChatBot dataPlanChatBot = ReqPlanChatBot(
                              userId: getString(prefUserID),
                              planId: getString(prefPlanIdMobile),
                              processStatus:
                                  "${messagesList![1].messageContent[0]}",
                              wpNo: wpNumber,
                              // wpNo:  messagesList![3].messageContent[1].isNotEmpty ?   "${messagesList![3].messageContent[1]}" : "1234567890",
                              gender: "${messagesList![5].messageContent[0]}",
                              dob: "${messagesList![7].messageContent[0]}",
                              annualIncome:
                                  "${messagesList![9].messageContent[0]}",
                              occupation:
                                  "${messagesList![9].messageContent[1]}",
                              name: "${messagesList![11].messageContent[0]}",
                              fatherName:
                                  "${messagesList![13].messageContent[0]}",
                              nominee: "${messagesList![15].messageContent[0]}",
                              nomineeRelation:
                                  "${messagesList![15].messageContent[1]}",
                              postCode:
                                  "${messagesList![17].messageContent[0]}",
                              address:
                                  "${messagesList![19].messageContent[0]},${messagesList![19].messageContent[1]}",
                              state: "${messagesList![19].messageContent[2]}",
                              city: "${messagesList![19].messageContent[3]}",
                              covidDose:
                                  "${messagesList![21].messageContent[0]}",
                              nicotineProducts:
                                  "${messagesList![23].messageContent[0]}",
                              email: "Static Email",
                              planAssets: "${checkedIDs.value}"
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                            );

                            print(
                                "Hello yash  --->> ${dataPlanChatBot.toJson()}");
                            await ref
                                .read(planChatProvider.notifier)
                                .planChatBotSub(
                                    context: context, data: dataPlanChatBot)
                                .then((value) async {
                              print("Hello yashu");
                              if (value!.status == 1) {
                                displayToast(value.message.toString());
                                setString(prefSubscriptionId,
                                    "${value.response.subscriptionId}");
                                setBool(prefSubChatBotCompletedMobile, true);
                                // amountTotal.value = double.parse(
                                //     getString(prefPlanPrice).toString()) *
                                //     100;

                                navigationService.push(routeConfirmationPlan);

                                // openCheckout('22000');
                                // openCheckout('${amountTotal.value.toString()}');

                              }
                            });
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
