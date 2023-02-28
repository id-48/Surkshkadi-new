


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot_update/req_update_second_chatbot.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/upadate_second_chatbot_view_modal.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';

class SecondChatBotInformationEditScreen extends HookConsumerWidget {

  List<ChatMessage> messagesInfo = [];
    int childCountInfo;
    List<String> childNameInfo;
   SecondChatBotInformationEditScreen({Key? key ,required this.messagesInfo ,required this.childCountInfo ,required this.childNameInfo}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    final popFamilyNewDataSecond = useState<Map<String,dynamic>>({});
    final popMinorNewDataSecond = useState<Map<String,dynamic>>({});

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
                    onTap:



                    // popFamilyNewData.value.isEmpty ?  (){
                    //   showDialog(
                    //     barrierDismissible: false,
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return  Dialog(
                    //         insetPadding: EdgeInsets.all(10),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(20),
                    //           ),
                    //         ),
                    //         child:
                    //         FamilyInfoDialog(planChatBotSPData: data.response),
                    //       );
                    //     },
                    //   ).then((value) {
                    //     popFamilyNewData.value = value;
                    //
                    //   });
                    // } :


                    popFamilyNewDataSecond.value.isEmpty ?
                        (){
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
                                child:
                                FamilyDialogSecond( messagesInfoDialog: messagesInfo),
                              );
                            },
                          ).then((value) {
                            popFamilyNewDataSecond.value =  value;
                          });

                        }
                        : (){},

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
                  Expanded(flex: 4,
                    child: Text('Mother Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${popFamilyNewDataSecond.value.isEmpty ? messagesInfo[3].messageContent[0] : popFamilyNewDataSecond.value["MotherName"]}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),
              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Marital Status',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${popFamilyNewDataSecond.value.isEmpty ?  messagesInfo[5].messageContent[0] : popFamilyNewDataSecond.value["MaritalStatus"]}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),



              if( "${messagesInfo[5].messageContent[0] == "Unmarried" ?  "" : "${messagesInfo[7].messageContent[0]}"}" != '') ...[
              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Spouse Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${messagesInfo[5].messageContent[0] == "Unmarried" ?  "" : "${messagesInfo[7].messageContent[0]}"}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),
              ],

              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Separated',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " :",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),



              SizedBox(height: Utils.getHeight(context) *0.03 ,),
              Row(
                children: [
                  Text(minorInformation,style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                  GestureDetector(
                    onTap:



                    // popFamilyNewData.value.isEmpty ?  (){
                    //   showDialog(
                    //     barrierDismissible: false,
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return  Dialog(
                    //         insetPadding: EdgeInsets.all(10),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(20),
                    //           ),
                    //         ),
                    //         child:
                    //         FamilyInfoDialog(planChatBotSPData: data.response),
                    //       );
                    //     },
                    //   ).then((value) {
                    //     popFamilyNewData.value = value;
                    //
                    //   });
                    // } :


                     popMinorNewDataSecond.value.isEmpty ?
                         (){
                      print("object");
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
                            child:
                            MinorDialogSecond(messagesInfoDialog: messagesInfo ,childCountInfoDialog:  childCountInfo),
                          );
                        },
                      ).then((value) {
                        popMinorNewDataSecond.value = value ;
                      });



                    }
                    : (){},

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
                  Expanded(flex: 4,
                    child: Text('Guardian Name ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${messagesInfo[5].messageContent[0] == "Unmarried" ? "${messagesInfo[7].messageContent[0]}" : childCountInfo == 0 ? "${messagesInfo[11].messageContent[0]}" : "${messagesInfo[13].messageContent[0]}"}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),
              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Guardian Relation',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${messagesInfo[5].messageContent[0] == "Unmarried" ? "${messagesInfo[7].messageContent[1]}" : childCountInfo == 0 ? "${messagesInfo[11].messageContent[1]}" : "${messagesInfo[13].messageContent[1]}"}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),
              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Guardian Address',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${messagesInfo[5].messageContent[0] == "Unmarried" ? "${messagesInfo[7].messageContent[2]}" : childCountInfo == 0 ? "${messagesInfo[11].messageContent[2]}" : "${messagesInfo[13].messageContent[2]}"}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),




              Gap(30),

              Center(
                child: CustomButton(
                  title: submit,
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),

                  onTap: () async {

                    // ReqUpdateSecondChatBot  kycUpdateData = ReqUpdateSecondChatBot(
                    //     userId: getString(prefUserID),
                    //     subRegisterStatus: subRegisterStatus,
                    //     motherName: motherName,
                    //     isMotherAlive: isMotherAlive,
                    //     maritalStatus: maritalStatus,
                    //     spouseName: spouseName,
                    //     divorceStatus: divorceStatus,
                    //     noOfChildren: noOfChildren,
                    //     childName: childName,
                    //     childAge: childAge,
                    //     childGender: childGender,
                    //     minorBeneficiaryName: minorBeneficiaryName,
                    //     minorBeneficiaryRelation: minorBeneficiaryRelation,
                    //     minorBeneficiaryAddress: minorBeneficiaryAddress)

                    // await  ref.read(UpdateSecondChatBoatProvider.notifier).postUpdateSecondChatBot(context: context, data: kycUpdateData)


                    navigationService.push(routeBeneficiary ,arguments: {navChildCount:   childCountInfo  ,navChildName: childNameInfo});



                  },
                ),
              ),

            ],
          ),


        ),
      ),


    );
  }
}
