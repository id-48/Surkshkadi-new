import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/req_beneficiary.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/beneficiary_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

import '../../../utils/constants/preference_key_constant.dart';

class Beneficiary extends HookConsumerWidget {
  final int childCount;
  final List<String> childName;

  const Beneficiary(
      {Key? key, required this.childCount, required this.childName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fatherController = useTextEditingController();
    final fatherReasonController = useTextEditingController();
    final motherController = useTextEditingController();
    final motherReasonController = useTextEditingController();
    final spouseController = useTextEditingController();
    final spouseReasonController = useTextEditingController();

    final isFather = useState<bool>(false);
    final isMother = useState<bool>(false);
    final isSpouse = useState<bool>(false);

    final totalCount = useState<int>(0);

    final addAnotherIndex= useState<int>(0);

    // final isIcon= useState <bool>(false);

    // List<String> childrenList = ["one", "Two", "Thee"];




    final reasonAddAnotherController = useState<List<TextEditingController>>([]);
    final addAnotherPController =useState<List<TextEditingController>>([]);
    final addNameController = useState<List<TextEditingController>>([]);
    final isAddAnother = useState<List<bool>>([]);

    // List<TextEditingController> reasonAddAnotherController = List.generate(addAnotherIndex.value, (i) => useTextEditingController());
    // List<TextEditingController> addAnotherPController = List.generate(addAnotherIndex.value, (j) => useTextEditingController(text: "00"));
    // List<TextEditingController> addNameController = List.generate(addAnotherIndex.value, (k) => useTextEditingController());
    // List<bool> isAddAnother = List.generate(addAnotherIndex.value, (i) => false);

    List<TextEditingController> childController = List.generate(childCount, (i) => useTextEditingController(text: "00"));

    List<TextEditingController> reasonChildController = List.generate(childCount, (i) => useTextEditingController());

    List<bool> isChild = List.generate(childCount, (i) => false);

    // final totalPercentage = useState<int>(0);

    rowValue(
        context, {
          required String keyText,
          required bool isMinus,
          required String valueText,
          required TextEditingController controller,
          required void Function()? onTap,
          required void Function(String)? onChanged,
          required void Function(String) onFieldSubmitted,
        }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(15),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keyText,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: buttonColor,
                              fontWeight: FontWeight.w600),
                        ),
                        // Gap(2),
                        Text(
                          valueText,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        height: 24,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color(0xffDEE8FF),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextfeild(
                                textStyle: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w600),
                                textCapitalization: TextCapitalization.none,
                                textInputType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                containercolor: Color(0xffDEE8FF),
                                controller: controller,
                                hinttext: "00",
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w600),
                                contentPadding:
                                EdgeInsets.only(left: 4, top: -13, bottom: 12),
                                maxLines: 1,
                                maxLength: 3,
                                onFieldSubmitted: onFieldSubmitted,
                                onChange: onChanged,
                              ),
                            ),
                            Text(
                              '%',
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: buttonColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ))),
              Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: InkWell(
                          onTap: onTap,
                          child: isMinus
                              ? Icon(
                            Icons.remove,
                            color: buttonColor,
                          )
                              : Image.asset(
                            plusIcon,
                            scale: 3.5,
                            // color: blueee,
                          ),
                        )),
                  )),
            ],
          ),
          Gap(15),
          FDottedLine(
            color: blue,
            strokeWidth: 1,
            space: 2,
            width: double.infinity,
          ),
        ],
      );
    }

    rowAddValue(
        context, {

          required bool isMinus,

          required TextEditingController nameController,
          required TextEditingController percentageController,
          required void Function()? onTap,
          required void Function(String)? onChanged,
          required void Function(String)? onFieldSubmitted,
          required void Function(String)? onChangedAddName,
          required void Function(String)? onFieldSubmittedAddName,
        }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(15),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    height: 24,
                    width: 50,

                    child: CustomTextfeild(

                      controller: nameController,

                      textStyle: GoogleFonts.inter(
                          fontSize: 13,
                          color: buttonColor,
                          fontWeight: FontWeight.w600),
                      textCapitalization: TextCapitalization.none,
                      textInputType: TextInputType.text,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      containercolor: white,
                      hinttext: "{Free text}",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 13,
                          color: buttonColor,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                      EdgeInsets.only(  left: 18, top: -13, bottom: 12),
                      onChange: onChangedAddName,
                      onFieldSubmitted: onFieldSubmittedAddName,



                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        height: 24,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color(0xffDEE8FF),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextfeild(
                                textStyle: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w600),
                                textCapitalization: TextCapitalization.none,
                                textInputType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                containercolor: Color(0xffDEE8FF),
                                controller: percentageController,
                                hinttext: "00",
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w600),
                                contentPadding:
                                EdgeInsets.only(left: 4, top: -13, bottom: 12),
                                maxLines: 1,
                                maxLength: 3,
                                onFieldSubmitted: onFieldSubmitted,
                                onChange: onChanged,
                              ),
                            ),
                            Text(
                              '%',
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: buttonColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ))),
              Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: InkWell(
                          onTap: onTap,
                          child: isMinus
                              ? Icon(
                            Icons.remove,
                            color: buttonColor,
                          )
                              : Image.asset(
                            plusIcon,
                            scale: 3.5,
                          ),
                        )),
                  )),
            ],
          ),
          Gap(15),
          FDottedLine(
            color: blue,
            strokeWidth: 1,
            space: 2,
            width: double.infinity,
          ),
        ],
      );
    }


    int childPer = 0;
    int addAnother = 0;
    // print("child data start -->>>> ${childPer}");

    for (int i = 0; i < childController.length; i++) {
      childPer += int.parse(
          childController[i].text.isEmpty ? "00" : childController[i].text);
    }


    for (int i = 0; i < addAnotherPController.value.length; i++) {

      addAnother += int.parse(
          addAnotherPController.value[i].text.isEmpty ? "00" : addAnotherPController.value[i].text);
    }


    return Scaffold(
      appBar: CustomAppBar(
        title: "Beneficiary",
        // backonTap: () {},
      ),
      body: SingleChildScrollView(
        child: StatefulBuilder(builder: (BuildContext context, setState,) {
          totalCount.value = int.parse(fatherController.text.isNotEmpty
              ? fatherController.text
              : '00') +
              int.parse(motherController.text.isNotEmpty
                  ? motherController.text
                  : '00') +
              int.parse(spouseController.text.isNotEmpty
                  ? spouseController.text
                  : '00') + childPer + addAnother;

          return Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                Text(
                  iHerebyDeclareThatMy,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                Gap(10),

                Divider(
                  height: 2,
                  thickness: 1.2,
                  color: dividerColor,
                ),

                rowValue(
                  context,
                  keyText: "Father",
                  valueText: getString(prefFatherName),
                  controller: fatherController,
                  isMinus: isFather.value,
                  onChanged: (v) {
                    if (v != "") {
                      isFather.value = false;
                      setState(() {});
                    }
                  },
                  onTap: () {
                    if(fatherController.text == "00" || fatherController.text.isEmpty){
                      setState(() {
                        isFather.value = !isFather.value;
                      });
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
                if (isFather.value && fatherController.text.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextfeild(
                      textCapitalization: TextCapitalization.none,
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      blurRadius: 4.0,
                      maxLines: 1,
                      offset: Offset(
                        0.0,
                        4,
                      ),
                      containerborder: Border.all(color: webBorder),
                      containercolor: white,
                      hinttext: "What's Your reason",
                      hintStyle: TextStyle(fontSize: 15),
                      borderRadius: BorderRadius.circular(10),
                      controller: fatherReasonController,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),

                rowValue(
                  context,
                  keyText: "Mother",
                  valueText: getString(prefMotherName),
                  controller: motherController,
                  isMinus: isMother.value,
                  onChanged: (v) {
                    if (v != "") {
                      isMother.value =false ;
                      setState(() {});
                    }
                  },
                  onTap: () {
                    if (motherController.text == "00"  || motherController.text.isEmpty) {
                      setState(() {
                        isMother.value = !isMother.value;
                      });
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
                if (isMother.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextfeild(
                      textCapitalization: TextCapitalization.none,
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      blurRadius: 4.0,
                      maxLines: 1,
                      offset: Offset(
                        0.0,
                        4,
                      ),
                      containerborder: Border.all(color: webBorder),
                      containercolor: white,
                      hinttext: "What's Your reason",
                      hintStyle: TextStyle(fontSize: 15),
                      borderRadius: BorderRadius.circular(10),
                      controller: motherReasonController,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),

                rowValue(
                  context,
                  keyText: "Spouse",
                  valueText: getString(prefMarriedSpouseName),
                  controller: spouseController,
                  isMinus: isSpouse.value,
                  onChanged: (v) {
                    if (v != "") {
                      isSpouse.value = false ;
                      setState(() {});
                    }
                  },
                  onTap: () {
                    if (spouseController.text == "00" || spouseController.text.isEmpty) {
                      setState(() {
                        isSpouse.value = !isSpouse.value;
                      });
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                ),
                if (isSpouse.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextfeild(
                      textCapitalization: TextCapitalization.none,
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      blurRadius: 4.0,
                      maxLines: 1,
                      offset: Offset(
                        0.0,
                        4,
                      ),
                      containerborder: Border.all(color: webBorder),
                      containercolor: white,
                      hinttext: "What's Your reason",
                      hintStyle: TextStyle(fontSize: 15),
                      borderRadius: BorderRadius.circular(10),
                      controller: spouseReasonController,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),

                ListView.builder(
                  shrinkWrap: true,
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: childCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        rowValue(
                          context,
                          keyText: "Child ${index + 1}",
                          valueText: '${childName[index]}',
                          isMinus: isChild[index],
                          onChanged: (v) {
                            print("test data");
                            if (v != "") {
                              isChild[index] = false ;
                              setState(() {});
                            }
                          },
                          controller: childController[index],
                          onTap: () {
                            print("------> ooooo");
                            print("ischild ---> ${isChild[index]}");

                            if (childController[index].text == "00" || childController[index].text.isEmpty) {
                              setState(() {
                                print("ischild pela---> ${isChild[index]}");
                                isChild[index] = !isChild[index];
                                print("ischild pachi ---> ${isChild[index]}");
                              });
                            }
                          },
                          onFieldSubmitted: (value) {
                            setState(() {});
                          },
                        ),
                        if (isChild[index] == true)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextfeild(
                              textCapitalization: TextCapitalization.none,
                              contentPadding: EdgeInsets.only(
                                left: 10,
                              ),
                              blurRadius: 4.0,
                              maxLines: 1,
                              offset: Offset(
                                0.0,
                                4,
                              ),
                              containerborder: Border.all(color: webBorder),
                              containercolor: white,
                              hinttext: "What's Your reason",
                              hintStyle: TextStyle(fontSize: 15),
                              borderRadius: BorderRadius.circular(10),
                              controller: reasonChildController[index],
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                      ],
                    );
                  },
                ),


                ListView.builder(
                  shrinkWrap: true,
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addNameController.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        rowAddValue(
                          context,
                          nameController: addNameController.value[index],
                          percentageController : addAnotherPController.value[index],

                          onChangedAddName: (val){},
                          onFieldSubmittedAddName: (valFie){},

                          isMinus: isAddAnother.value[index],
                          onChanged: (v) {
                            if (v != "") {
                              isAddAnother.value[index] = false ;
                              setState(() {});
                            }
                          },


                          onTap: () {

                            if (addAnotherPController.value[index].text == "00" || addAnotherPController.value
                            [index].text.isEmpty) {

                              isAddAnother.value[index] = !isAddAnother.value[index];

                              setState(() {
                              });
                            }
                          },
                          onFieldSubmitted: (value) {
                            setState(() {});
                          },
                        ),


                        if (isAddAnother.value[index] == true)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextfeild(
                              controller: reasonAddAnotherController.value[index],
                              textCapitalization: TextCapitalization.none,
                              contentPadding: EdgeInsets.only(left: 10,),
                              blurRadius: 4.0,
                              maxLines: 1,
                              offset: Offset(0.0, 4,),
                              containerborder: Border.all(color: webBorder),
                              containercolor: white,
                              hinttext: "What's Your reason",
                              hintStyle: TextStyle(fontSize: 15),
                              borderRadius: BorderRadius.circular(10),
                              textStyle: TextStyle(fontSize: 20),
                              onChange: (change){},
                              onFieldSubmitted: (sub){},
                            ),
                          ),
                      ],
                    );
                  },
                ),


                Gap(15),

                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total',
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                              // Gap(2),
                              // Text(getString(prefFatherName),style: GoogleFonts.inter(fontSize: 13,color: black,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Center(
                            child: Container(
                              padding: EdgeInsets.only(right: 5, left: 5, top: 4),
                              height: 24,
                              // width: 70,
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFE1E1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                '${totalCount.value} %',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))),
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                  ],
                ),

                Gap(15),

                FDottedLine(
                  color: blue,
                  strokeWidth: 1,
                  space: 2,
                  width: double.infinity,
                ),


                Gap(40),

                Center(
                  child: CustomButton(
                    title: "+ Add Another",
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                    onTap: () {
                      // print("adddd----> ${addAnotherIndex.value}");

                      // addNameController.clear();
                      // addAnotherPController.clear();
                      // reasonAddAnotherController.clear();

                      addAnotherIndex.value = addAnotherIndex.value + 1 ;
                      addNameController.value.add(TextEditingController());
                      addAnotherPController.value.add(TextEditingController());
                      reasonAddAnotherController.value.add(TextEditingController());
                      isAddAnother.value.add(false);

                      setState((){});

                      // print("adddd----> pacgi ${addAnotherIndex.value}");
                      // navigationService.push(routeRecordAVideo,arguments: {navVideoRecord: false,});
                    },
                  ),
                ),

                Gap(30),

              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        height: Utils.getHeight(context) * 0.08,
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
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Back",
                      style: TextStyle(fontSize: 15, color: fullgray)),
                )),
            Expanded(
                flex: 1,
                child: HookConsumer(
                  builder: (context, ref, child) {
                    return InkWell(
                      onTap: () async {
                        if (fatherController.text.isEmpty || fatherController.text == "00") {
                          displayToast(
                              "Please enter the reason for disinheriting (excluding) your family member from your Will");
                        } else if (motherController.text.isEmpty || motherController.text == "00") {
                          displayToast(
                              "Please enter the reason for disinheriting (excluding) your family member from your Will");
                        } else if (spouseController.text.isEmpty || spouseController.text == "00") {
                          displayToast(
                              "Please enter the reason for disinheriting (excluding) your family member from your Will");
                        } else if (childController.length.toString().isEmpty || childController.length.toString() == "00") {
                          displayToast(
                              "Please enter the reason for disinheriting (excluding) your family member from your Will");
                        } else if (totalCount.value > 100) {
                          displayToast("A Value Can't Be Above 100%");
                        } else if (totalCount.value < 100) {
                          displayToast("A Value Can't Be Less Then 100%");
                        } else {
                          String childNameData = "${childName}"
                              .replaceAll("[", '')
                              .replaceAll(']', '');

                          // print("chiassmmsd name ---->>${childNameData}");

                          ReqBeneficiary beneficiaryData = ReqBeneficiary(
                              userId: getString(prefUserID),
                              relation: [
                                "son",
                                "father"
                              ],
                              name: [
                                getString(prefFatherName),
                                getString(prefMotherName),
                                prefMarriedSpouseName,
                                childNameData
                              ],
                              percentage: [
                                fatherController.text,
                                motherController.text,
                                spouseController.text,
                                childController.length.toString()
                              ],
                              exclusionReason: [
                                fatherReasonController.text,
                                motherReasonController.text,
                                spouseReasonController.text,
                                reasonChildController.length.toString()
                              ]);

                          print(
                              "test data ---->>>> ${beneficiaryData.toJson()}");

                          await ref
                              .read(beneficiaryProvider.notifier)
                              .postBeneficiary(
                              context: context, data: beneficiaryData)
                              .then((value) {
                            if (value!.status == 1) {
                              displayToast("${value.message}");
                              navigationService
                                  .pushAndRemoveUntil(routeWillReview);
                            } else {
                              displayToast("${value.message}");
                            }
                          });
                        }
                      },
                      child: Container(
                        height: Utils.getHeight(context) * 0.08,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff3C87E0).withOpacity(0.9),
                                Color(0xff0E3563).withOpacity(0.6),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Text(
                          continuee,
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

//Gap(15),
//
//             Row(
//               children: [
//                 Expanded(
//                   flex: 4,
//                     child: Padding(
//                       padding:  EdgeInsets.only(left: 16.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Father',style: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),),
//                           // Gap(2),
//                           Text(getString(prefFatherName),style: GoogleFonts.inter(fontSize: 13,color: black,fontWeight: FontWeight.w600),),
//
//                         ],
//                       ),
//                     )
//                 ),
//
//                 Expanded(
//                     flex: 3,
//                     child: Center(
//                       child: Container(
//                         padding: EdgeInsets.only(right: 5),
//                         height: 24,
//                         width: 70,
//                         decoration: BoxDecoration(
//                         color: Color(0xffDEE8FF),
//                           borderRadius: BorderRadius.circular(5)
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: CustomTextfeild(
//                                 textStyle: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),
//                                 textCapitalization: TextCapitalization.none,
//                                 offset: Offset(0.0,0.0),
//                                 blurRadius: 0.0,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(5),
//                                   bottomLeft: Radius.circular(5)
//                                 ),
//                                 containercolor: Color(0xffDEE8FF),
//                                 controller: fatherController,
//                                 contentPadding: EdgeInsets.only(left: 4,top: -13,bottom: 12),
//                                 textInputType: TextInputType.numberWithOptions(decimal: true,signed: false),
//                                 maxLines: 1,
//                                 maxLength: 6,
//                               ),
//                             ),
//                             Text('%',style: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),),
//                           ],
//                         ),
//                       )
//                     )
//                 ),
//
//
//                 Expanded(
//                     flex: 3,
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Padding(
//                         padding:  EdgeInsets.only(right: 16.w),
//                         child: Image.asset(plusIcon,scale: 3.5,),
//                       ),
//                     )
//                 ),
//
//               ],
//             ),
//
//             Gap(15),
//
//             FDottedLine(
//               color: blue,
//               strokeWidth: 1,
//               space: 2,
//               width: double.infinity,
//             ),
