import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/data/model/home/dashboard/share_application_links/req_share_application_links.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/dashboard/share_application_links_view_model.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/extensions/size_extension.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:video_player/video_player.dart';

class QuetionText extends HookWidget {
  final String boldName;
  final Color boldNameColor;
  final String smallName;
  final Color smallNameColor;
  final bool rightButton;
  final String? rightName;
  final Function()? onTap;

  const QuetionText(
      {Key? key,
      required this.boldName,
      required this.boldNameColor,
      required this.smallName,
      required this.smallNameColor,
      this.onTap,
      this.rightName,
      this.rightButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            boldName,
            style: GoogleFonts.bonaNova(
              textStyle: TextStyle(
                  color: boldNameColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            smallName,
            style: TextStyle(
                color: smallNameColor,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
          Gap(10),
          Container(
            height: 4,
            width: 180,
            color: oreng,
          ),
        ],
      ),
    );
  }
}

class AppSurakshakadi extends HookConsumerWidget {
  const AppSurakshakadi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useState<bool>(true);
    final phone = useState<bool>(false);
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();

    return Container(
      // width: MediaQuery.of(context).size.width,
      color: indigo,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Image.asset(
                dashwebmobile,
                height: 380,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                // color: redFroly,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTheSur,
                      style: GoogleFonts.bonaNova(
                        textStyle: TextStyle(
                            color: white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Gap(10),
                    Container(
                      height: 4,
                      width: 180,
                      color: oreng,
                    ),
                    Gap(30),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        weWillSendYou,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: white),
                      ),
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              email.value = true;
                              if (email.value == true) {
                                phone.value = false;
                              }
                            },
                            child: email.value == true
                                ? Icon(
                                    Icons.radio_button_checked_outlined,
                                    color: white,
                                  )
                                : Icon(
                                    Icons.radio_button_off,
                                    color: white,
                                  ),
                          ),
                          Gap(20),
                          Text(
                            emaill,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                          Gap(80),
                          InkWell(
                            onTap: () {
                              phone.value = true;
                              if (phone.value == true) {
                                email.value = false;
                              }
                            },
                            child: phone.value == true
                                ? Icon(
                                    Icons.radio_button_checked_outlined,
                                    color: white,
                                  )
                                : Icon(
                                    Icons.radio_button_off,
                                    color: white,
                                  ),
                          ),
                          Gap(20),
                          Text(
                            phonee,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Container(
                          // padding: EdgeInsets.only(left: 6),
                          margin: EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Color(0xff79ADEC)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.24,
                          child: CustomTextfeild(
                            contentPadding: EdgeInsets.only(left: 6),
                            textCapitalization: TextCapitalization.none,
                            controller: email.value == true
                                ? emailController
                                : phoneController,
                            blurRadius: 0,
                            offset: Offset(0.0, 0.0),
                            containercolor: white,
                            maxLength: email.value == true ? 50 : 10,
                            borderRadius: BorderRadius.circular(6),
                            hinttext: email.value == true ? emaill : phonee,
                            textInputType: email.value != true
                                ? TextInputType.number
                                : TextInputType.text,
                          ),
                        ),
                        Gap(20),
                        InkWell(
                          onTap: () async {
                            if (email.value == true) {
                              if (emailController.text.isNotEmpty) {
                                ReqShareApplicationLinks shareAppData =
                                    ReqShareApplicationLinks(
                                  email: emailController.text,
                                  mobile: "",
                                  sharingPlatform: "Email",
                                );

                                await ref
                                    .read(
                                        shareApplicationLinksProvider.notifier)
                                    .getShareApplicationLinks(
                                        context: context, data: shareAppData)
                                    .then((value) {
                                  if (value?.status == 1) {
                                    emailController.clear();
                                    phoneController.clear();
                                    displayToast("${value?.message}");
                                  } else {
                                    displayToast("${value?.message}");
                                  }
                                });
                              } else {
                                displayToast("Please Enter Your Email");
                              }
                            } else {
                              if (phoneController.text.isNotEmpty) {
                                if (phoneController.text.length == 10) {
                                  ReqShareApplicationLinks shareAppData =
                                      ReqShareApplicationLinks(
                                    email: "",
                                    mobile: phoneController.text,
                                    sharingPlatform: "SMS",
                                  );

                                  await ref
                                      .read(shareApplicationLinksProvider
                                          .notifier)
                                      .getShareApplicationLinks(
                                          context: context, data: shareAppData)
                                      .then((value) {
                                    if (value?.status == 1) {
                                      emailController.clear();
                                      phoneController.clear();
                                      displayToast("${value?.message}");
                                    } else {
                                      displayToast("${value?.message}");
                                    }
                                  });
                                } else {
                                  displayToast("Please Enter 10 Digit No.");
                                }
                              } else {
                                displayToast("Please Enter Your Mobile No.");
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            decoration: BoxDecoration(
                              color: oreng,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              shareAppLink,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        downloadAppFrom,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: white),
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Gap(6),
                        Container(
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 6),
                            child: Row(
                              children: [
                                Image.asset(googlePlay, scale: 16),
                                Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GET IT ON",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Google Play",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(20),
                        Container(
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 6),
                            child: Row(
                              children: [
                                Image.asset(
                                  appStore,
                                  scale: 16,
                                  color: Colors.white,
                                ),
                                Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Available on the",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "App Store",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Expanded  code completed LinkingLoved
// class LinkingLoved extends HookWidget {
//   const LinkingLoved({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Gap(250),
//
//             // Gap(30),
//             Container(
//               height: 400,
//               width: Utils.getWidth(context),
//               color: indigo,
//               // child: Stack(
//               //   clipBehavior: Clip.none,
//               //   children: [
//               //     Padding(
//               //       padding: const EdgeInsets.only(left: 70),
//               //       child: Column(
//               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           // Gap(Utils.getHeight(context) * 0.06),
//               //           Text(
//               //             weAreHereToHelp,
//               //             style: TextStyle(
//               //                 fontSize: 26,
//               //                 fontWeight: FontWeight.w400,
//               //                 color: white),
//               //           ),
//               //
//               //           Container(
//               //             padding:
//               //             EdgeInsets.symmetric(vertical: 10, horizontal: 35),
//               //             decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(25),
//               //               color: white,
//               //               boxShadow: [
//               //                 BoxShadow(
//               //                     color: Colors.black12.withOpacity(0.2),
//               //                     blurRadius: 3.0,
//               //                     offset: Offset(0.0, 5))
//               //               ],
//               //             ),
//               //             child: Text(
//               //               secureNow,
//               //               style: TextStyle(
//               //                   fontWeight: FontWeight.w600,
//               //                   fontSize: 18,
//               //                   color: buttonColor),
//               //             ),
//               //           ),
//               //
//               //           Gap(10),
//               //         ],
//               //       ),
//               //     ),
//               //     Positioned(
//               //       top: -260,
//               //       right: 50,
//               //       bottom: 60,
//               //       child: Container(
//               //         height: Utils.getHeight(context) * 0.7,
//               //         width: Utils.getWidth(context) * 0.54,
//               //         // color: black,
//               //         child: Image.asset(
//               //           webDashBanner,
//               //           scale: 4,
//               //           fit: BoxFit.fill,
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ),
//           ],
//         ),
//         Positioned(
//             // bottom: 80,
//             child: Row(
//           children: [
//             Gap(100),
//             Expanded(
//                 flex: 6,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       linkingYouAnd,
//                       style: GoogleFonts.bonaNova(
//                         textStyle: TextStyle(
//                             fontSize: 60,
//                             fontWeight: FontWeight.w700,
//                             letterSpacing: 3,
//                             wordSpacing: 1),
//                       ),
//                     ),
//                     Gap(150),
//                     Text(
//                       weAreHereToHelp,
//                       style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w400,
//                           color: white),
//                     ),
//                     Gap(50),
//                     Container(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 35),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12.withOpacity(0.2),
//                               blurRadius: 3.0,
//                               offset: Offset(0.0, 5))
//                         ],
//                       ),
//                       child: Text(
//                         secureNow,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: buttonColor),
//                       ),
//                     ),
//                   ],
//                 )),
//             Expanded(
//               flex: 6,
//               child: Container(
//                 height: Utils.getHeight(context) * 0.8,
//                 width: Utils.getWidth(context) * 0.54,
//                 // color: black,
//                 child: Image.asset(
//                   webDashBanner,
//                   scale: 4,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Gap(40),
//           ],
//         )),
//       ],
//     );
//   }
// }




/// Responsive   code LinkingLoved
class LinkingLoved extends HookWidget {
  const LinkingLoved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> indicators(Length, currentIndex) {
      return List<Widget>.generate(Length, (index) {
        return Container(
          margin: EdgeInsets.only(left: 6,right: 6),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? webPreparation : whiteindigo,
              shape: BoxShape.circle),
        );
      });
    }

    final dashTopData = useState<int>(0);

    List<Map<String,String>> sliderData = [

      {
        "boldName" : "LINKING YOU AND YOUR LOVED ONES",
        "description" : "We are here to help your loved ones every step of the way",
        "image" :webDashBannerOne
      },

      {
        "boldName" : "SECURE LEGAL DOCUMENTATION",
        "description" : "Faster inheritance with the master legal document built by Legal experts and you",
        "image" : webDashBannerTwo
      },

      {
        "boldName" : "SECURE WALLET OF ASSETS",
        "description" : "One place to store assets in safe & secure wallet",
        "image" : webDashBannerThree
      },

      {
        "boldName" : "HASSLE-FREE ASSETS TRANSFER",
        "description" : "Easy and affordable experience while transferring the assets from your name to their name",
        "image" : webDashBannerFour
      },


    ];


    return Column(
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(300),

                // Gap(30),
                Container(
                  height: Utils.getHeight(context) * 0.53,
                  // height: 400,
                  width: Utils.getWidth(context),
                  color: indigo,
                ),
              ],
            ),
            Positioned(
                // bottom: 80,
                // right: 50,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: sliderData.length,
                      itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return ResponsiveGridRow(
                      children: [
                        // Gap(100),
                        ResponsiveGridCol(lg: 1, md: 1, child: Container()),
                        ResponsiveGridCol(
                            lg: Utils.getWidth(context) < 1250 ? 9 : 5,
                            md: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(60),
                                Text(
                                  "${sliderData[itemIndex]["boldName"]}",
                                  style: GoogleFonts.bonaNova(
                                    textStyle: TextStyle(
                                        fontSize: 53,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                        wordSpacing: 1),
                                  ),
                                ),
                                Gap(180),
                                Text(
                                    "${sliderData[itemIndex]["description"]}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ],
                            )),
                        ResponsiveGridCol(
                            lg: Utils.getWidth(context) < 1250 ? 2 : 0,
                            md: 1,
                            child: Gap(50)),
                        ResponsiveGridCol(
                            lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                            md: 1,
                            child: Container()),

                        ResponsiveGridCol(
                          lg: Utils.getWidth(context) < 1250 ? 10 : 6,
                          md: 11,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40),

                            height: Utils.getHeight(context) * 0.8,
                            width: Utils.getWidth(context) * 0.54,
                            // color: black,
                            child: Image.asset(
                              "${sliderData[itemIndex]["image"]}",
                              scale: 4,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        ResponsiveGridCol(lg: 0, md: 0, child: Gap(50)),
                        // Gap(40),
                      ],
                    );
              },
              options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: Utils.getWidth(context) < 660 ?  0.42 : Utils.getWidth(context) < 930 ? 0.65 : Utils.getWidth(context) < 1250   ? 0.96 : Utils.getWidth(context) < 1540 ? 2.35 : Utils.getWidth(context) < 1650 ? 2.1 : Utils.getWidth(context) < 1800 ? 2.28 : 2.4,
                    initialPage: 1,
                    onPageChanged: (index, items) {
                      dashTopData.value = index;
                    },
              ),

            ),

                    // Gap(10),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(4, dashTopData.value)),

                  ],
                )),
          ],
        ),


      ],
    );
  }
}

///  About us Web
class GiveBackTo extends HookWidget {
  const GiveBackTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("test    ----->${MediaQuery.of(context).size.width}");

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(230),

            // Gap(30),
            Container(
              height: Utils.getHeight(context) * 0.60,
              width: Utils.getWidth(context),
              color: indigo,
            ),
          ],
        ),
        Positioned(
          // bottom: 80,
          // right: 50,
          child: ResponsiveGridRow(
            children: [
              // Gap(100),
              ResponsiveGridCol(lg: 0, md: 0, child: Gap(50)),
              ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 9 : 6,
                  md: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(60),
                      Text(
                        giveBackToYourLovedOnes,
                        style: GoogleFonts.bonaNova(
                          textStyle: TextStyle(
                              fontSize: 53,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3,
                              wordSpacing: 1),
                        ),
                      ),
                      Gap(160),
                      Text(
                        moneyIsNotTheOnlyCommodity,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: white),
                      ),
                      Gap(Utils.getWidth(context) < 1250 ? 50 : 0),
                    ],
                  )),
              ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 2 : 0,
                  md: 1,
                  child: Gap(40)),
              ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                  md: 1,
                  child: Container()),

              ResponsiveGridCol(
                lg: Utils.getWidth(context) < 1250 ? 10 : 6,
                md: 11,
                child: Container(
                  height: Utils.getHeight(context) * 0.76,
                  width: Utils.getWidth(context) * 0.52,
                  // color: black,
                  child: Image.asset(
                    aboutBanner,
                    scale: 4,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              ResponsiveGridCol(lg: 0, md: 0, child: Gap(40)),
              // Gap(40),
            ],
          ),
        ),
      ],
    );
  }
}

class Disclaimers extends HookWidget {
  const Disclaimers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40),
        Row(
          children: [
            // Gap(60),
            Expanded(
                flex: 1,
                child: Image.asset(
                  iconRight,
                  scale: 2,
                )),
            Gap(20),
            Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allLegalDocument,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: indigo),
                    ),
                    Gap(14),
                    Text(
                      noOneElse,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: indigo),
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Text(forMoreInformation,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: indigo,
                                fontSize: 18,
                                letterSpacing: 0.2)),
                        InkWell(
                          onTap: () {
                            navigationService.push(routeAboutUsWeb);
                          },
                          child: Text(
                            " " + faq + " ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: indigo,
                                fontSize: 18,
                                letterSpacing: 0.2),
                          ),
                        ),
                        Text(and + " ",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: indigo,
                                fontSize: 18,
                                letterSpacing: 0.2)),
                        InkWell(
                          onTap: () {
                            navigationService.push(routeLegalAll, arguments: {
                              navSecurityContent: "terms_conditions"
                            });
                          },
                          child: Text(termsAndConditions,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: indigo,
                                  fontSize: 18,
                                  letterSpacing: 0.2)),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
        Gap(40),
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            disclaimers,
            style: GoogleFonts.bonaNova(
              textStyle: TextStyle(
                  color: buttonColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Gap(10),
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Container(
            height: 4,
            width: 180,
            color: oreng,
          ),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 60),
          child: Text(
            theArticlesInformation,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: black,
                height: 1.5),
          ),
        ),
        Gap(40),
      ],
    );
  }
}

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YoutubeVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network("${widget.videoUrl}"
        // 'https://youtu.be/MvtPLoxf8SY'
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
        // "https://pagalsong.in/uploads/systemuploads/video/Simmba/Tere%20Bin%20-%20Simmba.mp4"

        )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                print('pause------>>>>>>>>>');
                _controller.pause();
                setState(() {});
              },
              // child: AspectRatio(
              //   aspectRatio: _controller.value.aspectRatio,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: VideoPlayer(_controller)),
              // ),
            ),
            if (context.isWeb) ...[
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0,
                  // left: 250,
                  // top: 120,
                  child: Container(
                    height: 30,
                    width: 30,
                    // color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      // height: 50,width: 50,
                      // color: Colors.blue,
                      child: Visibility(
                          visible: !_controller.value.isPlaying,
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                  )),
            ] else ...[
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0,
                  // left:  150,
                  // top: 70,
                  child: Container(
                    height: 30,
                    width: 30,
                    // color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      // height: 50,width: 50,
                      // color: Colors.blue,
                      child: Visibility(
                          visible: !_controller.value.isPlaying,
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: black,
                            size: 30,
                          )),
                    ),
                  )),
            ]
          ],
        ),
      ),
    );
  }
}

customWidget(
  context, {
  required String number,
  required String description,
  String? title,
  required String image,
  required bool boxChange,
}) {
  return Container(
    height: 250,
    // height: MediaQuery.of(context).size.height * 0.45,
    width: boxChange == true
        ? MediaQuery.of(context).size.width * 0.120
        : MediaQuery.of(context).size.width * 0.160,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Colors.black38,
            blurRadius: 4,
            spreadRadius: 0.0,
            offset: Offset(0.0, 4.5)),
      ],
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        boxChange == true
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      image,
                      scale: 5.3,
                    )),
                    Gap(30),
                    Text(description,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.clip),
                        textAlign: TextAlign.center),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(40),
                      Center(
                          child: Image.asset(
                        image,
                        scale: 5.3,
                      )),
                      Gap(16),
                      Text(title!,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                      Gap(6),
                      Text(description,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
        Positioned(
          top: -20,
          right: 0,
          left: 0,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: white,
            child: Text(
              number,
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    color: jerryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/// video plaer controls
class VideoControl extends StatefulWidget {
  const VideoControl({
    Key? key,
    this.iconSize = 20,
    this.fontSize = 12,
    this.progressBarSettings,
  }) : super(key: key);

  final double iconSize;

  final double fontSize;

  final FlickProgressBarSettings? progressBarSettings;

  @override
  State<VideoControl> createState() => _VideoControlState();
}

class _VideoControlState extends State<VideoControl> {
  bool demo = false;

  @override
  Widget build(BuildContext context) {
    return FlickShowControlsActionWeb(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: FlickAnimatedVolumeLevel(
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
                textStyle: TextStyle(color: Colors.white, fontSize: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
          Positioned.fill(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlickPlayToggle(size: 50),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: FlickAutoHideChild(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlickVideoProgressBar(
                      flickProgressBarSettings: widget.progressBarSettings,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlickPlayToggle(
                            size: widget.iconSize,
                          ),
                          SizedBox(
                            width: widget.iconSize / 2,
                          ),
                          FlickSoundToggle(
                            size: widget.iconSize,
                          ),
                          SizedBox(
                            width: widget.iconSize / 2,
                          ),
                          Row(
                            children: <Widget>[
                              FlickCurrentPosition(
                                fontSize: widget.fontSize,
                              ),
                              FlickAutoHideChild(
                                child: Text(
                                  ' / ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: widget.fontSize),
                                ),
                              ),
                              FlickTotalDuration(
                                fontSize: widget.fontSize,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          // FlickFullScreenToggle(
                          //   size: widget.iconSize,
                          //
                          //   // toggleFullscreen: (){
                          //   //
                          //   //   print("test Yashu  ${demo}");
                          //   //
                          //   //   if(demo == true){
                          //   //     print("test Yashu  iff ${demo}");
                          //   //
                          //   //     Navigator.pop(context);
                          //   //   }else {
                          //   //     print("test Yashu  else  ${demo}");
                          //   //
                          //   //   demo = true ;
                          //   //   }
                          //   //
                          //   //   setState((){});
                          //   //
                          //   // },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
