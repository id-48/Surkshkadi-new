
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/components.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_validation.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';
import 'package:surakshakadi/widgets/custome_drawer_web.dart';
import 'package:surakshakadi/widgets/loading.dart';

class AboutUsWeb extends HookConsumerWidget {
  const AboutUsWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formkey = GlobalKey<FormState>();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController mobilenoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    // TextEditingController cityController = TextEditingController();
    // TextEditingController stateController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    final statee = useState<String>('');
    final cityy = useState<String>('');
    final cityList = useState<List<String>>([]);

    final isSubmit = useState<bool>(false);
    final isSoon = useState<bool>(false);

    useEffect(() {
      ref.read(dashboardProvider.notifier).getDashboard(context: context);
    },[]);

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final viewAll = useState<bool>(false);

    final faqController = ref.watch(dashboardProvider);


    return Scaffold(
      // key: scaffoldKey,
      drawer: Custome_drawer_web(index: 1, button: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarWeb(button: true, index: 1,scaffoldkey: scaffoldKey,),
            Gap(40),

            GiveBackTo(),
            Gap(80),
            ResponsiveGridRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: 0,
                  child: Gap(40),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 11 : 6,
                  md: 11,
                  xs: 11,
                  child: Container(
                    height: Utils.getHeight(context) * 0.8,
                    child: Image.asset(
                      aboutUsBanner,
                      scale: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                  md: 1,
                  xs: 1,
                  child: Gap(40),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 1 : 0,
                  md: 1,
                  xs: 1,
                  child: Gap(Utils.getWidth(context) < 1250 ? 40 : 0),
                ),
                ResponsiveGridCol(
                  lg: Utils.getWidth(context) < 1250 ? 11 : 6,
                  md: 10,
                  xs: 11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        aboutUs,
                        style: GoogleFonts.bonaNova(
                          textStyle: TextStyle(
                              color: buttonColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        aboutAsWeHaveYouCovered,
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Gap(10),
                      Container(
                        height: 4,
                        width: 180,
                        color: oreng,
                      ),
                      Gap(30),
                      Text(
                        aVibrantGroupIndividuals,
                        style: TextStyle(
                          fontSize: 17,
                          color: black,
                          wordSpacing: 1.7,
                          letterSpacing: 1.5,
                          height: 1.5,
                        ),
                      ),
                      Gap(30),
                      Text(
                        theTeamEnvisions,
                        style: TextStyle(
                            fontSize: 21,
                            height: 1.3,
                            wordSpacing: 1.7,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                            color: black),
                      ),
                      Gap(30),
                      Text(
                        helpingPeoplePlan,
                        style: TextStyle(
                            fontSize: 23,
                            height: 1.3,
                            wordSpacing: 1.7,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w700,
                            color: black),
                      ),
                    ],
                  ),
                ),
                ResponsiveGridCol(
                  lg: 0,
                  md: 0,
                  xs: 0,
                  child: Gap(40),
                ),
              ],
            ),
            // Gap(30),


            ResponsiveGridRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveGridCol(
                    // lg: 2,
                    xl: Utils.getWidth(context) < 1370 ? 1 : 1,
                    md: 1,
                    xs: 0,
                    child: Container()),
                ResponsiveGridCol(
                  // lg: 2,
                    xl: 0,
                    md: 0,
                    xs: 0,
                    child: Gap(Utils.getWidth(context) <  1370 ? 0 : Utils.getWidth(context) * 0.05)),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                  md: 5,
                  xs: 12,
                  child: Container(
                    child: Align(
                      alignment: Utils.getWidth(context) < 1370 ? Alignment.center : Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 20,right: 20),
                        height: 140,
                        width: 240,
                        decoration: BoxDecoration(
                            color: lowBlue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(0.0, 4)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              willVector,
                              scale: 4,
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                complementaryEWillCreation,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),



                ResponsiveGridCol(
                  // lg: 2,
                  xl: 3,
                  md: 5,
                  xs: 12,
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,

                      child: Container(
                        margin: EdgeInsets.only(top: 30),

                        padding: EdgeInsets.only(left: 20,right: 20),
                        height: 140,
                        width: 240,
                        decoration: BoxDecoration(
                            color: lowBlue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(0.0, 4)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              vactor,
                              scale: 4,
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                freeInsuranceCover,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                ResponsiveGridCol(
                  // lg: 2,
                  xl: Utils.getWidth(context) < 1370 ? 4 : 3,
                  md: 12,
                  xs: 12,
                  child: Container(
                    child: Align(
                      alignment: Utils.getWidth(context) < 1370 ? Alignment.center : Alignment.centerLeft,

                      child: Container(
                        margin: EdgeInsets.only(top: 30),

                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 140,
                        width: 240,
                        decoration: BoxDecoration(
                            color: lowBlue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(0.0, 4)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              subscriptionModel,
                              scale: 4,
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                returnOfYourSubscription,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                    // lg: 2,
                    xl: Utils.getWidth(context) < 1370 ? 0 : 1,
                    md: 1,
                    xs: 0,
                    child: Container()),
              ],
            ),

            Gap(16),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 50),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xl: 6,
                    md: Utils.getWidth(context) < 1200 ? 11 : 7,
                    xs: 12,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(50),
                          Text(
                            onePlatform,
                            style: GoogleFonts.bonaNova(
                              textStyle: TextStyle(
                                  color: black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  wordSpacing: 1,
                                  letterSpacing: 3),
                            ),
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                onePlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weAreHereTo,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                twoPlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weStore,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                threePlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                wePrepare,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Image.asset(
                                fourPlat,
                                scale: 4,
                              ),
                              Gap(20),
                              Expanded(
                                  child: Text(
                                weMake,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Gap(30),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(xl: 0, md: 0, xs: 0, child: Gap(40)),
                  ResponsiveGridCol(
                    xl: 6,
                    md: Utils.getWidth(context) < 1200 ? 11 : 7,
                    xs: 12,
                    child: Container(
                      child: Image.asset(
                        platBanner,
                        scale: 4.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(10),

            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  // lg: 2,
                  xl: 6,
                  md: Utils.getWidth(context) < 1200 ? 12 : 7,
                  xs: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Utils.getWidth(context) < 660 ? 0 : 24),
                        child: QuetionText(
                            boldName: faqs,
                            boldNameColor: navyblue,
                            smallName: weHaveYouCOvered,
                            smallNameColor: black),
                      ),
                      Gap(50),

                      faqController.when(
                        data: (data){
                          return Container(
                            height: viewAll.value == false ? 340 : 720,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // physics: ClampingScrollPhysics(),
                                itemCount: viewAll.value == false ? 4 : data.response.faqs.length,
                                itemBuilder: ( context, index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                                    child: Column(
                                      children: [
                                        CustomChildExpandableCard(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 16, top: 16, bottom: 30),
                                          title: "${data.response.faqs[index].question}",
                                          isExpanded: ValueNotifier(1),
                                          index: 0,
                                          expandedChild: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                                            // height: 50,
                                            // color: Colors.lightBlueAccent,
                                            child: Text("${data.response.faqs[index].answer}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                          ),
                                        ),
                                        Gap(20),
                                      ],
                                    ),
                                  );
                                }),
                          );
                        },
                          error: (obj, trace) => ErrorWidget(obj),
                          loading: () => const Loading(),
                      ),



                      /// Api without na data
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                      //   child: CustomChildExpandableCard(
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 30),
                      //     title: howDoYouKeepMy,
                      //     isExpanded: ValueNotifier(1),
                      //     index: 0,
                      //     expandedChild: Container(
                      //       height: 50,
                      //       color: Colors.lightBlueAccent,
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                      //   child: CustomChildExpandableCard(
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 30),
                      //     title: howDoYouSign,
                      //     isExpanded: ValueNotifier(2),
                      //     index: 1,
                      //     expandedChild: Container(
                      //       height: 50,
                      //       color: Colors.lightBlueAccent,
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                      //   child: CustomChildExpandableCard(
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 30),
                      //     title: whoCreatesTheLegal,
                      //     isExpanded: ValueNotifier(3),
                      //     index: 2,
                      //     expandedChild: Container(
                      //       height: 50,
                      //       color: Colors.lightBlueAccent,
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) < 660 ? 16 : 60),
                      //   child: CustomChildExpandableCard(
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 30),
                      //     title: whoReviewsMy,
                      //     isExpanded: ValueNotifier(4),
                      //     index: 3,
                      //     expandedChild: Container(
                      //       height: 50,
                      //       color: Colors.lightBlueAccent,
                      //     ),
                      //   ),
                      // ),

                      if(viewAll.value == false)...[
                      Gap(70),
                      Center(
                        child: InkWell(
                          onTap: (){
                            viewAll.value = true;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 50),
                            decoration: BoxDecoration(
                              border: Border.all(color: blue, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              viewMore,
                              style: TextStyle(fontSize: 18, color: blue),
                            ),
                          ),
                        ),
                      ),
                      ],
                    ],
                  ),
                ),
                ResponsiveGridCol(
                  // lg: 2,
                  xl: 6,
                  md: Utils.getWidth(context) < 1200 ? 11 : 5,
                  xs: 12,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Utils.getWidth(context) > 1200 ? 50 : Utils.getWidth(context) > 660 ? 70 : 30,
                        top: Utils.getWidth(context) < 1200 ? 40 : 0,
                        right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        if( isSubmit.value ==  false || isSoon.value ==  true)
                          Gap(Utils.getWidth(context) < 1200 ? 0 : 120),

                        if(isSubmit.value == true)
                          Gap(30),


                        if(isSubmit.value ==  false)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                haveMoreQue,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gap(40),
                              Text(
                                ourTeamOfHighly,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gap(30),
                              GestureDetector(
                                onTap: (){
                                  isSubmit.value  = true;
                                  },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  width: 450,
                                  // width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: blue, width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      needHelp,
                                      style: TextStyle(fontSize: 18, color: blue),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(30),
                            ],
                          ),
                        ),
                        if(isSoon.value ==  true)
                        Text(
                          ourLegalExpert,
                          style: TextStyle(color: fullgray,fontSize: 18,fontFamily: fontFamily),
                        ),
                        if(isSubmit.value ==  true && isSoon.value == false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contactUs,
                                style: GoogleFonts.bonaNova(
                                  textStyle: TextStyle(
                                      color: navyblue,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),

                              Gap(30),

                              Container(
                              // width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFEBF0FC),
                                ),
                              ),
                              child: Form(
                                key: formkey,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: customeFormTextField(
                                              context: context,
                                              name: "First Name*",
                                              maxLines: 1,
                                              controller: firstNameController,
                                              keyboardType: TextInputType.name,
                                              validation: validateName,
                                            ),
                                          ),
                                          Gap(10),
                                          Expanded(
                                            flex: 1,
                                            child: customeFormTextField(
                                              context: context,
                                              name: "Last Name*",
                                              maxLines: 1,
                                              controller: lastNameController,
                                              keyboardType: TextInputType.name,
                                              validation: validateName,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: customeFormTextField(
                                              context: context,
                                              name: "Mobile Number*",
                                              maxLines: 1,
                                              controller: mobilenoController,
                                              keyboardType: TextInputType.number,
                                              maxLength: 10,
                                              validation: validateMobile,
                                            ),
                                          ),
                                          Gap(10),
                                          Expanded(
                                            flex: 1,
                                            child: customeFormTextField(
                                              context: context,
                                              name: "Email Id*",
                                              maxLines: 1,
                                              controller: emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validation: validateEmail,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("State*"),
                                                Gap(10),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      // right: 20.0,
                                                      // top: 10,
                                                      bottom: 10),
                                                  child: CustomSelectWeb(
                                                    boxShadow: [],
                                                    iconColor: Color(0xFF9FB9ED),
                                                    textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: black,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                    color: white,
                                                    onChanged:
                                                        (stateVal) async {
                                                      cityList.value.clear();
                                                      statee.value = stateVal;

                                                      ReqCity cityData = ReqCity(
                                                          state:
                                                          "${stateVal}");

                                                      await ref
                                                          .read(cityProvider
                                                          .notifier)
                                                          .getCity(
                                                          context:
                                                          context,
                                                          data: cityData)
                                                          .then((value) {
                                                        if (value!.status ==
                                                            1) {
                                                          // displayToast("${value.message}");
                                                          for (int j = 0;
                                                          j <
                                                              value
                                                                  .response
                                                                  .cities
                                                                  .length;
                                                          j++) {
                                                            cityList.value
                                                                .add(value
                                                                .response
                                                                .cities[j]
                                                                .name);
                                                          }
                                                        } else {
                                                          displayToast(
                                                              "${value.message}");
                                                        }
                                                      });
                                                    },
                                                    items: stateList,
                                                    // items: selectStateCity[0]
                                                    // ["dataList"],
                                                    hint: '',
                                                    borderCon: BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFF9FB9ED),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Gap(10),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("City*"),
                                                Gap(10),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                    // right: 20.0,
                                                    // top: 10,
                                                    bottom: 10,
                                                  ),
                                                  child: CustomSelectWeb(
                                                    boxShadow: [
                                                      // BoxShadow(
                                                      //   color: Colors.black26,
                                                      //   blurRadius: 4.0,
                                                      //   offset: Offset(
                                                      //     0.0,
                                                      //     0.0,
                                                      //   ),
                                                      // ),
                                                    ],
                                                    iconColor: Color(0xFF9FB9ED),
                                                    textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: black,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                    color: white,
                                                    onChanged: (val) {
                                                      // cityy.value = val;
                                                    },
                                                    items: cityList.value,
                                                    // items: selectStateCity[1]
                                                    // ["dataList"],
                                                    hint: '',
                                                    borderCon: BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFF9FB9ED),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              // height: 100,
                                              child: customeFormTextField(
                                                height: 100,
                                                maxLines: 4,
                                                context: context,
                                                name: "Share More Details",
                                                controller: addressController,
                                                validation: validateName,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(10),
                                      InkWell(
                                        onTap: () {

                                          // if(firstNameController.text.isNotEmpty
                                          //     && lastNameController.text.isNotEmpty
                                          // && mobilenoController.text.isNotEmpty
                                          // && emailController.text.isNotEmpty
                                          // && addressController.text.isNotEmpty
                                          // && cityy.value.isNotEmpty
                                          // && statee.value.isNotEmpty
                                          //
                                          // ) {
                                          //

                                            isSoon.value = true;

                                          // }else{
                                          //   displayToast("Please Complete Form Details");
                                          // }

                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 40),
                                          decoration: BoxDecoration(
                                            color: oreng,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Gap(50),

            AppSurakshakadi(),
            Disclaimers(),
            CustomWebBottomBar(),
          ],
        ),
      ),
    );
  }
}
