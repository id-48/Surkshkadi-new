import 'package:flutter/material.dart';

import '../../../data/model/home/dashboard/res_dashboard.dart';

const int tempProposalId = 32;

late Size screenSize;

bool isEnable = true;

void getScreenSize(BuildContext context) {
  screenSize = MediaQuery.of(context).size;
}

int? planIndex;
bool? planType;

int? planIndexWeb;
bool? planTypeWeb;

 late ResDashboard  assetsData;

 List<String>  stateList = [];

 var planChatBotSP ;

//AppBar size
const double kAppBarSize = 48.0;
const double kAppBarSizeTablet = 55.0;
const double appBarElevation = 4;

const double webRightSpace = 0.2;
const double webLeftSpace = 0.18;
const double webOpenDrawerSize = 0.13;
const double webCloseDrawerSize = 0.06;

//Divider
divider({endIndent = 18.0, indent = 18.0, height = 16.0}) {
  return Divider(
    height: height,
    thickness: 1,
    endIndent: endIndent,
    indent: indent,
  );
}
//
// isWeb(BuildContext context) {
//   return Utils.getWidth(context) > 1150;
// }

// Last Year
int lastYear = 50;

// Image Picked Quality
const int imageQuality = 50;

// Regex Pattern
const Pattern validEmailRegex =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const Pattern validPasswordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~%]).{8,32}$';
const Pattern validMobileRegex = r'(^(?:[+0]9)?[0-9]{10,12}$)';

List drawerItems = [
  // Draweritems(name: home, image: icMenu, index: 0),
  // Draweritems(name: trackApplication, image: icTrack, index: 1),
  // Draweritems(name: leadManagement, image: icLeads, index: 2),
  // Draweritems(name: faqs, image: icFaq, index: 3),
];

class UserTypes {
  static const String all = "all";
  static const String branch = "Branch";
  static const String wholesaler = "Wholesale";
  static const String customer = "Customer";
  static const String designer = "Designer";
  static const String production = "Production";
  static const String admin = "Admin";
  static const String reception = "Reception";
}

List<String> searchData = ['1', '2', '3', '4', '5', '6'];
