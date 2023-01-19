

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/res_plan_chat_sub_payment.dart';

class FamilyInfoDialog extends HookConsumerWidget {
  final Response planChatBotSPData;
  FamilyInfoDialog({ Key? key ,required this.planChatBotSPData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final key = useState(GlobalKey<FormState>());

    final popFamilyData = useState<Map<String,dynamic>>({});

    final  fullNameCon  = useTextEditingController(text: planChatBotSPData.name);
    final  dobCon  = useTextEditingController(text:  "${planChatBotSPData.dob.year}""-${planChatBotSPData.dob.month}-""${planChatBotSPData.dob.day}");
    final  genderCon  = useTextEditingController(text: planChatBotSPData.gender);
    final  stateCon  = useTextEditingController(text:  planChatBotSPData.state);
    final  cityCon  = useTextEditingController(text:  planChatBotSPData.city);
    final  pinCodeCon  = useTextEditingController(text: planChatBotSPData.postCode);


    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          height: 420,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: primaryColor,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(famliyInformation,style: TextStyle(color: blue,fontWeight: FontWeight.w800,fontSize: 20),),
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: const Icon(Icons.cancel,color: blue,size: 30,),),
                    ],
                  ),

                  Gap(20),


                  PlanChatBSPDialogRow(controller: fullNameCon, keyValue: "Full Name :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: dobCon, keyValue: "Date of Birth :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: genderCon, keyValue: "Gender :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: stateCon, keyValue: "State :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: cityCon, keyValue: "City :"),

                  Gap(8),
                  PlanChatBSPDialogRow(controller: pinCodeCon, keyValue: "Pincode :"),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 9,horizontal: 40),
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

                      Gap(16),
                      CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 46),
                        title: "Save",
                        onTap: (){

                          popFamilyData.value = {
                            "fullName" : fullNameCon.text,
                            "dob" : dobCon.text,
                            "gender" :  genderCon.text,
                            "state" :  stateCon.text,
                            "city" :  cityCon.text,
                            "pinCode" :  pinCodeCon.text,
                          };
                          if(fullNameCon.text.isNotEmpty && dobCon.text.isNotEmpty &&
                          genderCon.text.isNotEmpty  &&  stateCon.text.isNotEmpty  &&
                          cityCon.text.isNotEmpty    &&   pinCodeCon.text.isNotEmpty
                          ){
                            navigationService.pop(args: popFamilyData.value);
                          }else{
                            displayToast("Please Check Your Information");
                          }
                        },
                      ),
                    ],
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}


class ContactInfoDialog extends HookConsumerWidget {
  final Response planChatBotSPData;
  ContactInfoDialog({ Key? key ,required this.planChatBotSPData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final key = useState(GlobalKey<FormState>());
    final popContactData = useState<Map<String,dynamic>>({});

    final  emailCon  = useTextEditingController(text: planChatBotSPData.email);
    final  mobileCon  = useTextEditingController(text: planChatBotSPData.wpNo);
    final  addressCon  = useTextEditingController(text: planChatBotSPData.address);


    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: primaryColor,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(contactInformation,style: TextStyle(color: blue,fontWeight: FontWeight.w800,fontSize: 20),),
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: const Icon(Icons.cancel,color: blue,size: 30,),),
                    ],
                  ),

                  Gap(20),


                  PlanChatBSPDialogRow(controller: emailCon, keyValue: "Email :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: mobileCon, keyValue: "WhatsApp No. :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: addressCon, keyValue: "Address :"),


                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 9,horizontal: 40),
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

                      Gap(16),
                      CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 46),
                        title: "Save",
                        onTap: (){

                          popContactData.value = {
                            "email" : emailCon.text,
                            "mobile" : mobileCon.text,
                            "address" : addressCon.text
                          };

                          if(emailCon.text.isNotEmpty && emailCon.text.isNotEmpty && addressCon.text.isNotEmpty
                          ){
                            navigationService.pop(args: popContactData.value);
                          }else{
                            displayToast("Please Check Your Information");
                          }



                        },
                      ),
                    ],
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}


class ProfessionalInfoDialog extends HookConsumerWidget {
  final Response planChatBotSPData;
  ProfessionalInfoDialog({ Key? key ,required this.planChatBotSPData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final key = useState(GlobalKey<FormState>());

    final popProfessionalData = useState<Map<String,dynamic>>({});

    final  occupationCon  = useTextEditingController(text: planChatBotSPData.occupation);
    final  incomeCon  = useTextEditingController(text: planChatBotSPData.annualIncome);


    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: primaryColor,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(professionalInformation,style: TextStyle(color: blue,fontWeight: FontWeight.w800,fontSize: 20),),
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: const Icon(Icons.cancel,color: blue,size: 30,),),
                    ],
                  ),

                  Gap(20),


                  PlanChatBSPDialogRow(controller: occupationCon, keyValue: "Occupation :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: incomeCon, keyValue: "Income :"),


                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 9,horizontal: 40),
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

                      Gap(16),
                      CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 46),
                        title: "Save",
                        onTap: (){

                          popProfessionalData.value = {
                            "occupation" : occupationCon.text,
                            'inCome' : incomeCon.text
                          };

                          if(occupationCon.text.isNotEmpty && incomeCon.text.isNotEmpty){
                            navigationService.pop(args: popProfessionalData.value);
                          }else{
                            displayToast("Please Check Your Information");
                          }
                        },
                      ),
                    ],
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}


class PlanChatBSPDialogRow extends HookWidget {
  final TextEditingController controller ;
  final String keyValue ;
  const PlanChatBSPDialogRow({Key? key,required this.controller,required this.keyValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 6,
            child: Text(keyValue,style: TextStyle(),)),

        Expanded(
          flex: 10,
          child: CustomTextfeild(
            controller: controller,
            height: 32,textCapitalization: TextCapitalization.none,
            contentPadding: EdgeInsets.only(left: 5,top: -3.0,bottom: 15),
            blurRadius: 1.0,
            offset: Offset(2, 3,),
            containerborder: Border.all(color: blue),
            containercolor : lightsky,
            borderRadius: BorderRadius.circular(7),
            hintStyle: TextStyle(color: greenjerry, fontSize: 13),
          ),
        ),

      ],
    );
  }
}
