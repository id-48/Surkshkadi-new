import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
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
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/loading.dart';

class DeshBoard extends HookConsumerWidget {
  const DeshBoard({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final videoUrl = useState<String>("");
    // final index = useState<int>(0);
    // final StateList = useState<List<String>>([]);

    final dashboardController = ref.watch(dashboardProvider);
    // final planDashboardController = ref.watch(plansProvider);

    useEffect(() {
      ref.read(stateProvider.notifier).getState(context: context).then((value) {
        print("Yashu Patel");
        if (value!.status == 1) {
          print("Yashu Patel111111");
          for (int i = 0; i < value.response.states.length; i++) {
            print("Yashu Patel22222");
            stateList.add(value.response.states[i].name);
          }
        } else {
          displayToast("${value.message}");
        }
      });

      ref.read(dashboardProvider.notifier).getDashboard(context: context);
      return null;
    }, []);

    List<Widget> indicators(Length, currentIndex) {
      return List<Widget>.generate(Length, (index) {
        return Container(
          margin: EdgeInsets.all(3),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: currentIndex == index ? indigo : whiteindigo,
              shape: BoxShape.circle),
        );
      });
    }

    final assetsindex = useState<int>(0);
    // final currentIndex = useState<int>(0);
    final textIndex = useState<int>(0);
    final video = useState<bool>(false);
    final isCheck = useState<bool>(true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: dashboardController.when(
          data: (data) {

            return Scaffold(
              appBar: AppBar(
                  elevation: 1,
                  backgroundColor: gerywhite,
                  leading: GestureDetector(
                    onTap: () {
                      navigationService.push(routeCustomeDrawer);
                    },
                    child: Icon(
                      Icons.menu, color: black, // add custom icons also
                    ),
                  ),
                  actions: <Widget>[
                    SizedBox(
                      width: Utils.getHeight(context) * 0.05,
                    ),
                    Image.asset(
                      icLogo,
                      scale: 7,
                    ),
                    Spacer(),
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.notifications_none,
                            color: black,
                            size: 26.0,
                          ),
                        )),
                  ]),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: h*0.15,
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  congratulations,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: navyblue),
                                ),
                                Text(
                                  exclusiveMember,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(15),
                      InkWell(
                        onTap: () {
                          video.value = true;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 180,
                          width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: indigo,
                          ),
                          child: video.value == true
                              ? YoutubeVideoPlayer(
                                  videoUrl: data.response.video,
                                )
                              : Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          dashbanner,
                                          width: Utils.getWidth(context),
                                          fit: BoxFit.fitWidth,
                                        )),
                                    Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Icon(
                                          Icons.play_circle_outlined,
                                          size: 50,
                                          color: white,
                                        )),
                                  ],
                                ),
                        ),
                      ),
                      Gap(18),
                      Text(
                        ourSpeciality,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: navyblue),
                      ),
                      Gap(5),
                      Text(
                        transferAllAssets,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: black),
                      ),
                      Gap(15),
                      CarouselSlider.builder(
                        itemCount: data.response.specialities.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var specialitiesData =
                              data.response.specialities[itemIndex];

                          return Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 190,
                                  width: Utils.getWidth(context) * 0.415,
                                  margin: EdgeInsets.only(
                                      right: Utils.getWidth(context) * 0.02,
                                      left: Utils.getWidth(context) * 0.02),
                                  padding: EdgeInsets.only(top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: whiteindigo,
                                    color: Color(int.parse("0xff${specialitiesData.boxColor}")),
                                  ),
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          specialitiesData.image,
                                          scale: 3.5,
                                        ),
                                      ),
                                      Gap(4),
                                      Center(
                                        child: Text(
                                          specialitiesData.category,
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
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ...specialitiesData.specialities
                                                .map(
                                                  (e) => Text(
                                                    '• ${e.specilityTitle}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.5,
                          aspectRatio: 1.7,
                          initialPage: 2,
                          onPageChanged: (index, items) {
                            assetsindex.value = index;
                          },
                        ),
                      ),
                      Gap(10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicators(
                              data.response.specialities.length,
                              assetsindex.value)),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              ourBestPlans,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, color: navyblue),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigationService.push(
                                  routeCustomeBottomNavigationBar,
                                  arguments: {navIndex: 1});

                              planIndex = 1;
                            },
                            child: Container(
                              child: Text(
                                konwMore,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: oreng),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              isCheck.value = true;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              child: Text(
                                "${data.response.plans[1].type}",

                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,fontFamily: fontFamily,
                                    color: isCheck.value == true
                                        ? navyblue : textColor),
                              ),
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 3,
                            color: oreng,
                          ),
                          InkWell(
                            onTap: () {
                              isCheck.value = false;
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),

                              child: Text(
                                "${data.response.plans[0].type}",

                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,fontFamily: fontFamily,
                                    color: isCheck.value == false
                                        ? navyblue : textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Container(
                        height: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 70,
                              color: white,
                            ),
                            Container(
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(2.5),
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
                                'Top Seller',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 7.5,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                            Container(
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: blue,
                                borderRadius: BorderRadius.circular(2.5),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffD33E3E),
                                      Color(0xffFF9595),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Text(
                                // data.plans![2].type ??
                                'Value Pack',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 7.5,
                                    color: white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(2),
                      isCheck.value == true
                          ? Row(
                              children: [
                                ...data.response.plans[1].plans.map((e) {
                                  return Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        navigationService.push(
                                            routeCustomeBottomNavigationBar,
                                            arguments: {navIndex: 1});
                                        planIndex = data.response.plans[1].plans
                                            .indexOf(e);
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, right: 5),
                                        padding: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: lightyellowtwo,
                                          // color: Color(int.parse(e.colour!)),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              e.planTitle,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.5),
                                            ),
                                            Gap(3),
                                            Container(
                                              height: 1.1,
                                              width: 40,
                                              color: black,
                                            ),
                                            Gap(3),
                                            Text(
                                              'RS ${e.offerPrice}/-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: black,
                                                  letterSpacing: 0.5),
                                            ),
                                            Gap(5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '50% off',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color: black,
                                                  ),
                                                ),
                                                Gap(2),
                                                Text(
                                                  'RS ${e.actualPrice}/-',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gap(5),
                                            // Text(
                                            //   '${e.desc}',
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.w700,
                                            //       color: black,
                                            //       fontSize: 10,
                                            //       letterSpacing: 0.5),
                                            // ),
                                            // Gap(5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            )
                          : Row(
                              children: [
                                ...data.response.plans[0].plans.map((e) {
                                  return Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        navigationService.push(
                                            routeCustomeBottomNavigationBar,
                                            arguments: {navIndex: 1});
                                        planIndex = data.response.plans[0].plans
                                            .indexOf(e);
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, right: 5),
                                        padding: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: lightyellowtwo,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              e.planTitle,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.5),
                                            ),
                                            Gap(3),
                                            Container(
                                              height: 1.1,
                                              width: 40,
                                              color: black,
                                            ),
                                            Gap(3),
                                            Text(
                                              'RS ${e.offerPrice}/-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: black,
                                                  letterSpacing: 0.5),
                                            ),
                                            Gap(5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '50% off',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color: black,
                                                  ),
                                                ),
                                                Gap(2),
                                                Text(
                                                  'RS ${e.actualPrice}/-',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gap(5),
                                            // Text(
                                            //   '${e.desc}',
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.w700,
                                            //       color: black,
                                            //       fontSize: 10,
                                            //       letterSpacing: 0.5),
                                            // ),
                                            // Gap(5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                      Gap(20),
                      GestureDetector(
                        onTap: () {
                          print(
                              "State List In Dash Board plan --->>> ${stateList}");
                          print("key Id ; ${getString(prefUserID)}");
                          setString(prefSpecificAssets, "SpecificAssets");

                          List<ResponseSpeciality> dashboardResponse = [];
                          dashboardResponse.addAll(data.response.specialities);

                          List<PlanModule> planSelected = [];

                          navigationService
                              .push(routeChooseAssetMobile, arguments: {
                            navSpecificAssets: "SpecificAssets",
                            navDashboardResponse: dashboardResponse,
                            navSelectedPlan: planSelected,
                          });
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                child: Image.asset(banner),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 110,
                                width: w,
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(19),
                                    Row(
                                      children: [
                                        Text(
                                          legalHeir,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                              letterSpacing: 0.5),
                                        ),
                                        // SizedBox(
                                        //   width: Utils.getWidth(context) * 0.17,
                                        // ),
                                        Spacer(),
                                        Text(
                                          selectFromHere,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: white,
                                            fontSize: 11,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    Text(
                                      specificAsset,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: white,
                                          letterSpacing: 0.5),
                                    ),
                                    Gap(19),
                                    Text(
                                      timeAndEfforts,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: white,
                                          fontSize: 11,
                                          letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color: blue,
                                  image: DecorationImage(
                                      image: AssetImage(workbg),
                                      scale: 4,
                                      fit: BoxFit.fill)),
                              child: Text(
                                howItWorks,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: white,
                                    letterSpacing: 0.7),
                              ),
                            ),
                          ),
                          Gap(15),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(referearnbanner),
                                    scale: 4,
                                    fit: BoxFit.fill),
                              ),
                              child: Text(
                                referAndEarn,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                    letterSpacing: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            whatCustomersSay,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, color: navyblue),
                          )),
                      Gap(20),
                      CarouselSlider.builder(
                        itemCount: data.response.testimonials.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var testimonialsData =
                              data.response.testimonials[itemIndex];
                          return Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 317,
                            decoration: BoxDecoration(
                              // color: sky,
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/images/aboutus.png'),
                                scale: 4,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Utils.getWidth(context) * 0.390,
                                ),
                                Expanded(
                                  child: Text(
                                    "${testimonialsData.content}",
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: Utils.getWidth(context) * 0.03,
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          aspectRatio: 14 / 3.8,
                          initialPage: 1,
                          onPageChanged: (index, items) {
                            textIndex.value = index;
                          },
                        ),
                      ),
                      Gap(10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicators(
                              data.response.testimonials.length,
                              textIndex.value)),
                      Gap(10),
                      Row(
                        children: [
                          Image.asset(
                            iconRight,
                            scale: 3.5,
                          ),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    allLegalDocument,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[600],
                                        height: 1.3,
                                        letterSpacing: 0.3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: forMoreInformation,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                    letterSpacing: 0.2)),
                            TextSpan(
                              text: " " + faq + " ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                  letterSpacing: 0.2),
                            ),
                            TextSpan(
                                text: and + " ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                    letterSpacing: 0.2)),
                            TextSpan(
                                text: termsAndConditions,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                    letterSpacing: 0.2)),
                          ],
                        ),
                      ),
                      Gap(50),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (obj, trace) => ErrorWidget(obj),
          loading: () => const Loading()),
    );
  }
}
