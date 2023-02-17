import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/components.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';
import 'package:surakshakadi/widgets/loading.dart';
import 'package:video_player/video_player.dart';

class DashBoardWeb extends HookConsumerWidget {
   DashBoardWeb({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double spacing = 0;
    double runSpacing = 60;
    final video = useState<bool>(false);
    final isCheck = useState<bool>(true);
    final yearly = useState<bool>(true);
    final lifeTime = useState<bool>(false);

    ScrollController scrollController = ScrollController();
    final showbtn = useState<bool>(false) ;

    FlickManager? flickManager;

    useEffect(() {
      ref.read(dashboardProvider.notifier).getDashboard(context: context);

      flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.network("https://player.vimeo.com/external/474244488.sd.mp4?s=19273845afa857f08a67830a2ea84c369996efc2&profile_id=164&oauth2_token_id=57447761"),
      );
      ref.read(stateProvider.notifier).getState(context: context).then((value) {

        if (value!.status == 1) {

          for (int i = 0; i < value.response.states.length; i++) {

            stateList.add(value.response.states[i].name);
          }
        } else {
          displayToast("${value.message}");
        }
      });

    }, []);

    final dashboardController = ref.watch(dashboardProvider);
    final selectedindex = useState<int>(0);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return dashboardController.when(
        data: (data) {
          return Scaffold(
            key: scaffoldKey,
            // drawer: Drawer(
            //   backgroundColor: blue,
            // ),
            drawer: Custome_drawer_web(index: selectedindex.value, button: true),
            body: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbarWeb(index: 0,scaffoldkey: scaffoldKey,),
                  Gap(40),
                  LinkingLoved(),
                  Gap(40),
                  QuetionText(
                      boldName: whySur,
                      boldNameColor: buttonColor,
                      smallName: convenientEfficient,
                      smallNameColor: black),
                  Gap(40),
                  /// old video player
                  Center(
                    child: InkWell(
                      onTap: () {
                        video.value = true;
                        print("------------ video ${data.response.video}");
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.58,
                        margin: EdgeInsets.only(left: 30,right: 30),
                        child: video.value == true
                            ? Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: black, width: 1.5),
                          // ),
                              child: YoutubeVideoPlayer(
                                  videoUrl: data.response.video,
                                ),
                            )
                            : Container(
                          // height: MediaQuery.of(context).size.height / 1.58,
                          width: MediaQuery.of(context).size.width / 1.84,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: blue,
                            border: Border.all(color: black, width: 1.5),
                          ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Why Surakshakadi?',
                                      style: TextStyle(fontSize: 26),
                                    ),
                                    Gap(20),
                                    Icon(
                                      Icons.play_circle_outlined,
                                      size: 50,
                                      color: black,
                                    )
                                  ],
                                ),
                            ),
                      ),
                    ),
                  ),
                  /// new video player
                  // Center(
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height / 1.58,
                  //     width: 924,
                  //     child: FlickVideoPlayer(
                  //       flickManager: flickManager ?? FlickManager(videoPlayerController:  VideoPlayerController.network("https://player.vimeo.com/external/474244488.sd.mp4?s=19273845afa857f08a67830a2ea84c369996efc2&profile_id=164&oauth2_token_id=57447761"),),
                  //       wakelockEnabledFullscreen: true,
                  //       wakelockEnabled: true,
                  //       flickVideoWithControlsFullscreen: FlickVideoWithControls(
                  //         controls: FlickLandscapeControls(),
                  //       ),
                  //
                  //       flickVideoWithControls: FlickVideoWithControls(
                  //         videoFit: BoxFit.fill,
                  //         backgroundColor: Colors.black,
                  //
                  //         controls: VideoControl(
                  //           // dataManager: dataManager!,
                  //           iconSize: 30,
                  //           fontSize: 14,
                  //           progressBarSettings: FlickProgressBarSettings(
                  //             height: 5,
                  //             handleRadius: 5.5,
                  //           ),
                  //         ),
                  //       ),
                  //
                  //
                  //     ),
                  //   ),
                  // ),
                  Gap(50),
                  Center(
                      child: Text(
                    assetTransfer,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: black,
                    ),
                    textAlign: TextAlign.center,
                  )),
                  Gap(40),
                  Container(
                    color: dashAssetColor,
                    width: MediaQuery.of(context).size.width,
                    // height: 400,
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: QuetionText(
                              boldName: ourExpertise,
                              boldNameColor: buttonColor,
                              smallName: toHassleFree,
                              smallNameColor: black),
                        ),
                        Gap(52),
                        Wrap(
                          runSpacing: runSpacing,
                          spacing: spacing,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                              data.response.specialities.length, (index) {
                            var dataSpecialities =
                                data.response.specialities[index];

                            return Container(
                              // height:  230,
                              height: MediaQuery.of(context).size.height / 3.15 ,
                              width: Utils.getWidth(context) > 1350 ? 250 : 200,
                              margin: EdgeInsets.only(right: 16, left: 16),
                              padding: EdgeInsets.only(top: 20, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(int.parse("0xff${data.response.specialities[index].boxColor}")),
                                border: Border.all(color: navyblue, width: 1.5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xffC1CCE7),
                                      blurRadius: 3,
                                      offset: Offset(0.0, 7)),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.network(
                                      dataSpecialities.image,
                                      scale: 4,
                                    ),
                                  ),
                                  Gap(10),
                                  Center(
                                    child: Text(
                                      "${dataSpecialities.category}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: black,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  Gap(5),
                                  Container(
                                    // padding:
                                    //     EdgeInsets.only(left: 25, right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...dataSpecialities.specialities
                                            .map(
                                              (e) => Text(
                                                '• ${e.specilityTitle}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: black,
                                                  height: 1.3,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        Gap(56),
                      ],
                    ),
                  ),
                  Gap(80),
                  Center(
                    child: InkWell(
                      onTap: (){
                        navigationService.push(routePlansWeb);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(partnerBanner), fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                flatFeeNo,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              ),
                              Gap(20),
                              Text(
                                noEndlessLawyers,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Gap(20),
                              Text(
                                seeOuqPricing,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(80),
                  QuetionText(
                    boldName: ourExclusivePlans,
                    boldNameColor: buttonColor,
                    smallName: ourBestPlansFor,
                    smallNameColor: black,
                    // rightButton: true,
                    // onTap: () {},
                    // rightName: konwMore,
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          yearly.value = true;
                          if (yearly.value == true) {
                            lifeTime.value = false;
                            isCheck.value = true;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: Text(
                            "${data.response.plans[1].type}",

                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color:
                                    yearly.value == true ? navyblue : textColor,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 3.5,
                        color: oreng,
                      ),
                      InkWell(
                        onTap: () {
                          lifeTime.value = true;
                          if (lifeTime.value == true) {
                            yearly.value = false;
                            isCheck.value = false;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: Text(
                              "${data.response.plans[0].type}",

                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: lifeTime.value == true
                                    ? navyblue
                                    : textColor,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ...data.response.plans[1].plans.map((e) {
                      //
                      // })
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal:
                                    Utils.getWidth(context) < 750 ? 46 : 66),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              // data.plans![1].type ??
                              'Top Seller',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      Utils.getWidth(context) < 750 ? 12 : 19,
                                  color: white,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Gap(18),
                          InkWell(
                            onTap: () {
                              // navigationService.push(routeCustomeBottomNavigationBar,arguments: {navIndex: 1});
                              // planIndex = 0;
                              // print("${data.response.plans[0].plans[0].planType}");
                              // planIndexWeb = data.response.plans[0].plans.indexOf(e);

                              planTypeWeb = isCheck.value;

                              planIndexWeb = 0;

                              navigationService.push(routePlansWeb);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                // color: Color(int.parse(e.colour!)),
                                color: teal,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // e.title ??

                                    "${data.response.plans[0].plans[0].planTitle}",
                                    // 'SILVER',
                                    style: TextStyle(
                                      fontSize: Utils.getWidth(context) < 750
                                          ? 14
                                          : 26,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Gap(6),
                                  Container(
                                    height: 1.3,
                                    width: 80,
                                    color: black,
                                  ),
                                  Gap(9),
                                  Text(
                                    lifeTime.value == true
                                        ? "₹${data.response.plans[0].plans[0].offerPrice}/-"
                                        : "₹${data.response.plans[1].plans[0].offerPrice}/-",
                                    // yearly.value == true ? 'Rs 1499/-' : 'Rs 14999/-',
                                    style: TextStyle(
                                        fontSize: Utils.getWidth(context) < 750
                                            ? 13
                                            : 24,
                                        fontWeight: FontWeight.w700,
                                        color: black,
                                        letterSpacing: 0.5),
                                  ),
                                  Gap(6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // '${e.offer}% off' ??
                                        '50% off',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          color: black,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(
                                        lifeTime.value == true
                                            ? "₹${data.response.plans[0].plans[0].actualPrice}/-"
                                            : "₹${data.response.plans[1].plans[0].actualPrice}/-",

                                        // yearly.value == true
                                        //     ? 'Rs 2998/-'
                                        //     : 'Rs 29998/-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(Utils.getWidth(context) < 750 ? 10 : 16),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal:
                                    Utils.getWidth(context) < 750 ? 46 : 66),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: blue,
                              borderRadius: BorderRadius.circular(3),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xffD33E3E),
                                    Color(0xffFF9595),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Text(
                              'Top Seller',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      Utils.getWidth(context) < 750 ? 12 : 19,
                                  color: white,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Gap(18),
                          InkWell(
                            onTap: () {
                              // navigationService.push(routeCustomeBottomNavigationBar,arguments: {navIndex: 1});
                              // planIndex = 0;
                              // planIndexWeb = data.response.plans[1].plans.indexOf(e);

                              planTypeWeb = isCheck.value;
                              planIndexWeb = 1;

                              navigationService.push(routePlansWeb);
                            },
                            child: Container(
                              // height: 160,
                              // width: 250,
                              // margin: EdgeInsets.only(top: 10,right: 6),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),

                                // color: Color(int.parse(e.colour!)),
                                color: Color(0xff597EC8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${data.response.plans[0].plans[1].planTitle}",
                                    // 'GOLD',
                                    style: TextStyle(
                                      fontSize: Utils.getWidth(context) < 750
                                          ? 14
                                          : 26,
                                      // fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Gap(6),
                                  Container(
                                    height: 1.3,
                                    width: 80,
                                    color: black,
                                  ),
                                  Gap(9),
                                  Text(
                                    lifeTime.value == true
                                        ? "₹${data.response.plans[0].plans[1].offerPrice}/-"
                                        : "₹${data.response.plans[1].plans[1].offerPrice}/-",

                                    // yearly.value == true
                                    //     ? 'Rs 2499/-'
                                    //     : 'Rs 24999/-',
                                    style: TextStyle(
                                        fontSize: Utils.getWidth(context) < 750
                                            ? 13
                                            : 24,
                                        fontWeight: FontWeight.w700,
                                        color: black,
                                        letterSpacing: 0.5),
                                  ),
                                  Gap(6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // '${e.offer}% off' ??
                                        '50% off',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          color: black,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(
                                        lifeTime.value == true
                                            ? "₹${data.response.plans[0].plans[1].actualPrice}/-"
                                            : "₹${data.response.plans[1].plans[1].actualPrice}/-",

                                        // yearly.value == true
                                        //     ? 'Rs 4998/-'
                                        //     : 'Rs 49998/-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(Utils.getWidth(context) < 750 ? 10 : 16),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal:
                                    Utils.getWidth(context) < 750 ? 46 : 66),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: blue,
                              borderRadius: BorderRadius.circular(3),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xffD33E3E),
                                    Color(0xffFF9595),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Text(
                              // data.plans![1].type ??
                              'Value Pack',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      Utils.getWidth(context) < 750 ? 12 : 19,
                                  color: white,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Gap(18),
                          InkWell(
                            onTap: () {

                              // planIndex = 0;
                              // navigationService.push(
                              //     routeCustomBottomNavigationBar,
                              //     arguments: {navIndex: 1});
                              // planIndexWeb = data.response.plans[2].plans.indexOf(e);

                              planTypeWeb = isCheck.value;
                              planIndexWeb = 2;

                              navigationService.push(routePlansWeb);

                            },
                            child: Container(
                              // height: 160,
                              // width: 250,
                              // margin: EdgeInsets.only(top: 10,right: 6),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),

                                // color: Color(int.parse(e.colour!)),
                                color: lightyellow,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${data.response.plans[0].plans[2].planTitle}",
                                    // 'TITANIUM',
                                    style: TextStyle(
                                      fontSize: Utils.getWidth(context) < 750
                                          ? 14
                                          : 26,
                                      // fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Gap(6),
                                  Container(
                                    height: 1.3,
                                    width: 80,
                                    color: black,
                                  ),
                                  Gap(9),
                                  Text(
                                    lifeTime.value == true
                                        ? "₹${data.response.plans[0].plans[2].offerPrice}/-"
                                        : "₹${data.response.plans[1].plans[2].offerPrice}/-",

                                    // yearly.value == true
                                    //     ? 'Rs 3499/-'
                                    //     : 'Rs 34999/-',
                                    style: TextStyle(
                                        fontSize: Utils.getWidth(context) < 750
                                            ? 13
                                            : 24,
                                        // fontSize:  27,
                                        fontWeight: FontWeight.w700,
                                        color: black,
                                        letterSpacing: 0.5),
                                  ),
                                  Gap(6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // '${e.offer}% off' ??
                                        '50% off',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          // fontSize: 22,
                                          color: black,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(
                                        lifeTime.value == true
                                            ? "₹${data.response.plans[0].plans[2].actualPrice}/-"
                                            : "₹${data.response.plans[1].plans[2].actualPrice}/-",

                                        // yearly.value == true
                                        //     ? 'Rs 6998/-'
                                        //     : 'Rs 69998/-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Utils.getWidth(context) < 750
                                                  ? 11
                                                  : 20,
                                          // fontSize: 22,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(50),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 56),
                    // height: 800,
                    // height: MediaQuery.of(context).size.height * 0.900,
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
                          boldName: howItworks,
                          smallName: createUpdateAndManage,
                          boldNameColor: white,
                          smallNameColor: white,
                        ),
                        Gap(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customWidget(
                              context,
                              image: webDashOne,
                              description: selectSubsciptionplan,
                              number: '1',
                              boxChange: true,
                            ),
                            Gap(30),
                            customWidget(context,
                                image: webDashTwo,
                                boxChange: true,
                                description: shareBasicDetails,
                                number: '2'),
                            Gap(30),
                            customWidget(context,
                                image: checkList,
                                boxChange: true,
                                description: completeYourKYC,
                                number: '3'),
                            Gap(30),
                            customWidget(context,
                                image: kycc,
                                boxChange: true,
                                description: provideYourEstateplan,
                                number: '4'),
                          ],
                        ),
                        Gap(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customWidget(
                              context,
                              image: will,
                              description: readAndConfirm,
                              number: '5',
                              boxChange: true,
                            ),
                            Gap(30),
                            customWidget(context,
                                image: form,
                                boxChange: true,
                                description: secureYourLegacy,
                                number: '6'),
                            Gap(30),
                            customWidget(context,
                                image: printSign,
                                boxChange: true,
                                description: printAndSign,
                                number: '7'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    // height: MediaQuery.of(context).size.height * 0.900,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: dashAssetColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QuetionText(
                          boldName: getTheQuotation,
                          smallName: forSpecificAssetTransferService,
                          boldNameColor: buttonColor,
                          smallNameColor: black,
                        ),
                        Gap(30),
                        Center(
                          child: InkWell(
                            onTap: () {
                              /// Old Code
                              // List<ResponseSpeciality> dashboardResWeb = data.response.specialities ?? [];
                              List<ResponseSpeciality> dashboardResWeb = [];
                              dashboardResWeb
                                  .addAll(data.response.specialities);
                              navigationService.push(routeChooseAssetsWeb,
                                  arguments: {
                                    navRouteCA: "SpecificAsset",
                                    navDashboardResponseWeb: dashboardResWeb
                                  });
                            },
                            child: Container(
                              // alignment: Alignment.center,
                              // height: 75,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 13),
                              // height:
                              //     MediaQuery.of(context).size.height * 0.075,
                              // width: MediaQuery.of(context).size.width * 0.24,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      // spreadRadius: 0.0,
                                      offset: Offset(0.0, 3)),
                                ],
                              ),
                              child: Text(
                                "SELECT ASSET/s FROM HERE",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: navyblue),
                              ),
                            ),
                          ),
                        ),
                        Gap(30),
                        Center(
                          child: Text(
                            'Isn’t it Easy as 1-2-3?',
                            style: GoogleFonts.bonaNova(
                              textStyle: TextStyle(
                                  color: navyblue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35),
                            ),
                          ),
                        ),
                        Gap(60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customWidget(
                              context,
                              image: webDashOne,
                              description: selectAnAsset,
                              number: '1',
                              boxChange: true,
                            ),
                            Gap(30),
                            customWidget(context,
                                image: webDashTwo,
                                boxChange: true,
                                description: shareBasicDetailsAndPayNominalFees,
                                number: '2'),
                            Gap(30),
                            customWidget(context,
                                image: bill,
                                boxChange: true,
                                description: approveTheQuotation,
                                number: '3'),
                            Gap(30),
                            customWidget(context,
                                image: printSign,
                                boxChange: true,
                                description: payAndGetTheService,
                                number: '4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(16),
                  Container(
                    // padding: EdgeInsets.symmetric(vertical: 20),
                    // color: dashAssetColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QuetionText(
                            boldName: testimonials,
                            boldNameColor: buttonColor,
                            smallName: whatCustomers,
                            smallNameColor: black),
                        Gap(60),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          height: 110,
                          // width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.response.testimonials.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 40),
                                padding: EdgeInsets.only(left: 16, right: 16),
                                alignment: Alignment.center,
                                // height: 250,
                                width: 360,
                                decoration: BoxDecoration(
                                  // color: sky,
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(testimonialsBG),
                                    fit: BoxFit.fill,
                                    // scale: 4,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   width: Utils.getWidth(context) * 0.390,
                                    // ),
                                    Expanded(
                                      child: Text(
                                        "${data.response.testimonials[index].content}",
                                        // awesomeExperiance,
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: Utils.getWidth(context) * 0.03,
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(30),
                  AppSurakshakadi(),
                  Disclaimers(),
                  CustomWebBottomBar(bgColor: true),
                ],
              ),
            ),


            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                 mini: true,
                onPressed: () {
                  scrollController.animateTo( //go to top of scroll
                      0,  //scroll offset to go
                      duration: Duration(milliseconds: 1500), //duration of scroll
                      curve:Curves.fastLinearToSlowEaseIn
                  );
                },
                backgroundColor: blue,
                child: Icon(Icons.arrow_upward_outlined,color: white,),
              ),
            ),
          );
        },
        error: (obj, trace) => ErrorWidget(obj),
        loading: () => const Loading());

  }
}
