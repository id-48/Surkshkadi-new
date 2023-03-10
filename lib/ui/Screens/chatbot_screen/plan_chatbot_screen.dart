///                   New Chat demo Screen 26/12/2022                       ///

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:surakshakadi/data/model/home/chatboat/pincode_state_city/res_pincode_state_city.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
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
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_select.dart';

import '../../../utils/constants/validation.dart';
import 'pincode_state_city_view_model.dart';

class PlanChatBotMobile extends StatefulWidget {
  List<PlanModule> selectedPlanCB;
  PlanChatBotMobile({Key? key, required this.selectedPlanCB}) : super(key: key);

  @override
  State<PlanChatBotMobile> createState() => _PlanChatBotMobileState();
}

class _PlanChatBotMobileState extends State<PlanChatBotMobile> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  bool otherRel = false;
  bool fatherIsLive = false;

  String statee = "";
  String cityy = "";
  String inCome = "";
  String occupation = "";
  String formattedDate = "";
  String nomineeRe = "";
  List<int> listIndex = [];

  List<PostOffice> cityList = [];
  String age = '0';

  List<ChatMessage> messages = [
    ChatMessage(messageContent: [
      "Hi, I am SURAKSHA BOT.",
      "Thanks for choosing the\nsubscription plan",
      "I appreciate that you are taking\nproactive steps for the\nwelfare of your family.",
      "Is it your WhatsApp number?"
    ], messageType: "receiver"),
  ];
  ScrollController controller = ScrollController();
  List<ChatMessage> messagesQustion = [
    // ChatMessage(messageContent: ["Is it your WhatsApp number?."], messageType: "receiver"), //  14 ----> 14
    ChatMessage(
        messageContent: ["Which Gender do you most\nassociate with?."],
        messageType: "receiver"), //  2
    ChatMessage(
        messageContent: ["Please share your Birth Date."],
        messageType: "receiver"), //  6  ----> 6
    ChatMessage(
        messageContent: ["Please share your Annual\nIncome and Occupation."],
        messageType: "receiver"), //  18
    ChatMessage(
        messageContent: ["Please share your Full Name."],
        messageType: "receiver"), //  4  ----> 4
    ChatMessage(
        messageContent: ["Please share your Email."],
        messageType: "receiver"), //  4  ----> 4
    ChatMessage(
        messageContent: ["Please share the Full Name\nof your Father."],
        messageType: "receiver"), //  20 ----> 20
    ChatMessage(
        messageContent: ["Please share the Full Name\nof the Nominee."],
        messageType: "receiver"), //  22 ----> 22
    ChatMessage(messageContent: [
      "We would like to know the\nPincode of the Address\nyou reside at."
    ], messageType: "receiver"), //  12 ----> 12
    ChatMessage(
        messageContent: ["We would like to know your Address."],
        messageType: "receiver"), //  8  ---->   8
    ChatMessage(messageContent: [
      "How many Doses of the\nCoronavirus Vaccine have\nyou taken?"
    ], messageType: "receiver"), //  26
    ChatMessage(
        messageContent: ["Do you use Nicotine\nProducts"],
        messageType: "receiver"), //  28
    ChatMessage(messageContent: ["Thank You"], messageType: "receiver"), //  30
  ];

  List vaccines = [
    {"title": "One Dose", "isSelect": false},
    {"title": "both the doses", "isSelect": false},
    {"title": "all three doses", "isSelect": false},
    {"title": "None", "isSelect": false}
  ];

  List<String> incomeList = [
    'Up to 2.9L',
    '3L - 4.9L',
    '5L - 7.9L',
    '8L - 9.9L',
    '10L - 19.9L',
    "20L & Above"
  ];
  List<String> occupationList = [
    'Salaried',
    'Self-employed',
    'Professional',
    'Retired'
  ];
  List<String> nomineeList = [
    "Spouse",
    "Father",
    "Mother",
    "Son",
    "Daughter",
    "Other"
  ];
  int incomeIndex = -1;
  int occupationIndex = -1;
  int nomineeIndex = -1;
  int cityIndex = -1;

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
                indexStore = index;

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

                    // if (index == 0) ...[
                    //   Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 16),
                    //     margin: EdgeInsets.only(top: 8),
                    //     height: 36,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           child: InkWell(
                    //             onTap: messages.length == 1
                    //                 ? () {
                    //                     messages.add(ChatMessage(
                    //                         messageContent: ["Yes"],
                    //                         messageType: 'sender'));
                    //                     messages.add(messagesQustion[0]);
                    //                     setState(() {});
                    //                   }
                    //                 // : messages.length == 1
                    //                 // ? (){messages.add(ChatMessage(messageContent: ["Male"], messageType: 'sender'));}
                    //                 : () {},
                    //             child: Container(
                    //               alignment: Alignment.center,
                    //               decoration: BoxDecoration(
                    //                   color: blue,
                    //                   borderRadius: BorderRadius.circular(5)),
                    //               child: Text(
                    //                 "Yes",
                    //                 style: TextStyle(
                    //                     fontSize: 13,
                    //                     fontWeight: FontWeight.w500,
                    //                     color: white),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Gap(10),
                    //         Expanded(
                    //           child: InkWell(
                    //             onTap: messages.length == 1
                    //                 ? () {
                    //                     messages.add(ChatMessage(
                    //                         messageContent: ["Not Yes"],
                    //                         messageType: 'sender'));
                    //                     setState(() {
                    //                       navigationService.pop();
                    //                     });
                    //                   }
                    //                 : () {},
                    //             child: Container(
                    //               alignment: Alignment.center,
                    //               decoration: BoxDecoration(
                    //                   color: blue,
                    //                   borderRadius: BorderRadius.circular(5)),
                    //               child: Text(
                    //                 "Not Yes",
                    //                 style: TextStyle(
                    //                     fontSize: 13,
                    //                     fontWeight: FontWeight.w500,
                    //                     color: white),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   )
                    // ],

                    if (index == 0) ...[
                      messages.length == 1
                          ? Container(
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
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: blue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                              whNo = true;
                                              setState(() {});
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: blue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                      whNo == true
                          ? Row(
                              children: [
                                SizedBox(
                                  width: Utils.getWidth(context) * 0.18,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 12, bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    border: Border.all(
                                        color: bordercolor, width: 1.5),
                                    color: white,
                                  ),
                                  child: Text(
                                    "Share your WhatsApp number for\nbetter communication.",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      whNo == true ? Gap(10) : Gap(0),
                      messages.length == 1 && whNo == true
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

                                         inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+'))],
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          controller: chatController,
                                          maxLength: 10,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText:
                                                "Enter Your WhatsApp No...",
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
                                          if (chatController.text.isNotEmpty &&
                                              chatController.text.length ==
                                                  10) {
                                            messages.add(ChatMessage(
                                                messageContent: [
                                                  "No",
                                                  chatController.text
                                                ],
                                                messageType: 'sender'));
                                            messages.add(messagesQustion[0]);
                                            chatController.clear();
                                            setState(() {});
                                            // setState(() {});
                                          } else {
                                            displayToast(
                                                "This field is required. Please enter a value.");
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
                                                  messageContent: ["Male"],
                                                  messageType: 'sender'));
                                              messages.add(messagesQustion[1]);
                                              setState(() {});
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: blue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                      onTap: messages.length == 3
                                          ? () {
                                              messages.add(ChatMessage(
                                                  messageContent: ["Female"],
                                                  messageType: 'sender'));
                                              messages.add(messagesQustion[1]);
                                              setState(() {});
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: blue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                    if (index == 4) ...[
                      messages.length == 5
                          ? Center(
                              child: InkWell(
                                onTap: messages.length == 5
                                    ? () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1850),
                                          lastDate: DateTime(2200),
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: blue, // <-- SEE HERE
                                                  onPrimary:
                                                      white, // <-- SEE HERE
                                                  onSurface:
                                                      black, // <-- SEE HERE
                                                ),
                                                textButtonTheme:
                                                    TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    primary:
                                                        blue, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );

                                        if (pickedDate != null) {
                                          print(" $pickedDate");
                                          formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          age = calculateAge(pickedDate);
                                          messages.add(ChatMessage(
                                              messageContent: [formattedDate],
                                              messageType: 'sender'));
                                          messages.add(messagesQustion[2]);


                                          print("age in date 11 ----->>> ${age}");

                                          setString(prefAge, age);
                                          setState(() {});
                                        } else {
                                          displayToast(
                                              "Please Select Your Birth Date.");
                                        }
                                      }
                                    : () {},
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
                            )
                          : Container(),
                    ],
                    if (index == 6) ...[
                      Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(16),
                          Expanded(
                              flex: 1,
                              child: CustomExpandTextCard(
                                index: 0,
                                isExpanded: ValueNotifier(1),
                                boxcolor: blue,
                                title: incomeIndex == -1
                                    ? 'Income'
                                    : incomeList[incomeIndex],
                                expandedChild: Card(
                                  elevation: 3,
                                  child: Container(
                                    height: 150,
                                    color: Colors.white.withOpacity(0.2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: incomeList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: messages.length == 7
                                              ? () {
                                                  incomeIndex = index;

                                                  inCome =
                                                      incomeList[incomeIndex];
                                                  setState(() {});
                                                }
                                              : () {},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 15),
                                            child: Text(
                                              incomeList[index],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: incomeIndex == index
                                                      ? Colors.blue
                                                      : black),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )),
                          Gap(10),
                          Expanded(
                            flex: 1,
                            child: CustomExpandTextCard(
                              index: 0,
                              isExpanded: ValueNotifier(1),
                              boxcolor: blue,
                              title: occupationIndex == -1
                                  ? 'Occupation'
                                  : occupationList[occupationIndex],
                              expandedChild: Card(
                                elevation: 3,
                                child: Container(
                                  height: 150,
                                  color: Colors.white.withOpacity(0.2),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: occupationList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: messages.length == 7
                                            ? () {
                                                occupationIndex = index;

                                                if (inCome.isNotEmpty) {
                                                  controller.jumpTo(
                                                      Utils.getHeight(context) *
                                                              2 +
                                                          50);
                                                  messages.add(ChatMessage(
                                                      messageContent: [
                                                        inCome,
                                                        occupationList[index]
                                                      ],
                                                      messageType: 'sender'));
                                                  messages
                                                      .add(messagesQustion[3]);
                                                  setState(() {});
                                                }

                                                setState(() {});
                                              }
                                            : () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Text(
                                            occupationList[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: occupationIndex == index
                                                    ? Colors.blue
                                                    : black),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(16),
                        ],
                      ),
                    ],
                    if (index == 8) ...[
                      messages.length == 9
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
                                                messageContent: [
                                                  chatController.text
                                                ],
                                                messageType: 'sender'));
                                            messages.add(messagesQustion[4]);
                                            setState(() {});
                                            chatController.clear();
                                            setState(() {});
                                          } else {
                                            displayToast(
                                                "This field is required. Please enter a value.");
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

                    if (index == 10) ...[
                      messages.length == 11
                          ? Form(
                                 key: formKey ,
                            child: Align(
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
                                            autofillHints: [
                                              AutofillHints.email,
                                            ],
                                            controller: chatController,
                                            // keyboardType: TextInputType.number,
                                            // maxLength: 10,
                                            validator: (val) => Validation.emailValidation(val.toString()),
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, bottom: 0, top: 0),
                                              hintText: "Enter Your Email...",
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

                                            if (formKey.currentState!.validate()) {
                                              if (chatController.text
                                                  .isNotEmpty) {
                                                messages.add(ChatMessage(
                                                    messageContent: [
                                                      chatController.text
                                                    ],
                                                    messageType: 'sender'));
                                                messages.add(
                                                    messagesQustion[5]);
                                                setState(() {});
                                                chatController.clear();
                                                setState(() {});
                                              } else {
                                                displayToast(
                                                    "This field is required. Please enter a value.");
                                              }
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
                                          enabled: fatherIsLive == true ? false : true,
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
                                        onPressed:fatherIsLive == false ?  () {
                                          if (chatController.text.isNotEmpty) {

                                            fatherIsLive = true ;

                                            // messages.add(ChatMessage(
                                            //     messageContent: [
                                            //       chatController.text
                                            //     ],
                                            //     messageType: 'sender'));
                                            // messages.add(messagesQustion[6]);

                                            // chatController.clear();
                                            setState(() {});
                                          } else {
                                            displayToast(
                                                "This field is required. Please enter a value.");
                                          }

                                          setState(() {});
                                        } : (){},
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

                      fatherIsLive == true ? Gap(10) : Gap(0),

                      fatherIsLive == true
                          ? Row(
                        children: [
                          // Image.asset(
                          //   roundChatBot,
                          //   scale: 3.5,
                          // ),

                          SizedBox(
                            width: Utils.getWidth(context) * 0.18,
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(14),
                                topRight: Radius.circular(14),
                              ),
                              border: Border.all(
                                  color: bordercolor, width: 1.5),
                              color: white,
                            ),
                            child: Text(
                              "Is your Father alive?",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      )
                          : Container(),

                      if (messages.length == 13 && fatherIsLive == true ) ...[
                        Gap(10),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.only(top: 8),
                          height: 36,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: messages.length == 13
                                      ? () {

                                          setBool(prefFatherLive, true );
                                          messages.add(ChatMessage(
                                              messageContent: [chatController.text,"Yes"],
                                              messageType: 'sender'));
                                          messages.add(messagesQustion[6]);
                                          chatController.clear();
                                          setState(() {});
                                        }
                                      // : messages.length == 1
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
                                  onTap: messages.length == 13
                                      ? () {

                                    setBool(prefFatherLive, false);

                                    messages.add(ChatMessage(
                                              messageContent: [chatController.text,"No"],
                                              messageType: 'sender'));
                                          messages.add(messagesQustion[6]);
                                          chatController.clear();
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
                      ],
                    ],

                    if (index == 14) ...[
                      Gap(messages.length == 15 ? 6 : 0),
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
                                          enabled: nomineeReName == true
                                              ? false
                                              : true,
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
                                        onPressed: nomineeReName == false
                                            ? () {
                                                if (chatController
                                                    .text.isNotEmpty) {
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
                                                      "This field is required. Please enter a value.");
                                                }

                                                setState(() {});
                                              }
                                            : () {},
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
                      Gap(nomineeReName == true ? 10 : 0),
                      nomineeReName == true
                          ? Row(
                              children: [
                                // Image.asset(
                                //   roundChatBot,
                                //   scale: 3.5,
                                // ),

                                SizedBox(
                                  width: Utils.getWidth(context) * 0.18,
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 12, bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    border: Border.all(
                                        color: bordercolor, width: 1.5),
                                    color: white,
                                  ),
                                  child: Text(
                                    "What is your relationship\nwith the Nominee?",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            )
                          : Container(),

                      // Gap(messages.length == 15 ? 10 : 0),
                      // messages.length == 15 && nomineeReName == true
                      //     ? Row(
                      //         children: [
                      //           Expanded(flex: 2, child: Container()),
                      //           Expanded(
                      //             flex: 4,
                      //             child: CustomSelect(
                      //               isColorBox: true,
                      //               onChanged: messages.length == 15 &&
                      //                       otherRel == false
                      //                   ? (val) {
                      //                       nomineeRe = val;
                      //                       // print("yashu Patel ----");
                      //                       // print("yashu Patel222 ---- ${chatController.text}");
                      //
                      //                       if (val == "Other") {
                      //                         otherRel = true;
                      //                       } else {
                      //                         messages.add(ChatMessage(
                      //                             messageContent: [
                      //                               chatController.text,
                      //                               "${val}"
                      //                             ],
                      //                             messageType: 'sender'));
                      //                         chatController.clear();
                      //                         messages.add(messagesQustion[7]);
                      //                       }
                      //
                      //                       setState(() {});
                      //                     }
                      //                   : (st) {},
                      //               items: [
                      //                 "Spouse",
                      //                 "Father",
                      //                 "Mother",
                      //                 "Son",
                      //                 "Daughter",
                      //                 "Other"
                      //               ],
                      //               hint: 'Nominee Relationship',
                      //             ),
                      //           ),
                      //           Expanded(flex: 2, child: Container()),
                      //         ],
                      //       )
                      //     : Container(),


                      Gap(messages.length == 15 ? 20 : 0),
                      messages.length == 15 && nomineeReName == true
                          ? Row(
                              children: [
                                Expanded(flex: 2, child: Container()),
                                Expanded(
                                    flex: 4,
                                    child: CustomExpandTextCard(
                                      index: 0,
                                      isExpanded: ValueNotifier(1),
                                      boxcolor: blue,
                                      title: nomineeIndex == -1
                                          ? 'Nominee\nRelationship'
                                          : nomineeList[nomineeIndex],
                                      expandedChild: Card(
                                        elevation: 3,
                                        child: Container(
                                          height: 150,
                                          color: Colors.white.withOpacity(0.2),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: nomineeList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: messages.length == 15 &&
                                                    otherRel == false
                                                    ? () {
                                                  nomineeIndex = index;


                                                  if (nomineeList[index] == "Other") {
                                                    otherRel = true;
                                                  } else {
                                                    messages.add(ChatMessage(
                                                        messageContent: [
                                                          chatController.text,
                                                          nomineeList[index]
                                                        ],
                                                        messageType: 'sender'));
                                                    chatController.clear();
                                                    messages.add(messagesQustion[7]);
                                                  }


                                                  setState(() {});
                                                      }
                                                    : () {},
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                                  child: Text(
                                                    nomineeList[index],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                        nomineeIndex ==
                                                                    index
                                                                ? Colors.blue
                                                                : black),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(flex: 2, child: Container()),
                              ],
                            )
                          : Container(),

                      Gap(messages.length == 15 && otherRel == true ? 10 : 0),

                      messages.length == 15 && otherRel == true
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
                                          enabled: true,
                                          controller: buildNoController,
                                          // keyboardType:TextInputType.number,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText: "Nominee Relationship...",
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
                                            // nomineeReName = true;
                                            messages.add(ChatMessage(
                                                messageContent: [
                                                  chatController.text,
                                                  buildNoController.text
                                                ],
                                                messageType: 'sender'));
                                            messages.add(messagesQustion[7]);
                                            chatController.clear();
                                            buildNoController.clear();
                                            setState(() {});
                                          } else {
                                            displayToast(
                                                "This field is required. Please enter a value.");
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
                    if (index == 16) ...[
                      messages.length == 17
                          ? HookConsumer(
                            builder: (context, ref, child) {
                              return Align(
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
                                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+'))],
                                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                                              controller: chatController,
                                              maxLength: 6,
                                              // keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, bottom: 0, top: 0),
                                                hintText:
                                                    "Enter Your Pincode No...",
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
                                            onPressed: () async{
                                              if (chatController.text.isNotEmpty &&
                                                  chatController.text.length == 6) {

                                                // setString(prefPincode, chatController.text );

                                                await ref.read(pincodeSCProvider.notifier)
                                                    .getPincodeStateCity(context: context,pinCodeData: chatController.text).then((value){

                                                      if(value![0].status == "Success"){
                                                        cityList.clear();
                                                        statee = value[0].postOffice[0].state ;

                                                        // for (int i = 0; i < value!.length; i++) {
                                                          for(int j = 0; j< value[0].postOffice.length; j++ ){
                                                          cityList.add(value[0].postOffice[j]);
                                                        }
                                                        messages.add(ChatMessage(messageContent: [chatController.text], messageType: 'sender'));
                                                        messages.add(messagesQustion[8]);
                                                        chatController.clear();
                                                        setState(() {});
                                                      }else {
                                                        displayToast(value[0].message.toString());
                                                      }
                                                });



                                              } else {
                                                displayToast(
                                                    "This field is required. Please enter a value.");
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
                                );
                            }
                          )
                          : Container(),

                    ],
                    if (index == 18) ...[
                      Gap(10),
                      messages.length == 19
                          ? HookConsumer(builder: (context, ref, child) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(16),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 13),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text('$statee',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),),
                                    )
                                  ),
                                  Gap(10),
                                  Expanded(
                                    flex: 1,
                                    child: CustomExpandTextCard(
                                      index: 0,
                                      isExpanded: ValueNotifier(1),
                                      boxcolor: blue,
                                      title: cityIndex == -1
                                          ? 'locality'
                                          : cityList[cityIndex].name.toString(),
                                      expandedChild: Card(
                                        elevation: 3,
                                        child: Container(
                                          height: cityList.length == 2 ? 100 : 150,
                                          color: Colors.white.withOpacity(0.2),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: cityList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: messages.length == 19 && address == false
                                                    ? () {
                                                  cityIndex = index ;
                                                  cityy = cityList[index].name.toString();
                                                  address = true;
                                                  setState(() {});
                                                }
                                                    : () {},
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                                  child: Text(
                                                    cityList[index].name.toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                        nomineeIndex ==
                                                            index
                                                            ? Colors.blue
                                                            : black),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ),
                                  Gap(16),
                                ],
                              );
                            })
                          : Container(),

                      //HookConsumer(builder: (context, ref, child) {
                      //                               return Row(
                      //                                 children: [
                      //                                   Gap(16),
                      //                                   Expanded(
                      //                                     flex: 1,
                      //                                     child: CustomSelect(
                      //                                       isColorBox: true,
                      //                                       onChanged: messages.length == 19
                      //                                           ? (val) async {
                      //                                               statee = val;
                      //                                             }
                      //                                           : (st) {},
                      //                                       items: stateList,
                      //                                       // items: ["Gujarat","Rajasthan","Goa"],
                      //                                       hint: 'State',
                      //                                     ),
                      //                                   ),
                      //                                   Gap(10),
                      //                                   Expanded(
                      //                                     flex: 1,
                      //                                     child: CustomSelect(
                      //                                       onChanged: messages.length == 19
                      //                                           ? (val) {
                      //                                               cityy = val;
                      //                                               print(
                      //                                                   "yashu  ----->>>>${statee}");
                      //
                      //                                               if (statee.isNotEmpty) {
                      //                                                 address = true;
                      //                                                 setState(() {});
                      //                                               } else {
                      //                                                 displayToast(
                      //                                                     "Please select State");
                      //                                               }
                      //                                             }
                      //                                           : (ci) {},
                      //                                       isColorBox: true,
                      //                                       // items: CityList,
                      //                                       items: ['Ahmedabad', 'Surat', 'Amreli'],
                      //                                       hint: 'City',
                      //                                     ),
                      //                                   ),
                      //                                   Gap(16),
                      //                                 ],
                      //                               );
                      //                             })
                      Gap(address == true ? 10 : 180),
                      messages.length == 19 && address == true
                          ? Column(
                              children: [
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
                                                    left: 10,
                                                    bottom: 0,
                                                    top: 0),
                                                hintText:
                                                    "Enter Your Address...",
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
                                              if (chatController
                                                  .text.isNotEmpty) {

                                                    messages.add(ChatMessage(
                                                        messageContent: [
                                                          chatController.text,
                                                          cityy,
                                                          statee,
                                                        ],
                                                        messageType: 'sender'));
                                                    messages.add(
                                                        messagesQustion[9]);
                                                    chatController.clear();

                                                    setState(() {});

                                              } else {
                                                displayToast(
                                                    "Please share Your address");
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
                                          controller.jumpTo(
                                              Utils.getHeight(context) * 3 +
                                                  10);

                                          e["isSelect"] = !e["isSelect"];

                                          int indexValue = vaccines.indexOf(e);

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
                                          controller.jumpTo(
                                              Utils.getHeight(context) * 3 +
                                                  50);

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
                                          controller.jumpTo(
                                              Utils.getHeight(context) * 3 +
                                                  50);
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

                          print("age in date ----->>> ${age}");

                          setString(prefUserName, "${messages[9].messageContent[0]}");
                          setString(prefFatherName,"${messages[13].messageContent[0]}" );
                          setString(prefAddress,"${messages[19].messageContent[0]},${messages[19].messageContent[1]}" );
                          setString(prefOccupation, "${messages[7].messageContent[1]}");
                          setString(prefDOB,"${messages[5].messageContent[0]}");
                          setString(prefState, statee);
                          setString(prefCity, cityy);



                          navigationService
                              .push(routeChooseAssetMobile, arguments: {
                            navSpecificAssets: "PlanBot",
                            navDashboardResponse:
                                assetsData.response.specialities,
                            navMessagesList: messages,
                            navSelectedPlan: widget.selectedPlanCB
                          });
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


