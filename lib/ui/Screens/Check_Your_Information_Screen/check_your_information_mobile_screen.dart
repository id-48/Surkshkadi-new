import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/req_plan_chat_update.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/plan_chat_bot_update_view_modal.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/payment_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/loading.dart';





class CheckyourInformation extends HookConsumerWidget {
  const CheckyourInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final popFamilyNewData = useState<Map<String,dynamic>>({});
    final popContactNewData = useState<Map<String,dynamic>>({});
    final popProfessionalNewData = useState<Map<String,dynamic>>({});

    useEffect(() {

      ReqPlanChatSubPayment PlanChatSubPayment = ReqPlanChatSubPayment(
          paymentAmount: "${getString(prefPlanPrice)}",
          subscriptionId: "${getString(prefSubscriptionId)}",
          transactionId: "testpatel",
          // transactionId: getString(prefPaymentId),
          transactionStatus: "Success"
      );

      ref.read(planChatSubPaymentProvider.notifier)
          .planChatSubPayment(context: context, data: PlanChatSubPayment);
    },[]);


    final  planChatSPController = ref.watch(planChatSubPaymentProvider);


    return StatefulBuilder(
      builder: (BuildContext context,setState) {

    return  planChatSPController.when(data: (data){
        return Scaffold(
          appBar: CustomAppBar(
            title: checkYourInformation,
            backonTap: () {
              Navigator.pop(context);
            },
            notionTap: () {},
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child:

             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(informationCorrect,style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(height: Utils.getHeight(context) *0.02 ,),

                    Text(beforeWeProceeds,
                      style: TextStyle(color: blue,fontSize: 12.5),),



                    SizedBox(height: Utils.getHeight(context) *0.04 ,),

                    Row(
                      children: [
                        Text(famliyInformation,style: TextStyle(fontWeight: FontWeight.bold),),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return  Dialog(
                                  insetPadding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: FamilyInfoDialog(planChatBotSPData: data.response),
                                );
                              },
                            ).then((value) {
                              popFamilyNewData.value = value;
                              print("name : ${popFamilyNewData.value["fullName"]}");
                              print("dob : ${popFamilyNewData.value["dob"]}");
                              print("gender : ${popFamilyNewData.value["gender"]}");
                            });
                          },

                          child: Row(
                            children: [
                              Icon(Icons.edit_outlined,color: oreng,size: 20,),
                              Gap(10),
                              Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng),),
                            ],
                          ),
                        ),
                        Gap(15),
                      ],),

                    Divider(thickness: 1.2, endIndent: 0, color: fullgray,),

                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Full Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text( popFamilyNewData.value.isEmpty ?  '${data.response.name}' : "${popFamilyNewData.value["fullName"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('Avinash Sahani',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popFamilyNewData.value.isEmpty ? '${data.response.dob.year}''-${data.response.dob.month}-''${data.response.dob.day}' : "${popFamilyNewData.value["dob"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('22/04/1975',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Gender',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popFamilyNewData.value.isEmpty ? '${data.response.gender}' : "${popFamilyNewData.value["gender"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('Male',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('State',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popFamilyNewData.value.isEmpty ? '${data.response.state}' : "${popFamilyNewData.value["state"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('Maharashatra',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('City',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popFamilyNewData.value.isEmpty ? '${data.response.city}' : "${popFamilyNewData.value["city"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Pincode',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popFamilyNewData.value.isEmpty ? '${data.response.postCode}' : "${popFamilyNewData.value["pinCode"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('411028',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),



                    SizedBox(height: Utils.getHeight(context) *0.03 ,),

                    Row(children: [
                      Text(contactInformation,style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return  Dialog(
                                insetPadding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ContactInfoDialog(planChatBotSPData: data.response),
                              );
                            },
                          ).then((value) {
                            popContactNewData.value = value ;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined,color: oreng,size: 20,),
                            Gap(10),
                            Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng),),
                          ],
                        ),
                      ),
                      Gap(15),
                    ],),

                    Divider(thickness: 1.2, endIndent: 0, color: fullgray,),

                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Email',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popContactNewData.value.isEmpty ? '${data.response.email}' : "${popContactNewData.value["email"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('avinash.sahani78@gmail.com',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),

                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Mobile No.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popContactNewData.value.isEmpty ? '${data.response.wpNo}' : "${popContactNewData.value["mobile"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('8756XXXX78',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),


                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Address',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popContactNewData.value.isEmpty ? '${data.response.address}' : "${popContactNewData.value["address"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),


                    SizedBox(height: Utils.getHeight(context) *0.03 ,),

                    Row(children: [
                      Text(professionalInformation,style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return  Dialog(
                                insetPadding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ProfessionalInfoDialog(planChatBotSPData: data.response),
                              );
                            },
                          ).then((value) {
                            popProfessionalNewData.value = value ;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined,color: oreng,size: 20,),
                            Gap(10),
                            Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng),),
                          ],
                        ),
                      ),
                      Gap(15),
                    ],),

                    Divider(thickness: 1.2, endIndent: 0, color: fullgray,),

                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Occupation',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text( popProfessionalNewData.value.isEmpty ? '${data.response.occupation}' : "${popProfessionalNewData.value["occupation"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(5),

                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3,
                          child: Text('Income',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                        ),

                        Expanded(flex: 7,
                          child: Text(popProfessionalNewData.value.isEmpty ? '${data.response.annualIncome}' : "${popProfessionalNewData.value["inCome"]}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                          // child: Text('2 Lakhs - 5 Lakhs per anum',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                        ),
                      ],
                    ),

                    Gap(30),

                    Center(
                      child: CustomButton(
                        title: submit,
                        padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                        onTap: () async{
                          ReqPlanChatUpdate chatBotUpdate = ReqPlanChatUpdate(
                              userId: getString(prefUserID),
                              name:  popFamilyNewData.value.isEmpty ?  '${data.response.name}' : "${popFamilyNewData.value["fullName"]}",
                              email: popContactNewData.value.isEmpty ? '${data.response.email}' : "${popContactNewData.value["email"]}",
                              wpNo:  popContactNewData.value.isEmpty ? '${data.response.wpNo}' : "${popContactNewData.value["mobile"]}",
                              dob: popFamilyNewData.value.isEmpty ? '${data.response.dob.year}''-${data.response.dob.month}-''${data.response.dob.day}' : "${popFamilyNewData.value["dob"]}",
                              gender: popFamilyNewData.value.isEmpty ? '${data.response.gender}' : "${popFamilyNewData.value["gender"]}",
                              address: popContactNewData.value.isEmpty ? '${data.response.address}' : "${popContactNewData.value["address"]}",
                              state: popFamilyNewData.value.isEmpty ? '${data.response.state}' : "${popFamilyNewData.value["state"]}",
                              city: popFamilyNewData.value.isEmpty ? '${data.response.city}' : "${popFamilyNewData.value["city"]}",
                              postCode: popFamilyNewData.value.isEmpty ? '${data.response.postCode}' : "${popFamilyNewData.value["pinCode"]}",
                              annualIncome: popProfessionalNewData.value.isEmpty ? '${data.response.annualIncome}' : "${popProfessionalNewData.value["inCome"]}",
                              occupation:  popProfessionalNewData.value.isEmpty ? '${data.response.occupation}' : "${popProfessionalNewData.value["occupation"]}",
                              fatherName: '${data.response.fatherName}',
                              nominee: '${data.response.nominee}',
                              nomineeRelation: '${data.response.nomineeRelation}',
                              covidDose: '${data.response.covidDose}',
                              nicotineProducts: '${data.response.nicotineProducts}'
                          );
                          await ref.read(planChatUpdateProvider.notifier)
                              .getPlanChatUpdate(context: context, data: chatBotUpdate)
                              .then((value) {
                            if(value!.status == 1){
                              displayToast("${value.message}");
                              navigationService.push(routeKycScreen);
                            }else{
                              displayToast("${value.message}");

                            }
                          } );


                        },
                      ),
                    ),

                  ],
                ),


            ),
          ),

          // bottomNavigationBar: Container(
          //   height: Utils.getHeight(context) * 0.08,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color(0xff037EEE).withOpacity(0.15),
          //         offset: const Offset(0.0, -1),
          //         blurRadius: 0.5,
          //         spreadRadius: 0.3,
          //       ), //BoxShadow
          //     ],
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: InkWell(
          //           onTap: (){
          //             Navigator.pop(context);
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(
          //                 back,
          //                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xff727272))),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //           flex: 1,
          //           child: InkWell(
          //             onTap: () async{
          //               // Navigator.push(context, MaterialPageRoute(builder: (context) => Assets() ));
          //
          //               ReqPlanChatUpdate chatBotUpdate = ReqPlanChatUpdate(
          //                   userId: getString(prefUserID),
          //                   name:  popFamilyNewData.value.isEmpty ?  '${data.response.name}' : "${popFamilyNewData.value["fullName"]}",
          //                   email: popContactNewData.value.isEmpty ? '${data.response.email}' : "${popContactNewData.value["email"]}",
          //                   wpNo:  popContactNewData.value.isEmpty ? '${data.response.wpNo}' : "${popContactNewData.value["mobile"]}",
          //                   dob: popFamilyNewData.value.isEmpty ? '${data.response.dob.year}''-${data.response.dob.month}-''${data.response.dob.day}' : "${popFamilyNewData.value["dob"]}",
          //                   gender: popFamilyNewData.value.isEmpty ? '${data.response.gender}' : "${popFamilyNewData.value["gender"]}",
          //                   address: popContactNewData.value.isEmpty ? '${data.response.address}' : "${popContactNewData.value["address"]}",
          //                   state: popFamilyNewData.value.isEmpty ? '${data.response.state}' : "${popFamilyNewData.value["state"]}",
          //                   city: popFamilyNewData.value.isEmpty ? '${data.response.city}' : "${popFamilyNewData.value["city"]}",
          //                   postCode: popFamilyNewData.value.isEmpty ? '${data.response.postCode}' : "${popFamilyNewData.value["pinCode"]}",
          //                   annualIncome: popProfessionalNewData.value.isEmpty ? '${data.response.annualIncome}' : "${popProfessionalNewData.value["inCome"]}",
          //                   occupation:  popProfessionalNewData.value.isEmpty ? '${data.response.occupation}' : "${popProfessionalNewData.value["occupation"]}",
          //                   fatherName: '${data.response.fatherName}',
          //                   nominee: '${data.response.nominee}',
          //                   nomineeRelation: '${data.response.nomineeRelation}',
          //                   covidDose: '${data.response.covidDose}',
          //                   nicotineProducts: '${data.response.nicotineProducts}'
          //               );
          //
          //
          //               await ref.read(planChatUpdateProvider.notifier)
          //                   .getPlanChatUpdate(context: context, data: chatBotUpdate)
          //                   .then((value) {
          //                    if(value!.status == 1){
          //                      displayToast("${value.message}");
          //                      navigationService.push(routeKycScreen);
          //                    }else{
          //                      displayToast("${value.message}");
          //
          //                    }
          //               } );
          //
          //
          //
          //
          //
          //             },
          //             child: Container(
          //               height: Utils.getHeight(context) * 0.08,
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 gradient: LinearGradient(
          //                   colors: [
          //                     Color(0xff3C87E0).withOpacity(0.9),
          //                     Color(0xff0E3563).withOpacity(0.9)
          //                   ],
          //                   begin: Alignment.topCenter,
          //                   end: Alignment.bottomCenter,
          //                 ),
          //               ),
          //               child: Text(
          //                 allGood,
          //                 style: TextStyle(
          //                     color: white,
          //                     fontWeight: FontWeight.w600,
          //                     letterSpacing: 0.5),
          //               ),
          //             ),
          //           )),
          //     ],
          //   ),
          // ),
        );

      },
        error: (obj, trace) => ErrorWidget(obj),
        loading: () => const Loading());
      }
    );
  }
}











