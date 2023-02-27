

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
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
    final formattedDate = useState<String>("");
    // final age = useState<String>("");
    String age = '0';


    final  fullNameCon  = useTextEditingController(text: planChatBotSPData.name);
    final  dobCon  = useTextEditingController(text:  "${planChatBotSPData.dob.year}""-${planChatBotSPData.dob.month}-""${planChatBotSPData.dob.day}");
    final  genderCon  = useTextEditingController(text: planChatBotSPData.gender);
    final  stateCon  = useTextEditingController(text:  planChatBotSPData.state);
    final  cityCon  = useTextEditingController(text:  planChatBotSPData.city);
    final  pinCodeCon  = useTextEditingController(text: planChatBotSPData.postCode);
    final  dobUpdateData  = formattedDate.value;
    final  dobOldData  = "${planChatBotSPData.dob.year}""-${planChatBotSPData.dob.month}-""${planChatBotSPData.dob.day}";

    String calculateAge(DateTime birthDate) {
      DateTime currentDate = DateTime.now();
      int agee = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        agee--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          agee--;
        }
      }
      return agee.toString();
    }



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


                  // PlanChatBSPDialogRow(controller: dobCon, keyValue: "Date of Birth :"),
                  Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Text("Date of Birth :",style: TextStyle(),)),

              Expanded(
                flex: 10,
                child:InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1850),
                      lastDate: DateTime(2200),

                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: blue, // <-- SEE HERE
                              onPrimary: white, // <-- SEE HERE
                              onSurface: black, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: blue, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      // print(pickedDate);
                      formattedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);

                      age = calculateAge(pickedDate);


                      setString(prefAge, age);
                      print("Date   ----->>>>${formattedDate}");
                      print("agee   ----->>>>${age}");

                      setState((){});
                    } else {
                      displayToast("Please Select Your Birth Date.");

                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

                    height: 32,
                    width: Utils.getWidth(context) * 0.4,
                    decoration: BoxDecoration(
                      boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                      blurRadius: 1.0,
                        offset: Offset(2, 3,),
                    ),

                    ],
                        color: lightsky,
                        border: Border.all(color: blue),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      dobUpdateData.isEmpty ? dobOldData : dobUpdateData ,
                      style: TextStyle(),
                    ),
                  ),
                ),
              ),

            ],
          ),

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
                          setString(prefAge, age);
                          print("agegege---->${getString(prefAge)}");

                          popFamilyData.value = {
                            "fullName" : fullNameCon.text,
                            "dob" : formattedDate.value,
                            "gender" :  genderCon.text,
                            "state" :  stateCon.text,
                            "city" :  cityCon.text,
                            "pinCode" :  pinCodeCon.text,
                          };
                          if(fullNameCon.text.isNotEmpty && formattedDate.value.isNotEmpty &&
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


class KeyValue extends HookWidget {
  final String keyy ;
  final String valuee ;
  const KeyValue({Key? key,required this.keyy,required this.valuee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.45 : MediaQuery.of(context).size.width - 33,
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4,
            child: Text(keyy,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          ),

          Expanded(flex: 8,
            child: Text(valuee,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
          ),
        ],
      ),
    );
  }
}



class FamilyDialogSecond extends HookConsumerWidget {

   final List<ChatMessage> messagesInfoDialog ;
   FamilyDialogSecond({ Key? key ,
    required this.messagesInfoDialog

  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final popFamilyInfoData = useState<Map<String,dynamic>>({});

    final  MotherNameCon  = useTextEditingController(text: "${messagesInfoDialog[3].messageContent[0]}");
    final  MaritalStaCon = useTextEditingController(text: "${messagesInfoDialog[5].messageContent[0]}");
    final  SpouseNameCon  = useTextEditingController(text: "${messagesInfoDialog[5].messageContent[0] == "Unmarried" ?  "" : "${messagesInfoDialog[7].messageContent[0]}"}");
    final  SeparatedCon  = useTextEditingController(text: "");

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          height: 320,
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


                  PlanChatBSPDialogRow(controller: MotherNameCon, keyValue: "Mother Name :"),

                  Gap(10),


                  PlanChatBSPDialogRow(controller: MaritalStaCon, keyValue: "Marital Status :"),


                  Gap(10),
                  PlanChatBSPDialogRow(controller: SpouseNameCon, keyValue: "Spouse Name :"),

                  Gap(10),
                  PlanChatBSPDialogRow(controller: SeparatedCon, keyValue: "Separated :"),



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



                          popFamilyInfoData.value = {
                            "MotherName" : MotherNameCon.text,
                            "MaritalSta" : MaritalStaCon.value,
                            "SpouseName" :  SpouseNameCon.text,
                            "Separated" :  SeparatedCon.text,
                          };

                          if(MotherNameCon.text.isNotEmpty && MaritalStaCon.text.isNotEmpty &&
                              SpouseNameCon.text.isNotEmpty  &&  SeparatedCon.text.isNotEmpty

                          ){
                            navigationService.pop(args: popFamilyInfoData.value);
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



class MinorDialogSecond extends HookConsumerWidget {
  List<ChatMessage> messagesInfoDialog = [];
  int childCountInfoDialog;
  MinorDialogSecond({ Key? key ,
    required this.messagesInfoDialog,
    required this.childCountInfoDialog

  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final key = useState(GlobalKey<FormState>());

    final popMinorData = useState<Map<String,dynamic>>({});






    final  GuardianNameCon  = useTextEditingController(text: " ${messagesInfoDialog[5].messageContent[0] == "Unmarried" ? "${messagesInfoDialog[7].messageContent[0]}" : childCountInfoDialog == 0 ? "${messagesInfoDialog[11].messageContent[0]}" : "${messagesInfoDialog[13].messageContent[0]}"}");
    final  GuardianRelationCon  = useTextEditingController(text: " ${messagesInfoDialog[5].messageContent[0] == "Unmarried" ? "${messagesInfoDialog[7].messageContent[1]}" : childCountInfoDialog == 0 ? "${messagesInfoDialog[11].messageContent[1]}" : "${messagesInfoDialog[13].messageContent[1]}"}");
    final  GuardianAddressCon  = useTextEditingController(text: " ${messagesInfoDialog[5].messageContent[0] == "Unmarried" ? "${messagesInfoDialog[7].messageContent[2]}" : childCountInfoDialog == 0 ? "${messagesInfoDialog[11].messageContent[2]}" : "${messagesInfoDialog[13].messageContent[2]}"}") ;








    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          height: 280,
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
                      const Text(minorInformation,style: TextStyle(color: blue,fontWeight: FontWeight.w800,fontSize: 20),),
                      GestureDetector(
                        onTap: (){
                          navigationService.pop();
                        },
                        child: const Icon(Icons.cancel,color: blue,size: 30,),),
                    ],
                  ),

                  Gap(20),


                  PlanChatBSPDialogRow(controller: GuardianNameCon, keyValue: "Guardian Name :"),

                  Gap(10),


                  PlanChatBSPDialogRow(controller: GuardianRelationCon, keyValue: "Guardian Relation :"),


                  Gap(10),
                  PlanChatBSPDialogRow(controller: GuardianAddressCon, keyValue: "Guardian Address:"),





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



                          popMinorData.value = {
                            "fullName" : GuardianNameCon.text,
                            "dob" : GuardianRelationCon.value,
                            "gender" :  GuardianAddressCon.text,

                          };
                          if(GuardianNameCon.text.isNotEmpty && GuardianRelationCon.text.isNotEmpty &&
                              GuardianAddressCon.text.isNotEmpty
                          ){
                            navigationService.pop(args: popMinorData.value);
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

