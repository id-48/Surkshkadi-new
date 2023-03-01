import 'package:flutter/Material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot/req_kyc_chatbot.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/kyc_chatbot_view_modal.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
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

import '../../../data/model/home/chatboat/kyc_chatbot/res_kyc_chatbot.dart';

class KYCChatBotMobile extends StatefulWidget {
  const KYCChatBotMobile({Key? key}) : super(key: key);

  @override
  State<KYCChatBotMobile> createState() => _KYCChatBotMobileState();
}

class _KYCChatBotMobileState extends State<KYCChatBotMobile> {
  TextEditingController chatController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  int indexStore = 0;
  int indexValue = -1;
  bool button = false;
  bool isTextField = false;
  bool isChildTextField = false;
  bool motherYes = false;
  bool motherNo = false;
  bool isIMaintain = false;
  bool isThisWill = false;
  bool dGranted = false;
  bool dPending = false;
  bool oneCheck = false;
  bool twoCheck = false;
  bool check = false;

  String statee = "";
  String cityy = "";
  int childrenCount = 0;
  String occupation = "";
  String formattedDate = "";
  List<int> listIndex = [];

  List<String> CityList = [];
  List<TextEditingController> nameCon = [];
  List<TextEditingController> ageCon = [];

  List<String> name = [];
  List<String> age = [];
  List<String> gender = [];

  List<String> childrenList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",];
  int childrenIndex = -1;


  List<ChatMessage> messages = [
    ChatMessage(messageContent: [
      "Hey ${getString(prefUserName)},\nI am SURAKSHA BOT.",
      "Thanks for providing your e-KYC\ndetails",
      "I appreciate that you are taking\nprotective steps for the\nwelfare of your family.",
      "Please confirm if you have\nregistered any will(s) previously\nwith the Sub-Registrar."
    ], messageType: "receiver"),
  ];


  ScrollController controller = ScrollController();
  List<ChatMessage> messagesQustion = [
/*0*/    ChatMessage(messageContent: ["Please share the name of\nyour Mother."], messageType: "receiver"), //  2
/*1*/    ChatMessage(messageContent: ["What is your marital status?"], messageType: "receiver"), //  4  ----> 4
/*2*/    ChatMessage(messageContent: ["Please share the name\nof the spouse?",], messageType: "receiver"), //  6
/*3*/    ChatMessage(messageContent: ["Please confirm the below\npointers."], messageType: "receiver"),      // 8
/*4*/    ChatMessage(messageContent: ["Please share how many\nchildren you have."], messageType: "receiver"), //  10 ----> 10
/*5*/    ChatMessage(messageContent: ["Can you share the Name, Age and\nGender of your child/children?"], messageType: "receiver"), //  12 ----> 12
/*6*/    ChatMessage(messageContent: ["Who is to be appointed as Trustee/\nGuardian of the trust set up\nfor minor beneficiaries?"], messageType: "receiver"), //  14 ----> 14
/*7*/    ChatMessage(messageContent: ["Thanks for confirming;\nplease attest to the\nbelow statement."], messageType: "receiver"), //  16
/*8*/    ChatMessage(messageContent: ["Thank You"], messageType: "receiver"), //  20
  ];

  List marital = [
    {"title": "Married", "isSelect": false},
    {"title": "Unmarried", "isSelect": false},
    {"title": "Separated", "isSelect": false}
  ];





  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        navigationService.push(routeCustomBottomNavigationBar);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            'Get to know you e-KYC',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              navigationService.push(routeCustomBottomNavigationBar);
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
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
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


                      if (index == 0) ...[
                       messages.length == 1 ? Container(
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
                                        messageContent: ["No"],
                                        messageType: 'sender'));
                                    setState(() {
                                      // navigationService.pop();
                                    });
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
                        ) : Container(),

                      ],
                      if (index == 2) ...[

                        messages.length == 3
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
                                        hintText: "Enter Your Mother Name...",
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

                                        controller.jumpTo(
                                            Utils.getHeight(context)
                                                 +
                                                200);

                                        messages.add(messagesQustion[1]);

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

                      if (index == 4) ...[
                        ...marital.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Gap(Utils.getWidth(context) * 0.2),
                                InkWell(
                                    onTap: messages.length == 5
                                        ? () {
                                      controller.jumpTo(
                                        Utils.getHeight(context)  +
                                            100);

                                      // controller.jumpTo(Utils.getHeight(context) * 3 + 10);


                                      e["isSelect"] = !e["isSelect"];

                                       indexValue = marital.indexOf(e);

                                      messages.add(ChatMessage(messageContent: ["${marital[indexValue]["title"]}"], messageType: 'sender'));
                                      messages.add( indexValue == 0 ? messagesQustion[2] : indexValue == 1 ? messagesQustion[6]  : messagesQustion[3]);

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
                      if (index == 6) ...[
                        messages.length != 7
                            ? Container()
                            : indexValue == 2
                            ? Column(
                          children: [
                            Gap(10),
                            Row(
                              children: [
                                Gap(Utils.getWidth(context) * 0.2),
                                InkWell(
                                    onTap: messages.length == 7 && dPending == false && dGranted == false
                                        ? () {
                                      dGranted = true;
                                      // messages.add(ChatMessage(
                                      //     messageContent: ["Divorce Granted"],
                                      //     messageType: 'sender'));
                                      // messages.add(messagesQustion[4]);
                                      setState(() {});
                                    }
                                        : () {},
                                    child: Icon(
                                      dGranted == true
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off,
                                      color: blue,
                                    )),
                                Gap(6),
                                Text(
                                  "Divorce Granted ",
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
                                    onTap: messages.length == 7 && dPending == false && dGranted == false
                                        ? () {
                                      // controller.jumpTo(Utils.getHeight(context) *3 +50);
                                      dPending = true;
                                      //
                                      // messages.add(ChatMessage(
                                      //     messageContent: ["Divorce Pending "],
                                      //     messageType: 'sender'));
                                      // messages.add(messagesQustion[4]);
                                      //
                                      setState(() {});
                                    }
                                        : () {},
                                    child: Icon(
                                      dPending == true
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off,
                                      color: blue,
                                    )),
                                Gap(6),
                                Text(
                                  "Divorce Pending ",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w500),
                                ),
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
                                          // keyboardType:TextInputType.number,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText: "Enter Your Spouse Name...",
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
                                          if(dGranted == true || dPending == true) {
                                            if (chatController.text.isNotEmpty) {
                                              messages.add(ChatMessage(
                                                  messageContent: [
                                                    chatController.text,
                                                    dGranted == true
                                                        ? "Divorce Granted"
                                                        : "Divorce Pending"

                                                  ],
                                                  messageType: 'sender'));
                                              controller.jumpTo(
                                                  Utils.getHeight(context) *
                                                      2 +
                                                      50);
                                              messages.add(messagesQustion[4]);
                                              chatController.clear();
                                              setState(() {});
                                            } else {
                                              displayToast(
                                                  "Please Question the Ans.");
                                            }
                                          }else {
                                            displayToast(
                                                "Please Select");
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
                          ],
                        )
                            : indexValue == 0
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
                                        hintText: "Enter Your Spouse Name...",
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
                                        controller.jumpTo(
                                            Utils.getHeight(context) *
                                                2 +
                                                50);
                                        messages.add(messagesQustion[4]);

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
                            : indexValue == 1
                            ? Column(
                               children: [
                                Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 16,right: 16
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
                                            hintText: "Enter Your Guardian Name...",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                                Gap(10),
                                Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 16,right: 16
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
                                          controller: relationController,
                                          // keyboardType:TextInputType.number,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText: "Enter Your Relationship...",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
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
                                          controller: addressController,
                                          // keyboardType:TextInputType.number,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 0, top: 0),
                                            hintText: "Enter Your Guardian Address...",
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
                                            if(relationController.text.isNotEmpty) {
                                              if(addressController.text.isNotEmpty) {
                                                messages.add(ChatMessage(
                                                    messageContent: [
                                                      chatController.text,relationController.text,addressController.text
                                                    ],
                                                    messageType: 'sender'));
                                                controller.jumpTo(
                                                    Utils.getHeight(context) *
                                                        2 +
                                                        50);
                                                messages.add(messagesQustion[7]);
                                                chatController.clear();
                                                relationController.clear();
                                                addressController.clear();
                                                setState(() {});
                                              }else{
                                                displayToast(
                                                    "Please Guardian Address");
                                              }
                                            }else{
                                              displayToast(
                                                  "Please Enter Your Relationship");
                                            }
                                          } else {
                                            displayToast(
                                                "Please Guardian Name.");
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
                               ],
                              )
                            : Container(),
                      ],
                      if (index == 8) ...[

                        if( indexValue == 1) ...[
                          Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == false ? () {
                                  oneCheck = !oneCheck;
                                  setState((){});
                                } : (){},
                                child: Container(
                                  height: 19,
                                  width: 20,
                                  // margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: oneCheck == true ? blue : white,
                                    // border: Border.all(color: blue),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Text("I appoint Surakshakadi Digital Estate Services Pvt. Ltd. as the sole executor of this Will or any competent person assigned through this company under their supervision to carry out the terms of my Will.",
                                  style: TextStyle(fontSize: 11, color: jerryColor),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == false ? () {
                                  twoCheck = !twoCheck;
                                  setState((){});
                                } : (){},
                                child: Container(
                                  height: 19,
                                  width: 20,
                                  // margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: blue),
                                    color: twoCheck == true ? blue : white,
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Text(
                                  "I authorize Surakshakadi Digital Estate Services Pvt. Ltd. to do a group term life insurance on my behalf and utilize the sum assured to execute the Will in my absence.",
                                  style: TextStyle(fontSize: 11, color: jerryColor),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == true ? (){} : () {

                                  if(oneCheck == true && twoCheck == true){
                                    check = true;
                                    controller.jumpTo(
                                        Utils.getHeight(context) *
                                            3 +
                                            50);
                                    messages.add(messagesQustion[8]);
                                    button = true;
                                  }else{
                                    displayToast("Please Select value");
                                  }

                                  setState((){});
                                },
                                child: Container(
                                  height: 19,
                                  width: 20,

                                  decoration: BoxDecoration(
                                    color: check == true ? blue : white,
                                    // border: Border.all(color: blue),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'I agree with the',
                                          style: TextStyle(fontSize: 11, color: jerryColor)),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: jerryColor,
                                            decoration: TextDecoration.underline
                                        ),),
                                      TextSpan(
                                          text: ' of the service',
                                          style: TextStyle(fontSize: 11, color: jerryColor)),

                                    ],
                                  ),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(20),
                        ]else if(messages.length == 9 ) ...[
                          Gap(10),
                          // Row(
                          //   children: [
                          //     Expanded(flex: 2,child: Container()),
                          //     Expanded(
                          //       flex: 4,
                          //       child: CustomSelect(
                          //         isColorBox: true,
                          //         onChanged: messages.length == 9
                          //             ? (val) {
                          //           childrenCount = int.parse(val);
                          //           print("yashu  ----->>>>${childrenCount.runtimeType}");
                          //           messages.add(ChatMessage(
                          //               messageContent: ["${val}"],
                          //               messageType: 'sender'));
                          //
                          //           messages.add(val == 0 ? messagesQustion[6] : messagesQustion[5]);
                          //
                          //           nameCon = List.generate(childrenCount, (index) => TextEditingController());
                          //           ageCon = List.generate(childrenCount, (index) => TextEditingController());
                          //
                          //           setState((){});
                          //         }
                          //             : (st) {},
                          //         items: ['0', '1', '2','3','4','5','6','7','8','9','10'],
                          //         hint: 'No. of Children',
                          //       ),
                          //     ),
                          //     Expanded(flex: 2,child: Container()),
                          //
                          //   ],
                          // ),
                          Row(
                            children: [
                              Expanded(flex: 2,child: Container()),
                              Expanded(
                                flex: 4,
                                child: CustomExpandTextCard(
                                  index: 0,
                                  isExpanded: ValueNotifier(1),
                                  boxcolor: blue,
                                  title: 'No. of Children',
                                  expandedChild: Card(
                                    elevation: 3,
                                    child: Container(
                                      height: 150,
                                      color: Colors.white.withOpacity(0.2),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: childrenList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap:  messages.length == 9
                                                ? () {
                                              controller.jumpTo(
                                                  Utils.getHeight(context) *
                                                      2 +
                                                      50);

                                              childrenCount = index;

                                              childrenCount = int.parse(childrenList[index]);
                                              // print("yashu  ----->>>>${childrenCount.runtimeType}");
                                              messages.add(ChatMessage(
                                                  messageContent: ["${childrenList[index]}"],
                                                  messageType: 'sender'));

                                              messages.add(childrenList[index] == 0 ? messagesQustion[6] : messagesQustion[5]);

                                              nameCon = List.generate(childrenCount, (index) => TextEditingController());
                                              ageCon = List.generate(childrenCount, (index) => TextEditingController());




                                              setState(() {});
                                            }
                                                : () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 15),
                                              child: Text(
                                                childrenList[index],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: childrenIndex == index
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
                              Expanded(flex: 2,child: Container()),

                            ],
                          ),
                          Gap(200),

                        ]

                      ],
                      if (index == 10 ) ...[

                       if(messages.length == 11 && childrenCount == 0) ...[
                         Column(
                           children: [
                             Align(
                               alignment: Alignment.bottomLeft,
                               child: Container(
                                 padding: EdgeInsets.only(
                                     left: 16,right: 16
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
                                             hintText: "Enter Your Guardian Name...",
                                             hintStyle: TextStyle(
                                                 color: Colors.black54),
                                             border: InputBorder.none,
                                           ),
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                             Gap(10),
                             Align(
                               alignment: Alignment.bottomLeft,
                               child: Container(
                                 padding: EdgeInsets.only(
                                     left: 16,right: 16
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
                                           controller: relationController,
                                           // keyboardType:TextInputType.number,
                                           keyboardType: TextInputType.text,
                                           decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(
                                                 left: 10, bottom: 0, top: 0),
                                             hintText: "Enter Your Relationship...",
                                             hintStyle: TextStyle(
                                                 color: Colors.black54),
                                             border: InputBorder.none,
                                           ),
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
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
                                           controller: addressController,
                                           // keyboardType:TextInputType.number,
                                           keyboardType: TextInputType.text,
                                           decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(
                                                 left: 10, bottom: 0, top: 0),
                                             hintText: "Enter Your Guardian Address...",
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
                                           controller.jumpTo(
                                               Utils.getHeight(context) *
                                                   2 +
                                                   50);
                                           if (chatController.text.isNotEmpty) {
                                             if(relationController.text.isNotEmpty) {
                                               if(addressController.text.isNotEmpty) {
                                                 messages.add(ChatMessage(
                                                     messageContent: [
                                                       chatController.text,relationController.text,addressController.text
                                                     ],
                                                     messageType: 'sender'));
                                                 controller.jumpTo(
                                                     Utils.getHeight(context) *
                                                         2 +
                                                         50);
                                                 messages.add(messagesQustion[7]);
                                                 chatController.clear();
                                                 relationController.clear();
                                                 addressController.clear();
                                                 setState(() {});
                                               }else{
                                                 displayToast(
                                                     "Please Guardian Address");
                                               }
                                             }else{
                                               displayToast(
                                                   "Please Enter Your Relationship");
                                             }
                                           } else {
                                             displayToast(
                                                 "Please Guardian Name.");
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
                           ],
                         )
                       ]else ...[
                        Gap(20),
                         Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: childrenCount,
                                  physics: NeverScrollableScrollPhysics(),
                                 itemBuilder:  (context,index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                        children: [
                                          Gap(14),
                                          Expanded(flex: 4,child: Container(
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: blue),
                                              borderRadius:
                                              BorderRadius.circular(7),
                                            ),
                                            child: TextFormField(
                                              enabled: isChildTextField == true ? false : true ,
                                              controller: nameCon[index],
                                              // keyboardType:TextInputType.number,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, bottom: 0, top: 0),
                                                hintText: "Name",
                                                hintStyle: TextStyle(color: black),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),),
                                          Gap(10),
                                          Expanded(flex: 2,child: Container(height: 44,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: blue),
                                              borderRadius:
                                              BorderRadius.circular(7),
                                            ),
                                            child: TextFormField(
                                              enabled: isChildTextField == true ? false : true ,
                                              controller: ageCon[index],
                                              keyboardType:TextInputType.number,
                                              maxLength: 2,
                                              // keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                counterText: '',
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, bottom: 0, top: 0),
                                                hintText: "Age",
                                                hintStyle: TextStyle(color: black),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),),
                                          Gap(10),
                                          Expanded(flex: 3,child: Container(

                                            child: CustomSelect(
                                              isColorBox: false,
                                              dropdownHeight: 110,
                                              // isRequired: ,
                                              onChanged: isChildTextField == false
                                                  ? (val) {
                                                if(ageCon[index].text.isNotEmpty) {
                                                  if(nameCon[index].text.isNotEmpty) {

                                                    if(index <= childrenCount ) {
                                                      // childMes.add(
                                                      //     ChildMessage(
                                                      //         name: "${nameCon[index].text}",
                                                      //         age: int.parse("${ageCon[index].text}"), gender: val)
                                                      // );

                                                      name.add(nameCon[index].text);
                                                      age.add(ageCon[index].text);
                                                      gender.add(val);

                                                      //
                                                      // for(var a in childMes){
                                                        print(childrenCount);
                                                        print(' test yashu 1---->${childrenCount}');
                                                        print("gender lenth 11 --${gender.length}");
                                                      //   print('test yashu ---->${a.age}');
                                                      //   print('test yashu ---->${a.gender}');
                                                      //   print('test yashu ---->${a.gender.isNotEmpty}');
                                                      //
                                                      // }
                                                      if (gender.length == childrenCount) {
                                                      // if (childMes[index].gender.isNotEmpty) {
                                                        print("gender lenth 22--${gender.length}");
                                                        // if(index == childrenCount - 1 ) {

                                                          messages.add(ChatMessage(
                                                              messageContent: ["Thanks"],
                                                              messageType: 'receiver'));
                                                          controller.jumpTo(
                                                              Utils.getHeight(context) *
                                                                  (childrenCount >= 5 ? 3 : 2) +
                                                                  50);
                                                          messages.add(messagesQustion[6]);

                                                          print("name child ----->>>> ${name}".replaceAll('[', '').replaceAll(']', ''));
                                                          print("age child ----->>>> ${age}".replaceAll('[', '').replaceAll(']', ''));
                                                          print("gender child ----->>>> ${gender}".replaceAll('[', '').replaceAll(']', ''));

                                                          isChildTextField = true;
                                                        // } else {
                                                        //   displayToast(
                                                        //       "Enter your child Gender");
                                                        // }
                                                      }else{
                                                        print("nulllllllll");
                                                      }

                                                    }else {
                                                      print("done");

                                                    }
                                                    ///
                                                    // messages.add(ChatMessage(
                                                    //     messageContent: [
                                                    //       "${nameController.text}",
                                                    //       "${ageController.text}",
                                                    //       "${val}"
                                                    //     ],
                                                    //     messageType: 'sender'));
                                                    // messages.add(messagesQustion[7]);
                                                    // nameController.clear();
                                                    // ageController.clear();
                                                    setState(() {});
                                                  } else {
                                                    displayToast(
                                                        "Please Enter your Child Name");
                                                  }
                                                }else{
                                                  displayToast(
                                                      "Please Enter your Child Age");
                                                }
                                              }
                                                  : (val) {},
                                              items: ['Male','Female',],
                                              hint: 'Gender',
                                            ),
                                          )),
                                          Gap(14),
                                        ],
                                       ),
                                  );
                                }
                              ),
                            ),
                        messages.length == 11 ? Gap(100) : Gap(0),
                        ],
                      ],
                      if(index == 12) ...[

                        if(childrenCount == 0)...[
                          Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == false ? () {
                                  oneCheck = !oneCheck;
                                  setState((){});
                                } : (){},
                                child: Container(
                                  height: 19,
                                  width: 20,
                                  // margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: oneCheck == true ? blue : white,
                                    // border: Border.all(color: blue),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Text("I appoint Surakshakadi Digital Estate Services Pvt. Ltd. as the sole executor of this Will or any competent person assigned through this company under their supervision to carry out the terms of my Will.",
                                  style: TextStyle(fontSize: 11, color: jerryColor),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == false ? () {
                                  twoCheck = !twoCheck;
                                  setState((){});
                                } : (){},
                                child: Container(
                                  height: 19,
                                  width: 20,
                                  // margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: blue),
                                    color: twoCheck == true ? blue : white,
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Text(
                                  "I authorize Surakshakadi Digital Estate Services Pvt. Ltd. to do a group term life insurance on my behalf and utilize the sum assured to execute the Will in my absence.",
                                  style: TextStyle(fontSize: 11, color: jerryColor),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(16),
                              InkWell(
                                onTap: check == true ? (){} : () {

                                  if(oneCheck == true && twoCheck == true){
                                    check = true;
                                    controller.jumpTo(
                                        Utils.getHeight(context) *
                                            3 +
                                            50);
                                    messages.add(messagesQustion[8]);
                                    button = true;
                                  }else{
                                    displayToast("Please Select value");
                                  }

                                  setState((){});
                                },
                                child: Container(
                                  height: 19,
                                  width: 20,

                                  decoration: BoxDecoration(
                                    color: check == true ? blue : white,
                                    // border: Border.all(color: blue),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'I agree with the',
                                          style: TextStyle(fontSize: 11, color: jerryColor)),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: jerryColor,
                                            decoration: TextDecoration.underline
                                        ),),
                                      TextSpan(
                                          text: ' of the service',
                                          style: TextStyle(fontSize: 11, color: jerryColor)),

                                    ],
                                  ),
                                ),
                              ),
                              Gap(16),
                            ],
                          ),
                          Gap(20),
                        ]else if(messages.length == 13)...[
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16,right: 16
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
                                              hintText: "Enter Your Guardian Name...",
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Gap(10),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16,right: 16
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
                                            controller: relationController,
                                            // keyboardType:TextInputType.number,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, bottom: 0, top: 0),
                                              hintText: "Enter Your Relationship...",
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
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
                                            controller: addressController,
                                            // keyboardType:TextInputType.number,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, bottom: 0, top: 0),
                                              hintText: "Enter Your Guardian Address...",
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
                                              if(relationController.text.isNotEmpty) {
                                                if(addressController.text.isNotEmpty) {
                                                  messages.add(ChatMessage(
                                                      messageContent: [
                                                        chatController.text,relationController.text,addressController.text
                                                      ],
                                                      messageType: 'sender'));
                                                  messages.add(messagesQustion[7]);
                                                  chatController.clear();
                                                  relationController.clear();
                                                  addressController.clear();
                                                  setState(() {});
                                                }else{
                                                  displayToast(
                                                      "Please Guardian Address");
                                                }
                                              }else{
                                                displayToast(
                                                    "Please Enter Your Relationship");
                                              }
                                            } else {
                                              displayToast(
                                                  "Please Guardian Name.");
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
                            ],
                          )
                        ]

                      ],
                      if(index == 14) ...[
                        Gap(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(16),
                            InkWell(
                              onTap: check == false ? () {
                                oneCheck = !oneCheck;
                                setState((){});
                              } : (){},
                              child: Container(
                                height: 19,
                                width: 20,
                                 // margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: oneCheck == true ? blue : white,
                                  // border: Border.all(color: blue),
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, //New
                                        blurRadius: 2.0,
                                        offset: Offset(0, 1))
                                  ],
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Gap(12),
                            Expanded(
                              child: Text("I appoint Surakshakadi Digital Estate Services Pvt. Ltd. as the sole executor of this Will or any competent person assigned through this company under their supervision to carry out the terms of my Will.",
                                  style: TextStyle(fontSize: 11, color: jerryColor),
                              ),
                            ),
                            Gap(16),
                          ],
                        ),
                        Gap(10),
                        Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(16),
                            InkWell(
                              onTap: check == false ? () {
                                twoCheck = !twoCheck;
                                setState((){});
                              } : (){},
                              child: Container(
                                height: 19,
                                width: 20,
                                // margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  // border: Border.all(color: blue),
                                color: twoCheck == true ? blue : white,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, //New
                                        blurRadius: 2.0,
                                        offset: Offset(0, 1))
                                  ],
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Gap(12),
                            Expanded(
                              child: Text(
                                  "I authorize Surakshakadi Digital Estate Services Pvt. Ltd. to do a group term life insurance on my behalf and utilize the sum assured to execute the Will in my absence.",
                                style: TextStyle(fontSize: 11, color: jerryColor),
                              ),
                            ),
                            Gap(16),
                          ],
                        ),
                        Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(16),
                            InkWell(
                              onTap: check == true ? (){} : () {

                                if(oneCheck == true && twoCheck == true){
                                  check = true;
                                  controller.jumpTo(
                                      Utils.getHeight(context) *
                                          3 +
                                          200);
                                  messages.add(messagesQustion[8]);
                                  button = true;
                                }else{
                                  displayToast("Please Select value");
                                }

                                setState((){});
                              },
                              child: Container(
                                height: 19,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: check == true ? blue : white,
                                  // border: Border.all(color: blue),
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, //New
                                        blurRadius: 2.0,
                                        offset: Offset(0, 1))
                                  ],
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Gap(12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'I agree with the ',
                                        style: TextStyle(fontSize: 11, color: jerryColor)),
                                    TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: jerryColor,
                                            decoration: TextDecoration.underline
                                        ),),
                                    TextSpan(
                                        text: ' of the service',
                                        style: TextStyle(fontSize: 11, color: jerryColor)),

                                  ],
                                ),
                              ),
                            ),
                            Gap(16),
                          ],
                        ),
                        Gap(20),
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
                  child: HookConsumer(
                    builder: (context,ref,child) {
                      return CustomButton(
                        title: continuee,
                        padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        onTap: () async{

                          ///     UnMarried     hoy tyare -----------

                          // print("plan ChatData --->>: ${messages.toString()}");
                          // print("plan ChatData 1: ${messages[1].messageContent[0]}");  // yes
                          // print("plan ChatData 3: ${messages[3].messageContent[0]}");  // test mother
                          // print("plan ChatData 5: ${messages[5].messageContent[0]}");  // separated        -- marital status
                          // print("plan ChatData 7: ${messages[7].messageContent[0]}  --- ${messages[7].messageContent[1]}  --- ${messages[7].messageContent[2]}");
                          // print("plan ChatData 9: ${messages[9].messageContent[0]}");


                          ///     Married  and  Separated  - child  hoy tyare   -----------

                          // print("plan ChatData --->>: ${messages.toString()}");
                          // print("plan ChatData 1: ${messages[1].messageContent[0]}");   // yes
                          // print("plan ChatData 3: ${messages[3].messageContent[0]}");   // test mother
                          // print("plan ChatData 5: ${messages[5].messageContent[0]}");   // separated        -- marital status
                          // print("plan ChatData 7: ${messages[7].messageContent[0]} -- ${messages[7].messageContent[1]}");    // divorce granted -- textField  --  status field --
                          // print("plan ChatData 9: ${messages[9].messageContent[0]}");    // 1
                          // print("plan ChatData 13: ${messages[13].messageContent[0]}  ----  ${messages[13].messageContent[1]}  --- ${messages[13].messageContent[1]} ");



                          ///     Married  and  Separated  - child no  hoy tyare   -----------

                          // print("plan ChatData --->>: ${messages.toString()}");
                          // print("plan ChatData 1: ${messages[1].messageContent[0]}"); // yes
                          // print("plan ChatData 3: "); // test mother
                          // print("plan ChatData 5: ${messages[5].messageContent[0]}"); // separated
                          // print("plan ChatData 7: ${messages[7].messageContent[0]} -- ${messages[7].messageContent[1]}");  // divorce granted -- textField
                          // print("plan ChatData 9: ${messages[9].messageContent[0]}");  // 0
                          // print("plan ChatData 11: ${messages[11].messageContent[0]}   ----  ${messages[11].messageContent[1]}  --- ${messages[11].messageContent[2]} "); //   <<---
                          // print("plan ChatData 13: ${messages[13].messageContent[0]}");




                          ReqKycChatBot  kycChatBotData = ReqKycChatBot(

                            userId:  getString(prefUserID),
                            subRegisterStatus: "${messages[1].messageContent[0]}",
                            motherName: "${messages[3].messageContent[0]}",
                            isMotherAlive: "Yes",
                            maritalStatus: "${messages[5].messageContent[0]}",
                            spouseName: messages[5].messageContent[0] == "Unmarried" ?  "" : "${messages[7].messageContent[0]}",
                            divorceStatus: messages[5].messageContent[0] == "Unmarried" ? "" : messages[5].messageContent[0] == "Married" ? ""  : messages[7].messageContent[1] ,
                            noOfChildren: "${messages[9].messageContent[0]}",
                            childName: name == [] ? "" : "${name}".replaceAll('[', '').replaceAll(']', ''),
                            childAge: age == [] ? "" : "${age}".replaceAll('[', '').replaceAll(']', ''),
                            childGender: gender == [] ? "" : "${gender}".replaceAll('[', '').replaceAll(']', ''),
                            minorBeneficiaryName: messages[5].messageContent[0] == "Unmarried" ? "${messages[7].messageContent[0]}" : childrenCount == 0 ? "${messages[11].messageContent[0]}" : "${messages[13].messageContent[0]}",
                            minorBeneficiaryRelation:  messages[5].messageContent[0] == "Unmarried" ? "${messages[7].messageContent[1]}" : childrenCount == 0 ? "${messages[11].messageContent[1]}" : "${messages[13].messageContent[1]}",
                            minorBeneficiaryAddress:  messages[5].messageContent[0] == "Unmarried" ? "${messages[7].messageContent[2]}" : childrenCount == 0 ? "${messages[11].messageContent[2]}" : "${messages[13].messageContent[2]}",
                            appointSurakshakadiStatus: "Accepted",
                            authorizeSurakshakadiStatus: "Accepted",
                            termsConditionStatus: "Accepted",
                          );

                          setString(prefMarriedSpouseName, messages[5].messageContent[0] == "Unmarried" ?  "" : "${messages[7].messageContent[0]}" );
                          setString(prefMotherName,"${messages[3].messageContent[0]}" );


                          print("total data --->>>  ${kycChatBotData.toJson()}");
                          await ref.read(kycChatBotProvider.notifier)
                              .kycChatBot(context: context, data: kycChatBotData)
                              .then((value) async {
                            if (value!.status == 1) {

                              // ResponseSCB sChatBot = value.response;

                              // setString( prefSecondChatBot,"${sChatBot}" );
                              setStringList(prefSecondChatBot, ["${value.response}"]);
                              displayToast(value.message.toString());
                              // navigationService.push(routeWillReview);
                              navigationService.push(routeSecondChatBotInformationEdit,arguments: {navMassageInfo : value.response ,navChildNameInfo :  name ,navChildCountInfo: childrenCount});

                             }else {
                              displayToast(value.message.toString());
                            }
                          });





                          // navigationService.push(routeWillReview);
                          ///
                          // navigationService.push(routeChooseAssetMobile,
                          //     arguments: {navSpecificAssets: "PlanBot",navDashboardResponse: assetsData.response!.specialities,navMessagesList: messages});
                        },
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



