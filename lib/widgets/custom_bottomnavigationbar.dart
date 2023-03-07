import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Account_Screen/account_screen.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/demo_screen/demo_help_screen.dart';
import 'package:surakshakadi/ui/Screens/drawer_item_screen/help_and_support_screen.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';

import '../utils/color_utils.dart';
import '../utils/constants/app_constant.dart';

class Custom_BottomNavigationBar extends HookConsumerWidget {
  final int index;

  const Custom_BottomNavigationBar({Key? key, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = useState<int>(index);

    void _onItemTapped(int index) {
      if(index != 2) {
        _selectedIndex.value = index;
        planIndex = 1;
      }else{
        navigationService.push(routeAccount);
      }
    }

    // useEffect((){
    //   _selectedIndex.value = index == null ? 0 : index ?? 0;
    // });
    return Scaffold(
      body: [
        DashBoard(),
        PlanScreen(),
        Account(),
        HelpAndSupport(),
        // Demo_Help_Screen(),
      ].elementAt(_selectedIndex.value),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff037EEE).withOpacity(0.15),
              offset: const Offset(0.0, -3),
              blurRadius: 0.7,
              spreadRadius: 0.5,
            ), //BoxShadow
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height:  60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          selectedItemColor: indigo,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(
            color: Colors.red,
          ),
          // fixedColor: Color(0xFF9B9B9B),

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(homeicon),
              label: 'Home',
              activeIcon: SvgPicture.asset(homecoloricon),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(plansicon),
              label: 'Plans',
              activeIcon: SvgPicture.asset(planscoloricon),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(accounticon),
              label: 'Account',
              activeIcon: SvgPicture.asset(accounticon,color: blue,),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(helpicon,color: _selectedIndex.value == 3 ? blue : black,),
              label: 'Help',
              // activeIcon: SvgPicture.asset(),
            ),
          ],

          onTap: _onItemTapped,
          currentIndex: _selectedIndex.value,
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            Color(0xff0085FF),
            Color(0xffFFFFFF),
          ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
        ),
        child: FloatingActionButton(
          elevation: 1,
          backgroundColor: Colors.white.withOpacity(0.5),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(chatboticon),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "ChatBot",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      color: Color(0xff5A5A5A)),
                ),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
