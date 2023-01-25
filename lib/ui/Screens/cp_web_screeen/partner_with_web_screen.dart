import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/register_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/components.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class PartnerWithWeb extends HookConsumerWidget {
  const PartnerWithWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberController = useTextEditingController();
    final emailController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarWeb(index: 3),
            Gap(60),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                becomeASura,
                style: GoogleFonts.bonaNova(
                  textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                      wordSpacing: 1),
                ),
              ),
            ),
            Gap(30),
            Container(
              height: Utils.getHeight(context) * 0.64,
              width: Utils.getWidth(context),
              decoration: BoxDecoration(
                color: indigo,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 3))
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 70),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(50),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                  text: capitalizeOnTheAsset,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: white,
                                      fontSize: 22,
                                      letterSpacing: 1)),
                              TextSpan(
                                text: oneOfIndiaFirst,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                      fontSize: 21,
                                    letterSpacing: 1),
                              ),
                              TextSpan(
                                  text: ifYouCareAbout,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: white,
                                      fontSize: 22,
                                      letterSpacing: 1)),
                            ],
                          ),
                        ),

                        Gap(50),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterWeb()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12.withOpacity(0.2),
                                    blurRadius: 3.0,
                                    offset: Offset(0.0, 5))
                              ],
                            ),
                            child: Text(
                              joinUs,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: buttonColor),
                            ),
                          ),
                          // child: Container(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 8, horizontal: 35),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     color: oreng,
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.black12.withOpacity(0.2),
                          //           blurRadius: 3.0,
                          //           offset: Offset(0.0, 5))
                          //     ],
                          //   ),
                          //   child: Text(
                          //     konwMore,
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 22,
                          //         color: white),
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -200,
                    right: 50,
                    bottom: 120,
                    child: Container(
                      height: Utils.getHeight(context) * 0.67,
                      width: Utils.getWidth(context) * 0.54,
                      // color: black,
                      child: Image.asset(
                        partnerImage,
                        scale: 4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                partnerWithUs,
                style: GoogleFonts.bonaNova(
                  textStyle: TextStyle(
                      fontSize: 53,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      wordSpacing: 1),
                ),
              ),
            ),
            Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 65),
              height: 4,
              width: 180,
              color: oreng,
            ),
            Gap(34),
            Container(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kindlyStartYour,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w100,
                        color: black),
                  ),
                  Gap(30),
                  Container(
                    width: 360,
                    // width: MediaQuery.of(context).size.width * 0.24,
                    child: CustomTextfeild(
                      controller: numberController,
                      blurRadius: 0,
                      maxLines: 1,
                      maxLength: 10,
                      textCapitalization: TextCapitalization.none,
                      offset: Offset(0.0, 0.0),
                      containercolor: textFieldColor,
                      borderRadius: BorderRadius.circular(6),
                      // hinttext: emaill,
                      prefix: Image.asset(
                        callicon,
                        scale: 4,
                      ),
                      textInputType: TextInputType.number,
                    ),
                  ),
                  // Gap(16),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.24,
                  //   child: CustomTextfeild(
                  //     textCapitalization: TextCapitalization.none,
                  //     controller: emailController,
                  //     blurRadius: 0,
                  //     offset: Offset(0.0, 0.0),
                  //     containercolor: textFieldColor,
                  //     borderRadius: BorderRadius.circular(6),
                  //     // hinttext: emaill,
                  //     prefix: Image.asset(
                  //       mailicon,
                  //       scale: 4,
                  //     ),
                  //   ),
                  // ),
                  Gap(20),
                  Text(
                    anOtpWillBeSent,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black),
                  ),
                  Gap(26),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: oreng,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.2),
                                blurRadius: 3.0,
                                offset: Offset(0.0, 5))
                          ],
                        ),
                        child: Text(
                          sendOtp,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: white),
                        ),
                      ),
                      Gap(90),
                      Text(
                        reSend,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: black,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  Gap(40),
                  RichText(
                    text: TextSpan(
                      children: const <TextSpan>[
                        TextSpan(
                            text: alreadyHave,
                            style: TextStyle(
                                fontWeight: FontWeight.w100, color: black)),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: oreng,
                              fontSize: 16),
                        ),
                        TextSpan(
                            text: asPartner,
                            style: TextStyle(
                                fontWeight: FontWeight.w100, color: black)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(50),
            Container(
              padding: EdgeInsets.only(top: 28,bottom: 28),
              // height: 860,

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: blue,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4378B9),
                      Color(0xff1a4b85),
                      // Color(0xff1a4b85),
                      // Color(0xff1E2D3F),
                      Color(0xff4378B9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuetionText(
                    boldName: whyPartnerWithUs,
                    smallName: wealthTransfer,
                    boldNameColor: white,
                    smallNameColor: white,
                  ),

                  Gap(60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customWidget(
                        context,
                        image: money,
                        title: referralBonus,
                        description: earnForEveryConversion,
                        number: '1',
                        boxChange: false,
                      ),
                      Gap(30),
                      customWidget(context,
                          image: marketable,
                          title: marketableProducts,
                          boxChange: false,
                          description: aMostAccessible,
                          number: '2'),
                      Gap(30),
                      customWidget(context,
                          image: management,
                          boxChange: false,
                          title: eWillExecution,
                          description: earnHighlyLucrative,
                          number: '3'),
                      Gap(30),
                      customWidget(context,
                          image: dashboard,
                          title: partnerDashboard,
                          boxChange: false,
                          description: getVisibility,
                          number: '4'),
                    ],
                  ),
                  Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customWidget(
                        context,
                        image: training,
                        title: trainingAndHandover,
                        description: allPossibleHelp,
                        number: '5',
                        boxChange: false,
                      ),
                      Gap(30),
                      customWidget(context,
                          image: boss,
                          title: beYourBoss,
                          boxChange: false,
                          description: letUsContribute,
                          number: '6'),
                      Gap(30),
                      customWidget(context,
                          image: locker,
                          title: assetLocker,
                          boxChange: false,
                          description: securityIsPowered,
                          number: '7'),
                    ],
                  ),
                ],
              ),
            ),

            Disclaimers(),
            CustomWebBottomBar(
              bgColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
