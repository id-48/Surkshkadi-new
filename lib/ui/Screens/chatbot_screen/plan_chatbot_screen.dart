///                   New Chat demo Screen 26/12/2022                       ///

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_select.dart';

class PlanChatBotMobile extends StatefulWidget {
  List<PlanModule> selectedPlanCB;
   PlanChatBotMobile({Key? key,required this.selectedPlanCB}) : super(key: key);

  @override
  State<PlanChatBotMobile> createState() => _PlanChatBotMobileState();
}

class _PlanChatBotMobileState extends State<PlanChatBotMobile> {
  TextEditingController chatController = TextEditingController();
  TextEditingController buildNoController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  int indexStore = 0;
  bool button = false;
  bool isTextField = false;
  bool nicotineYes = false;
  bool nicotineNo = false;
  bool whNo = false;
  bool nomineeReName = false;
  bool address = false;

  String statee = "";
  String cityy = "";
  String inCome = "";
  String occupation = "";
  String formattedDate = "";
  String nomineeRe = "";
  List<int> listIndex = [];

  List<String> CityList = [];



  List<ChatMessage> messages = [
    ChatMessage(messageContent: [
      "Hi, I am SURAKSHA BOT.",
      "Thanks for choosing the\nsubscription plan",
      "I appreciate that you are taking\nproactive steps for the\nwelfare of your family."
    ], messageType: "receiver"),
  ];
  ScrollController controller = ScrollController();
  List<ChatMessage> messagesQustion = [
       ChatMessage(messageContent: ["Is it your WhatsApp number?"], messageType: "receiver"), //  14 ----> 14
       ChatMessage(messageContent: ["Which gender do you most\nassociate with?"], messageType: "receiver"), //  2
       ChatMessage(messageContent: ["Please share your birth date"], messageType: "receiver"), //  6  ----> 6
       ChatMessage(messageContent: ["Please share your “Annual\nIncome”and“Occupation”."], messageType: "receiver"), //  18
       ChatMessage(messageContent: ["Please share your Name"], messageType: "receiver"), //  4  ----> 4
       ChatMessage(messageContent: ["Please share the name\nof your Father"], messageType: "receiver"), //  20 ----> 20
       ChatMessage(messageContent: ["Please share the name\nof the Nominee and your\nRelationship"], messageType: "receiver"), //  22 ----> 22
       ChatMessage(messageContent: ["We would like to know\nthe Pincode of the address\nyou reside at"], messageType: "receiver"), //  12 ----> 12
       ChatMessage(messageContent: ["We would like to know\nyour address"], messageType: "receiver"), //  8  ---->   8
       ChatMessage(messageContent: ["How many doses of the\nCoronavirus vaccine have\nyou taken?"], messageType: "receiver"), //  26
       ChatMessage(messageContent: ["Do you use nicotine\nproducts"], messageType: "receiver"), //  28
       ChatMessage(messageContent: ["Thank You"], messageType: "receiver"), //  30
   ];

  List vaccines = [
    {"title": "Dose 1", "isSelect": false},
    {"title": "Dose 2", "isSelect": false},
    {"title": "All three Doses", "isSelect": false},
    {"title": "None", "isSelect": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Get to know you',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
          iconSize: 30,
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              controller: controller,
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 70),
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                // print("index check -->>>>   ${index}");
                // print("message check -->>>>   ${messages.length}");
                indexStore = index;
                // listIndex.add(index);
                // print("Store index ------>>>>>  ${indexStore}");

                // if(index == 4){
                //   setState((){});
                // }

                return Column(
                  children: [
                    ...messages[index].messageContent.map((e) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Row(
                            children: [
                              // messages[index].messageType == "receiver"
                              //     ?
                              messages[index].messageContent.indexOf(e) == 0 &&
                                      messages[index].messageType == "receiver"
                                  ? Image.asset(
                                      roundChatBot,
                                      scale: 3.5,
                                    )
                                  : messages[index].messageType == "sender"
                                      ? Spacer()
                                      : SizedBox(
                                          width: Utils.getWidth(context) * 0.17,
                                        ),

                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        messages[index].messageType == "sender"
                                            ? 15
                                            : 0,
                                    right: messages[index].messageType ==
                                            "receiver"
                                        ? 15
                                        : 0),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 12, bottom: 12),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      messages[index].messageType == "receiver"
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(14),
                                              topRight: Radius.circular(14),
                                            )
                                          : BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(14),
                                              topLeft: Radius.circular(14),
                                            ),
                                  border: Border.all(
                                      color: messages[index].messageType ==
                                              "receiver"
                                          ? bordercolor
                                          : white,
                                      width: 1.5),
                                  gradient: LinearGradient(
                                      colors: messages[index].messageType ==
                                              "receiver"
                                          ? [white, white]
                                          : [
                                              blue.withOpacity(0.9),
                                              blue.withOpacity(0.2),
                                            ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? Colors.grey.shade200
                                          : Colors.blue[200]),
                                ),
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),

                              messages[index].messageContent.indexOf(e) == 0 &&
                                      messages[index].messageType == "sender"
                                  ? Container(
                                      child: Image.asset(
                                        youBotIcon,
                                        scale: 3.5,
                                      ),
                                    )
                                  : messages[index].messageType == "sender"
                                      ? SizedBox(
                                          width: Utils.getWidth(context) * 0.14,
                                        )
                                      : Container(),
                            ],
                          ),
                        ),
                      );
                    }).toList(),


                    if (index == 0) ...[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        margin: EdgeInsets.only(top: 8),
                        height: 36,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 1
                                    ? () {
                                        messages.add(ChatMessage(
                                            messageContent: ["Yes"],
                                            messageType: 'sender'));
                                        messages.add(messagesQustion[0]);
                                        setState(() {});
                                      }
                                    // : messages.length == 3
                                    // ? (){messages.add(ChatMessage(messageContent: ["Male"], messageType: 'sender'));}
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 1
                                    ? () {
                                        messages.add(ChatMessage(
                                            messageContent: ["Not Yes"],
                                            messageType: 'sender'));
                                        setState(() {
                                          navigationService.pop();
                                        });
                                      }
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Not Yes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    if (index == 2) ...[
                      messages.length == 3
                          ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        margin: EdgeInsets.only(top: 8),
                        height: 36,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 3
                                    ? () {

                                  messages.add(ChatMessage(
                                      messageContent: ["Yes"],
                                      messageType: 'sender'));
                                  messages.add(messagesQustion[1]);
                                  setState(() {});
                                }
                                // : messages.length == 3
                                // ? (){messages.add(ChatMessage(messageContent: ["Male"], messageType: 'sender'));}
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 3
                                    ? () {
                                  whNo = true;
                                  setState(() {});
                                }
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(),
                      whNo == true ? Gap(10) : Gap(0),
                      whNo == true ? Row(
                children: [
                SizedBox(
                width: Utils.getWidth(context) * 0.18,
                ),

                Container(
                margin: EdgeInsets.only(

                right:15),
                padding: EdgeInsets.only(
                left: 10, right: 10, top: 12, bottom: 12),
                decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomRight: Radius.circular(14),
                topRight: Radius.circular(14),
                ),


                border: Border.all(
                color:  bordercolor, width: 1.5),

                color: white,
                ),
                child: Text(
                "Share your WhatsApp number for\nbetter communication.",
                style: TextStyle(fontSize: 15),
                ),
                ),

                ],
                ) : Container(),
                      whNo == true ? Gap(10) : Gap(0),
                      messages.length == 3 && whNo == true
                          ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 60,
                          width: double.infinity,
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: blue),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    controller: chatController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 0, top: 0),
                                      hintText: "Enter Your WhatsApp No...",
                                      counterText: "",
                                      hintStyle: TextStyle(
                                          color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (chatController.text.isNotEmpty && chatController.text.length == 10) {
                                      messages.add(ChatMessage(
                                          messageContent: ["No",chatController.text],
                                          messageType: 'sender'));
                                      messages.add(messagesQustion[1]);
                                      setState(() {});
                                      chatController.clear();
                                      setState(() {});
                                    } else {
                                      displayToast(
                                          "Please Question the Ans.of(10 Digit)");
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(),


                    ],
                    if (index == 4) ...[
                      messages.length == 5
                          ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        margin: EdgeInsets.only(top: 8),
                        height: 36,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 5
                                    ? () {

                                  messages.add(ChatMessage(
                                      messageContent: ["Male"],
                                      messageType: 'sender'));
                                  messages.add(messagesQustion[2]);
                                  setState(() {});
                                }
                                // : messages.length == 3
                                // ? (){messages.add(ChatMessage(messageContent: ["Male"], messageType: 'sender'));}
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Male",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            Expanded(
                              child: InkWell(
                                onTap: messages.length == 5
                                    ? () {
                                  messages.add(ChatMessage(
                                      messageContent: ["Female"],
                                      messageType: 'sender'));
                                  messages.add(messagesQustion[2]);
                                  setState(() {});
                                }
                                    : () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Female",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(),
                    ],
                    if (index == 6) ...[
                      messages.length == 7  ?  Center(
                        child: InkWell(
                          onTap: messages.length == 7 ?() async {
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
                              formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print("Date   ----->>>>${formattedDate}");
                              messages.add(ChatMessage(messageContent: [formattedDate], messageType: 'sender'));
                              messages.add(messagesQustion[3]);
                              setState((){});
                            } else {
                              displayToast("Please Select Your Birth Date.");

                            }
                          } : (){},
                          child: Container(
                            alignment: Alignment.center,
                            height: 36,
                            width: Utils.getWidth(context) * 0.4,
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "yyyy-mm-dd",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                            ),
                          ),
                        ),
                      ) : Container(),
                    ],
                    if (index == 8) ...[

                      Gap(10),
                      Row(
                        children: [
                          Gap(16),
                          Expanded(
                            flex: 1,
                            child: CustomSelect(
                              isColorBox: true,
                              onChanged: messages.length == 9
                                  ? (val) {
                                inCome = val;
                                displayToast("Please Select Occupation");
                                print("yashu  ----->>>>${inCome}");
                              }
                                  : (st) {},
                              items: [
                                'Up to 2.9L',
                                '3L - 4.9L',
                                '5L - 7.9L',
                                '8L - 9.9L',
                                '10L - 19.9L',
                                "20L & Above"

                              ],
                              hint: 'Income',
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            flex: 1,
                            child: CustomSelect(
                              onChanged: messages.length == 9
                                  ? (val) {
                                occupation = val;
                                print("yashu  ----->>>>${occupation}");

                                if (inCome.isNotEmpty) {
                                  controller.jumpTo(Utils.getHeight(context) *2 +50);
                                  messages.add(ChatMessage(
                                      messageContent: [
                                        inCome,
                                        occupation
                                      ],
                                      messageType: 'sender'));
                                  messages.add(messagesQustion[4]);
                                  setState(() {});
                                } else {
                                  displayToast("Please select State");
                                }
                              }
                                  : (ci) {},
                              isColorBox: true,
                              items: [
                                'Salaried',
                                'Self-employed',
                                'Professional'
                              ],
                              hint: 'Occupation',
                            ),
                          ),
                          Gap(16),
                        ],
                      ),
                      messages.length == 9 ? Gap(200) : Gap(0),

                    ],
                    if (index == 10) ...[

                      messages.length == 11
                          ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 60,
                          width: double.infinity,
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: blue),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    controller: chatController,
                                    // keyboardType: TextInputType.number,
                                    // maxLength: 10,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 0, top: 0),
                                      hintText: "Enter Your Name...",
                                      counterText: "",
                                      hintStyle: TextStyle(
                                          color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (chatController.text.isNotEmpty) {
                                      messages.add(ChatMessage(
                                          messageContent: [chatController.text],
                                          messageType: 'sender'));
                                      messages.add(messagesQustion[5]);
                                      setState(() {});
                                      chatController.clear();
                                      setState(() {});
                                    } else {
                                      displayToast(
                                          "Please Question the Ans.of(10 Digit)");
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(),

                    ],
                    if (index == 12) ...[

                      messages.length == 13
                          ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 60,
                          width: double.infinity,
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: blue),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    controller: chatController,
                                    // keyboardType:TextInputType.number,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 0, top: 0),
                                      hintText: "Your Father Name...",
                                      hintStyle: TextStyle(
                                          color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (chatController.text.isNotEmpty) {
                                      messages.add(ChatMessage(
                                          messageContent: [
                                            chatController.text
                                          ],
                                          messageType: 'sender'));
                                      messages.add(messagesQustion[6]);
                                      chatController.clear();
                                      setState(() {});
                                    } else {
                                      displayToast(
                                          "Please Question the Ans.");
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(),

                    ],
                    if (index == 14) ...[

                      Gap(messages.length == 15 ? 6 :0),

                      messages.length == 15
                          ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 60,
                          width: double.infinity,
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: blue),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    enabled: nomineeReName == true ? false : true,
                                    controller: chatController,
                                    // keyboardType:TextInputType.number,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 0, top: 0),
                                      hintText: "Nominee Name...",
                                      hintStyle: TextStyle(
                                          color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: FloatingActionButton(
                                  onPressed: nomineeReName == false ? () {
                                    if (chatController.text.isNotEmpty) {
                                      nomineeReName = true;
                                      // messages.add(ChatMessage(
                                      //     messageContent: [
                                      //       chatController.text
                                      //     ],
                                      //     messageType: 'sender'));
                                      // messages.add(messagesQustion[11]);
                                      // chatController.clear();
                                      setState(() {});
                                    } else {
                                      displayToast(
                                          "Please Question the Ans.");
                                    }

                                    setState(() {});
                                  } : (){} ,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(),
                      Gap(messages.length == 15 ? 10 :0),
                      messages.length == 15 &&   nomineeReName == true
                          ? Row(
                        children: [
                          Expanded(flex: 2,child: Container()),
                          Expanded(
                            flex: 4,
                            child: CustomSelect(
                              isColorBox: true,
                              onChanged: messages.length == 15
                                  ? (val) {
                                nomineeRe = val;
                                print("yashu Patel ----");
                                print("yashu Patel222 ---- ${chatController.text}");
                                messages.add(ChatMessage(
                                    messageContent: [chatController.text,"${val}"],
                                    messageType: 'sender'));
                                chatController.clear();
                                messages.add(messagesQustion[7]);


                                setState((){});
                              }
                                  : (st) {},
                              items: ["Spouse","Father","Mother","Son","Daughter","Other"],
                              hint: 'Nominee Relationship',
                            ),
                          ),
                          Expanded(flex: 2,child: Container()),

                        ],
                      )  : Container(),
                      messages.length == 15 &&   nomineeReName == true ? Gap(200) : Gap(0),

                    ],
                    if (index == 16) ...[

                      messages.length == 17
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                height: 60,
                                width: double.infinity,
                                // color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: blue),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextFormField(
                                          controller: chatController,
                                          keyboardType: TextInputType.number,
                                          maxLength: 6,
                                          // keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText: "Enter Your Pincode No...",
                                            counterText: "",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          if (chatController.text.isNotEmpty && chatController.text.length == 6) {
                                            messages.add(ChatMessage(
                                                messageContent: [
                                                  chatController.text
                                                ],
                                                messageType: 'sender'));
                                            messages.add(messagesQustion[8]);
                                            chatController.clear();
                                            setState(() {});
                                          } else {
                                            displayToast(
                                                "Please Question the Ans.of(6 Digit)");
                                          }

                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                        backgroundColor: Colors.blue,
                                        elevation: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),



                      // messages.length == 17
                      //     ? Align(
                      //         alignment: Alignment.bottomLeft,
                      //         child: Container(
                      //           padding: EdgeInsets.only(
                      //             left: 5,
                      //           ),
                      //           // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      //           height: 60,
                      //           width: double.infinity,
                      //           // color: Colors.white,
                      //           child: Row(
                      //             children: <Widget>[
                      //               Expanded(
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     border: Border.all(color: blue),
                      //                     borderRadius:
                      //                         BorderRadius.circular(20),
                      //                   ),
                      //                   child: TextFormField(
                      //                     controller: chatController,
                      //                     // keyboardType:TextInputType.number,
                      //                     keyboardType: TextInputType.text,
                      //                     decoration: InputDecoration(
                      //                       contentPadding: EdgeInsets.only(
                      //                           left: 10, bottom: 0, top: 0),
                      //                       hintText: "Enter Your Email...",
                      //                       hintStyle: TextStyle(
                      //                           color: Colors.black54),
                      //                       border: InputBorder.none,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: const EdgeInsets.all(6.0),
                      //                 child: FloatingActionButton(
                      //                   onPressed: () {
                      //                     if (chatController.text.isNotEmpty) {
                      //                       controller.jumpTo(Utils.getHeight(context) *2);
                      //                       messages.add(ChatMessage(
                      //                           messageContent: [
                      //                             chatController.text
                      //                           ],
                      //                           messageType: 'sender'));
                      //                       messages.add(messagesQustion[8]);
                      //                       chatController.clear();
                      //                       setState(() {});
                      //                     } else {
                      //                       displayToast(
                      //                           "Please Question the Ans.");
                      //                     }
                      //
                      //                     setState(() {});
                      //                   },
                      //                   child: Icon(
                      //                     Icons.send,
                      //                     color: Colors.white,
                      //                     size: 22,
                      //                   ),
                      //                   backgroundColor: Colors.blue,
                      //                   elevation: 0,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                    if (index == 18) ...[

                      Gap(10),
                   messages.length == 19
                       ? HookConsumer(
                          builder: (context, ref, child) {
                            return Row(
                              children: [
                                Gap(16),
                                Expanded(
                                  flex: 1,
                                  child: CustomSelect(
                                    isColorBox: true,
                                    onChanged: messages.length == 19
                                        ? (val) async{
                                      statee = val;
                                      ReqCity cityData = ReqCity(state: "${statee}");
                                      displayToast("Select City");
                                      CityList.clear();
                                      ref.read(cityProvider.notifier).getCity(context: context, data: cityData)

                                          .then((value) {
                                        if(value!.status == 1){
                                          for(int i = 0; i < value.response.cities.length; i++ ){
                                            CityList.add(value.response.cities[i].name);
                                          }
                                        }else{
                                          displayToast("${value.message}");
                                        }
                                      });

                                        }
                                        : (st) {},
                                    items: stateList,
                                    // items: ["Gujarat","Rajasthan","Goa"],
                                    hint: 'State',
                                  ),
                                ),
                                Gap(10),
                                Expanded(
                                  flex: 1,
                                  child: CustomSelect(
                                    onChanged: messages.length == 19
                                        ? (val) {
                                      cityy = val;
                                      print("yashu  ----->>>>${statee}");

                                      if (statee.isNotEmpty) {
                                        address = true;
                                        setState(() {});
                                      } else {
                                        displayToast("Please select State");
                                      }
                                    }
                                        : (ci) { },
                                    isColorBox: true,
                                    items: CityList,
                                    // items: ['Ahmedabad', 'Surat', 'Amreli'],
                                    hint: 'City',
                                  ),
                                ),
                                Gap(16),
                              ],
                            );
                          }
                         )
                       : Container(),

                      Gap(address == true ? 10 : 180),

                      messages.length == 19 &&  address == true
                          ? Column(
                        children: [
                          Gap(10),
                          Row(
                            children: [
                              Gap(10),
                              Expanded(flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                      height: 45,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: blue),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      // color: Colors.white,
                                      child: TextFormField(
                                        controller: buildNoController,
                                        // keyboardType: TextInputType.number,
                                        // maxLength: 6,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 10, bottom: 0, top: 0),
                                          hintText: "Building No...",
                                          counterText: "",
                                          hintStyle: TextStyle(
                                              color: Colors.black54),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              Gap(10),
                              Expanded(flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(

                                      margin: EdgeInsets.only(left: 5,),
                                      // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                      height: 45,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: blue),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      // color: Colors.white,
                                      child: TextFormField(
                                        controller: flatNoController,
                                        // keyboardType: TextInputType.number,
                                        // maxLength: 6,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 10, bottom: 0, top: 0),
                                          hintText: "Flat/House No...",
                                          counterText: "",
                                          hintStyle: TextStyle(
                                              color: Colors.black54),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              Gap(10),
                            ],
                          ),
                          Gap(10),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              height: 60,
                              width: double.infinity,
                              // color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: blue),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: TextFormField(
                                        controller: chatController,
                                        // keyboardType: TextInputType.number,
                                        // maxLength: 6,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 10, bottom: 0, top: 0),
                                          hintText: "Enter Your Street...",
                                          counterText: "",
                                          hintStyle: TextStyle(
                                              color: Colors.black54),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        if (chatController.text.isNotEmpty) {
                                          if(buildNoController.text.isNotEmpty) {
                                            if(flatNoController.text.isNotEmpty) {
                                              messages.add(ChatMessage(
                                                  messageContent: [
                                                    "${flatNoController.text},${buildNoController.text}",
                                                    chatController.text,
                                                    statee , cityy ,
                                                  ],
                                                  messageType: 'sender'));
                                              messages.add(messagesQustion[9]);
                                              chatController.clear();
                                              buildNoController.clear();
                                              flatNoController.clear();
                                              setState(() {});
                                            }else{
                                              displayToast(
                                                  "Please Your Flat/House No.");
                                            }
                                          }else{
                                            displayToast(
                                                "Please Your Building No");
                                          }
                                        } else {
                                          displayToast(
                                              "Please Your Street");
                                        }

                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.send,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      backgroundColor: Colors.blue,
                                      elevation: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(10),
                        ],
                      )
                          : Container(),

                    ],
                    if (index == 20) ...[

                      ...vaccines.map((e) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Gap(Utils.getWidth(context) * 0.2),
                              InkWell(
                                  onTap: messages.length == 21
                                      ? () {

                                    controller.jumpTo(Utils.getHeight(context) * 3 + 10);


                                    e["isSelect"] = !e["isSelect"];

                                    int indexValue = vaccines.indexOf(e);
                                    print(
                                        "Dose Index in    -------->>>> ${vaccines.indexOf(e)}");
                                    print(
                                        "Dose Index in    -------->>>> ${vaccines[indexValue]["title"]}");
                                    messages.add(ChatMessage(
                                        messageContent: [
                                          "${vaccines[indexValue]["title"]}"
                                        ],
                                        messageType: 'sender'));
                                    messages.add(messagesQustion[10]);

                                    setState(() {});
                                  }
                                      : () {},
                                  child: Icon(
                                    e["isSelect"] == true
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: blue,
                                  )),
                              Gap(6),
                              Text(
                                e["title"],
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      })

                    ],
                    if (index == 22) ...[

                      Column(
                        children: [
                          Gap(10),
                          Row(
                            children: [
                              Gap(Utils.getWidth(context) * 0.2),
                              InkWell(
                                  onTap: messages.length == 23
                                      ? () {
                                    controller.jumpTo(Utils.getHeight(context) *3 +50);

                                    nicotineNo = true;

                                    messages.add(ChatMessage(
                                        messageContent: ["Yes"],
                                        messageType: 'sender'));
                                    messages.add(messagesQustion[11]);
                                    button = true;
                                    setState(() {});
                                  }
                                      : () {},
                                  child: Icon(
                                    nicotineNo == true
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: blue,
                                  )),
                              Gap(6),
                              Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Gap(10),
                          Row(
                            children: [
                              Gap(Utils.getWidth(context) * 0.2),
                              InkWell(
                                  onTap: messages.length == 23
                                      ? () {
                                    controller.jumpTo(Utils.getHeight(context) *3 +50);
                                    nicotineYes = true;

                                    messages.add(ChatMessage(
                                        messageContent: ["No"],
                                        messageType: 'sender'));
                                    messages.add(messagesQustion[11]);
                                    button = true;
                                    setState(() {});
                                  }
                                      : () {},
                                  child: Icon(
                                    nicotineYes == true
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: blue,
                                  )),
                              Gap(6),
                              Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Gap(10),
                        ],
                      ),

                    ],



                  ],
                );
              },
            ),


            ///  button redirect screen
            button == false
                ? Container()
                : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  title: continuee,
                  padding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  onTap: () {
                    print("plan ChatData : ${messages.toString()}");
                    print("plan ChatData : ${messages[5].messageContent}");

                    navigationService.push(routeChooseAssetMobile,
                        arguments: {navSpecificAssets: "PlanBot",navDashboardResponse: assetsData.response.specialities,navMessagesList: messages,navSelectedPlan: widget.selectedPlanCB});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///   New Chat screen 26/12/2022
class ChatMessage {
  List<String> messageContent;
  String messageType;

  ChatMessage({required this.messageContent, required this.messageType});
}
