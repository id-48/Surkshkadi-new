import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';

class PlanBotWeb extends StatelessWidget {
  const PlanBotWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LogoBackButton(),

          Gap(300),

          GestureDetector(
            onTap: (){

              navigationService.push(routeChooseAssetsWeb,arguments: {navRouteCA: "SpecificAssetsNot",navDashboardResponseWeb: assetsData.response.specialities});

              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChooseAssetsWeb(routeCA: "PlanBot",)));

            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
              child:
              Text("Chat Bot Skip", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 2)),
              decoration: BoxDecoration(
                // color: blue,
                gradient: LinearGradient(
                    colors: [
                      Color(0xff3C87E0).withOpacity(0.9),
                      Color(0xff0E3563).withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    // spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  )
                ],

                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
