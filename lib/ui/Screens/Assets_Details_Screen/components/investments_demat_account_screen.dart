import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_ppf_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/personal_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/personal_vehicle_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';


class InvestmentsDematAccount extends HookConsumerWidget {
  const InvestmentsDematAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final boxController = useTextEditingController();
    final messageController = useTextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        backonTap: () {
          Navigator.pop(context);
        },
        title: "${assetsInformation}",
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconText(context),

              header(context, image: investments, title: "Investments", description: "Demat Account"),

              Gap(16),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(pleaseShareTheDetailsDemat,style: TextStyle(fontWeight: FontWeight.w400,color: black ,fontSize: 12),)),
              Gap(10),

              expandRow(context,controller: boxController,title: "Demat Account No."),
              expandRow(context,controller: boxController,title: "DP Name"),
              expandRow(context,controller: boxController,title: "Joint Account Holder's Name (if any)"),
              expandRow(context,controller: boxController,title: "Bank name & Branch"),
              expandRow(context,controller: boxController,title: "IFSC Code"),
              expandRow(context,controller: boxController,title: "Nominee's Name (if any)"),

              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(noteItIsRecommended,style: TextStyle(fontWeight: FontWeight.w400,color: blue ,fontSize: 12),)),
              Gap(16),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(addAnother,style: TextStyle(fontWeight: FontWeight.w500,color: blueee ,fontSize: 12),)),
              Gap(10),

              assetsPhotoText(context,controller: messageController),

              Center(
                child: CustomButton(
                  title: continuee,
                  padding:
                  EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: () {
                    // navigationService.push(routeCustomeBottomNavigationBar,);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => GovernmentPPF()));
                  },
                ),
              ),
              SizedBox(
                height: Utils.getHeight(context) * 0.023,
              ),


            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: Utils.getHeight(context) * 0.08,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color(0xff037EEE).withOpacity(0.15),
      //         offset: const Offset(0.0, -3),
      //         blurRadius: 0.7,
      //         spreadRadius: 0.5,
      //       ), //BoxShadow
      //     ],
      //   ),
      //   child: Row(
      //     children: [
      //       Expanded(
      //           flex: 1,
      //           child: Container(
      //               alignment: Alignment.center,
      //               child: Text(
      //                 "Raise a ticket",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15,
      //                       color: blue)),
      //           )
      //       ),
      //       Expanded(
      //           flex: 1,
      //           child: HookConsumer(
      //             builder: (context, ref, child) {
      //               return InkWell(
      //                 onTap: ()  {
      //                   navigationService.push(routeCustomeBottomNavigationBar,);
      //                 },
      //                 child: Container(
      //                   height: Utils.getHeight(context) * 0.08,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     gradient: LinearGradient(
      //                       colors: [
      //                         Color(0xff3C87E0).withOpacity(0.9),
      //                         Color(0xff0E3563).withOpacity(0.9)
      //                       ],
      //                       begin: Alignment.topCenter,
      //                       end: Alignment.bottomCenter,
      //                     ),
      //                   ),
      //                   child: Text(
      //                     continuee,
      //                     style: TextStyle(
      //                         color: white,
      //                         fontWeight: FontWeight.w600,
      //                         letterSpacing: 0.5),
      //                   ),
      //                 ),
      //               );
      //             },
      //           )),
      //     ],
      //   ),
      // ),
    );
  }
}