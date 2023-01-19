import 'package:flutter/Material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/admin_Web_Clients.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/admin_Web_Dashboard.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/admin_Web_Rewards.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/admin_Web_Subscribed.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class AdminDashboard extends HookConsumerWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);

    print('Test Width --->${Utils.getWidth(context)}');

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppbarWeb(index: 3),
            Gap(50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Utils.getWidth(context) / 20,
                  ),
                  padding: EdgeInsets.only(
                    top: Utils.getHeight(context) / 20,
                    bottom: Utils.getHeight(context) / 20,
                    right: Utils.getWidth(context) > 830 ? 50 : 15,
                    left: Utils.getWidth(context) > 830 ? 30 : 15,
                  ),
                  height: 800,
                  width: Utils.getWidth(context) < 830 ? 80 : 280,
                  // width: Utils.getWidth(context) / 7,
                  // height: Utils.getHeight(context) / 1.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: gerywhite, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                            color: lavenderGrey,
                            // color: raven,
                            shape: BoxShape.circle,
                            border: Border.all(color:lavenderGrey,width: 4)
                        ),
                        child: Container(child: Image.asset(clientIcon,scale: 4,fit: BoxFit.contain,)),
                      ),




                      if (Utils.getWidth(context) > 830) ...[
                        Gap(10),
                        Container(
                          child: CustomText(
                              string: 'Karan Patel',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Gap(10),
                        // if (Utils.getWidth(context) > 930)
                        Container(
                          child: CustomText(
                              string: 'karanpatel3456@gmail.com',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Gap(40),
                      ] else ...[
                        Gap(40),
                      ],

                      /// Dashborad
                      GestureDetector(
                        onTap: () {
                          currentIndex.value = 0;
                        },
                        child: Utils.getWidth(context) > 830
                            ? Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 0
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 20, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        webAdminDashboad,
                                        scale: 4,
                                      ),
                                    ),
                                    Gap(30),
                                    Container(
                                      child: CustomText(
                                          string: 'Dashboard',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 0
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8, right: 8),
                                child: Container(
                                  child: Image.asset(
                                    webAdminDashboad,
                                    scale: 4,
                                  ),
                                ),
                              ),
                      ),
                      Gap(10),

                      /// Clients
                      GestureDetector(
                        onTap: () {
                          currentIndex.value = 1;
                        },
                        child: Utils.getWidth(context) > 830
                            ? Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 1
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 20, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        webAdminClient,
                                        scale: 4,
                                      ),
                                    ),
                                    Gap(30),
                                    if (Utils.getWidth(context) > 600)
                                      Container(
                                        child: CustomText(
                                            string: 'Clients',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 1
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8, right: 8),
                                child: Container(
                                  child: Image.asset(
                                    webAdminClient,
                                    scale: 4,
                                  ),
                                ),
                              ),
                      ),
                      Gap(10),

                      /// Subscribe
                      GestureDetector(
                        onTap: () {
                          currentIndex.value = 2;
                        },
                        child: Utils.getWidth(context) > 830
                            ? Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 2
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 20, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        webAdminWallet,
                                        scale: 4,
                                      ),
                                    ),
                                    Gap(30),
                                    if (Utils.getWidth(context) > 600)
                                      Container(
                                        child: CustomText(
                                            string: 'Subscribed',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 2
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8, right: 8),
                                child: Container(
                                  child: Image.asset(
                                    webAdminWallet,
                                    scale: 4,
                                  ),
                                ),
                              ),
                      ),
                      Gap(10),

                      /// Rewards
                      GestureDetector(
                        onTap: () {
                          currentIndex.value = 3;
                        },
                        child: Utils.getWidth(context) > 830
                            ? Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 3
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 20, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        webAdminRewards,
                                        scale: 4,
                                      ),
                                    ),
                                    Gap(30),
                                    if (Utils.getWidth(context) > 600)
                                      Container(
                                        child: CustomText(
                                            string: 'Rewards',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: currentIndex.value == 3
                                        ? lightNavyBlue
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8, right: 8),
                                child: Container(
                                  child: Image.asset(
                                    webAdminRewards,
                                    scale: 4,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 3,
                  child: currentIndex.value == 0
                      ? AdminWebDashBoard()
                      : currentIndex.value == 1
                          ? AdminWebClients()
                          : currentIndex.value == 2
                              ? AdminWebSubscribed()
                              : currentIndex.value == 3
                                  ? AdminWebRewards()
                                  : Container(),

                  ///
                  // child :PageView.builder(
                  //   controller: _pageController,
                  //   physics: NeverScrollableScrollPhysics(),
                  //
                  //   itemCount: children.length,
                  //   itemBuilder: (context, index) {
                  //     return children[index];
                  //   },
                  // )
                ),
              ],
            ),
            Gap(100),
            CustomWebBottomBar(bgColor: true),
          ],
        ),
      ),
    );
  }
}

CustomText(
    {required String string,
    required double fontSize,
    required FontWeight fontWeight,
    Color? color}) {
  return Text(
    string,
    style: GoogleFonts.inter(
        fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}
