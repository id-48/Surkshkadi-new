


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
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';

import '../../../data/model/home/chatboat/kyc_chatbot/res_kyc_chatbot.dart';

class SecondChatBotInformationEditScreen extends HookConsumerWidget {

 final  ResponseSCB messagesInfo;
 final int childCountInfo;
 final List<String> childNameInfo;
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

                    // popFamilyNewDataSecond.value.isEmpty ?
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

                            print("data mother ----->>>   ${popFamilyNewDataSecond.value["MotherName"]}");
                            print("data  marital ----->>>   ${popFamilyNewDataSecond.value["MaritalStatus"]}");

                          });

                        },
                        // : (){},

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
                      " : ${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.motherName : popFamilyNewDataSecond.value["MotherName"]}",
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
                      " : ${popFamilyNewDataSecond.value.isEmpty ?  messagesInfo.maritalStatus  : popFamilyNewDataSecond.value["MaritalStatus"]}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),



              // if( "${messagesInfo[5].messageContent[0] == "Unmarried" ?  "" : "${messagesInfo[7].messageContent[0]}"}" != '') ...[
              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Spouse Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${ popFamilyNewDataSecond.value.isEmpty ?  messagesInfo.spouseName  : popFamilyNewDataSecond.value["SpouseName"]}",
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                    // child: Text('Pune',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.5),),
                  ),
                ],
              ),
              // ],

              Gap(5),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4,
                    child: Text('Divorce Status',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.5),),
                  ),

                  Expanded(flex: 7,
                    child: Text(
                      " : ${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.divorceStatus : popFamilyNewDataSecond.value["Separated"]}",
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


                     // popMinorNewDataSecond.value.isEmpty ?
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
                            MinorDialogSecond(messagesInfoDialog: messagesInfo,),
                          );
                        },
                      ).then((value) {
                        popMinorNewDataSecond.value = value ;
                        print("data minor mother ----->>>   ${popMinorNewDataSecond.value["GuardianName"]}");
                        print("data minor  marital ----->>>   ${popMinorNewDataSecond.value["GuardianReal"]}");

                      });



                    },
                    // : (){},

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
                      " : ${popMinorNewDataSecond.value.isEmpty ?  messagesInfo.minorBeneficiaryName : popMinorNewDataSecond.value["GuardianName"]}",
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
                      " : ${popMinorNewDataSecond.value.isEmpty ? messagesInfo.minorBeneficiaryRelation : popMinorNewDataSecond.value["GuardianReal"]}",
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
                      " : ${popMinorNewDataSecond.value.isEmpty ? messagesInfo.minorBeneficiaryAddress : popMinorNewDataSecond.value["GuardianAdd"]}",
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

                    setString(prefMarriedSpouseName, "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.spouseName : popFamilyNewDataSecond.value["SpouseName"]}", );
                    setString(prefMotherName, "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.motherName : popFamilyNewDataSecond.value["MotherName"]}", );

                    ReqUpdateSecondChatBot  kycUpdateData = ReqUpdateSecondChatBot(
                        userId: getString(prefUserID),
                        subRegisterStatus: messagesInfo.subRegisterStatus,
                        motherName: "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.motherName : popFamilyNewDataSecond.value["MotherName"]}",
                        isMotherAlive: messagesInfo.isMotherAlive,
                        maritalStatus: "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.maritalStatus : popFamilyNewDataSecond.value["MaritalStatus"]}",
                        spouseName: "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.spouseName : popFamilyNewDataSecond.value["SpouseName"]}",
                        divorceStatus: "${popFamilyNewDataSecond.value.isEmpty ? messagesInfo.divorceStatus : popFamilyNewDataSecond.value["Separated"]}",
                        noOfChildren: messagesInfo.noOfChildren,
                        childName: messagesInfo.childName,
                        childAge: messagesInfo.childAge,
                        childGender: messagesInfo.childGender,
                        minorBeneficiaryName:  "${popMinorNewDataSecond.value.isEmpty ? messagesInfo.minorBeneficiaryName : popMinorNewDataSecond.value["GuardianName"]}",
                        minorBeneficiaryRelation: "${popMinorNewDataSecond.value.isEmpty ? messagesInfo.minorBeneficiaryRelation : popMinorNewDataSecond.value["GuardianReal"]}",
                        minorBeneficiaryAddress: "${popMinorNewDataSecond.value.isEmpty ? messagesInfo.minorBeneficiaryAddress : popMinorNewDataSecond.value["GuardianAdd"]}",

                    );



                    await  ref.read(updateSecondChatBoatProvider.notifier)
                           .postUpdateSecondChatBot(context: context, data: kycUpdateData)
                        .then((value) {
                             if(value?.status == 1){
                               displayToast("${value?.message}");
                               navigationService.push(routeBeneficiary ,arguments: {navChildCount:   childCountInfo  ,navChildName: childNameInfo});

                             }else {
                               displayToast("${value?.message}");
                             }
                    });





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
