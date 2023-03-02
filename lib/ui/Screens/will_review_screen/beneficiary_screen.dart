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
  final  int childCount;
  final  List<String> childName;
  const Beneficiary({Key? key,required this.childCount,required this.childName}) : super(key: key);



  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final fatherController = useTextEditingController(text: "90");
    final fatherReasonController = useTextEditingController();
    final motherController = useTextEditingController(text: "00");
    final motherReasonController = useTextEditingController();
    final spouseController = useTextEditingController(text: "00");
    final spouseReasonController = useTextEditingController();


    final isFather = useState <bool>(false);
    final isMother = useState <bool>(false);
    final isSpouse = useState <bool>(false);




    List<String> childrenList = [
      "one",
      "Two",
      "Thee"
    ];

    List<TextEditingController> childController =
    List.generate(childCount, (i) => useTextEditingController(text: "00"));

    List<TextEditingController> reasonChildController =
    List.generate(childCount, (i) => useTextEditingController());

    List<bool> isReason =
    List.generate(childCount, (i) => false);


    // onChange: (val){
    //   if(val != ""){
    //     totalPercentage.value += int.parse(val);
    //   }else{
    //     totalPercentage.value -= int.parse(val);
    //   }
    // },

    final  totalPercentage =   useState<int>(0);


    rowValue (context,{
      required String keyText,
      required String valueText,
      required TextEditingController controller,
      required void Function()? onTap,

      required void Function(String) onFieldSubmitted,
    }){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Gap(15),

          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(keyText,style: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),),
                        // Gap(2),
                        Text(valueText,style: GoogleFonts.inter(fontSize: 13,color: black,fontWeight: FontWeight.w600),),

                      ],
                    ),
                  )
              ),

              Expanded(
                  flex: 3,
                  child: Center(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        height: 24,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color(0xffDEE8FF),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextfeild(
                                textStyle: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),
                                textCapitalization: TextCapitalization.none,
                                textInputType: TextInputType.numberWithOptions(decimal: true,),
                                offset: Offset(0.0,0.0),
                                blurRadius: 0.0,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)
                                ),
                                containercolor: Color(0xffDEE8FF),
                                controller: controller,

                                hinttext: "00",
                                hintStyle: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.only(left: 4,top: -13,bottom: 12),
                                maxLines: 1,
                                maxLength: 2,
                                onFieldSubmitted: onFieldSubmitted,
                              ),
                            ),
                            Text('%',style: GoogleFonts.inter(fontSize: 13,color: buttonColor,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      )
                  )
              ),


              Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding:  EdgeInsets.only(right: 16.w),
                        child: InkWell(
                          onTap: onTap,
                          child: Image.asset(plusIcon,scale: 3.5,),
                        )
                    ),
                  )
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

        ],
      );
    }

    int childPer = 0;
    print("child data start -->>>> ${childPer}");


    for(int i = 0; i< childController.length; i++){
      childPer += int.parse(childController[i].text.isEmpty ? "00" : childController[i].text );
    }

    print("child data end -->>>> ${childPer}");

    final totalCount = useState<int>(00);

    // final totalCount = useState<int>(
    //   // "${
    //           int.parse(fatherController.text.isNotEmpty ? fatherController.text : '00')
    //         + int.parse(motherController.text.isNotEmpty ? motherController.text  : '00')
    //         + int.parse(spouseController.text.isNotEmpty ? spouseController.text  : '00')
    //         + childPer
    //
    //   // }"
    // );

    print(" total count data ------>>>>>>>>>>>  ${totalCount.value}");

    return Scaffold(
      appBar: CustomAppBar(
        title: "Beneficiary",
        backonTap: (){
        },
      ),

      body: SingleChildScrollView(
        child: StatefulBuilder(
          builder: (context,setState , ) {

            totalCount.value =   int.parse(fatherController.text.isNotEmpty ? fatherController.text : '00')
                    + int.parse(motherController.text.isNotEmpty ? motherController.text  : '00')
                    + int.parse(spouseController.text.isNotEmpty ? spouseController.text  : '00')
                    + childPer ;

            print(" total count data in under ------>>>>>>>>>>>  ${totalCount.value}");


            // totalPercentage =
             //      int.parse(fatherController.text.isNotEmpty ? fatherController.text : '00')
             //    + int.parse(motherController.text.isNotEmpty ? motherController.text  : '00')
             //    + int.parse(spouseController.text.isNotEmpty ? spouseController.text  : '00')
             //    + int.parse(childController[0].text.isEmpty ? childController[0].text  : '00')
             //    + int.parse( for(int i=1;i<75;i++) {
             //   TextEditingController _controller[i] = TextEditingController();
             // });

            return Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Column(
                children: [
                  Text(iHerebyDeclareThatMy,style: TextStyle(fontSize: 12,),),

                  Gap(10),

                  Divider(
                    height: 2,
                    thickness: 1.2,
                    color: dividerColor,
                  ),



                  rowValue(context,
                      keyText: "Father",
                      valueText: getString(prefFatherName),
                      controller: fatherController,
                      onTap: (){
                        if(fatherController.text == "00"){
                          setState((){
                            isFather.value= !isFather.value;
                          });
                        }

                      },
                    onFieldSubmitted: (value){
                     setState((){});
                    },

                  ),
                  if( isFather.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextfeild(
                        textCapitalization: TextCapitalization.none,
                        contentPadding: EdgeInsets.only(left: 10,),
                        blurRadius: 4.0,
                        maxLines: 1,
                        offset: Offset(0.0, 4,),
                        containerborder: Border.all(color: webBorder),
                        containercolor : white,
                        hinttext: "What's Your reason",
                        hintStyle: TextStyle(fontSize: 15),
                        borderRadius: BorderRadius.circular(10),
                        controller: fatherReasonController,
                        textStyle: TextStyle(fontSize: 20),

                      ),
                    ),

                  rowValue(context,
                    keyText: "Mother",
                    valueText: getString(prefMotherName),
                    controller: motherController,
                    onTap: (){

                      if(motherController.text == "00"){
                        setState((){
                          isMother.value= !isMother.value;
                        });
                      }
                    },

                    onFieldSubmitted: (value){
                      setState((){});

                    },
                  ),
                  if( isMother.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextfeild(
                        textCapitalization: TextCapitalization.none,
                        contentPadding: EdgeInsets.only(left: 10,),
                        blurRadius: 4.0,
                        maxLines: 1,
                        offset: Offset(0.0, 4,),

                        containerborder: Border.all(color: webBorder),
                        containercolor : white,
                        hinttext: "What's Your reason",
                        hintStyle: TextStyle(fontSize: 15),
                        borderRadius: BorderRadius.circular(10),
                        controller: motherReasonController,
                        textStyle: TextStyle(fontSize: 20),

                      ),
                    ),


                  rowValue(context,
                    keyText: "Spouse",
                    valueText: getString(prefMarriedSpouseName),
                    controller: spouseController,
                    onTap: (){

                      if(spouseController.text == "00" ){
                        setState((){
                          isSpouse.value= !isSpouse.value;
                        });
                      }
                    },

                    onFieldSubmitted: (value){
                      setState((){});

                    },

                  ),
                  if( isSpouse.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextfeild(
                        textCapitalization: TextCapitalization.none,
                        contentPadding: EdgeInsets.only(left: 10,),
                        blurRadius: 4.0,
                        maxLines: 1,
                        offset: Offset(0.0, 4,),

                        containerborder: Border.all(color: webBorder),
                        containercolor : white,
                        hinttext: "What's Your reason",
                        hintStyle: TextStyle(fontSize: 15),
                        borderRadius: BorderRadius.circular(10),
                        controller: spouseReasonController,
                        textStyle: TextStyle(fontSize: 20),

                      ),
                    ),

                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: childCount,
                    itemBuilder: (BuildContext context, int index) {

                      return  Column(
                        children: [
                          rowValue(context,
                            keyText: "Child ${index + 1}",
                            valueText: '${childName[index]}',

                            controller: childController[index],
                            onTap: (){

                             if(childController[index].text == "00"){
                               setState((){
                                 isReason[index] = !isReason[index];
                               });
                             }

                            },
                            onFieldSubmitted: (value){
                              setState((){});
                            },
                          ),

                          if( isReason[index] == true)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextfeild(
                                textCapitalization: TextCapitalization.none,
                                contentPadding: EdgeInsets.only(left: 10,),
                                blurRadius: 4.0,
                                maxLines: 1,
                                offset: Offset(0.0, 4,),
                                containerborder: Border.all(color: webBorder),
                                containercolor : white,
                                hinttext: "What's Your reason",
                                hintStyle: TextStyle(fontSize: 15),
                                borderRadius: BorderRadius.circular(10),
                                controller: reasonChildController[index],
                                textStyle: TextStyle(fontSize: 20),

                              ),
                            ),



                        ],
                      );
                    },),


                  // rowValue(context,
                  //   keyText: "Child 1",
                  //   valueText: '',
                  //   controller: child1Controller,
                  //   onTap: (){},
                  //   onFieldSubmitted: (value){
                  //     setState((){});
                  //   },
                  //
                  // ),




                  Gap(15),

                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding:  EdgeInsets.only(left: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total',style: GoogleFonts.inter(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w600),),
                                // Gap(2),
                                // Text(getString(prefFatherName),style: GoogleFonts.inter(fontSize: 13,color: black,fontWeight: FontWeight.w600),),

                              ],
                            ),
                          )
                      ),

                      Expanded(
                          flex: 3,
                          child: Center(
                              child: Container(
                                padding: EdgeInsets.only(right: 5,left: 5,top: 4),
                                height: 24,
                                // width: 70,
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFE1E1),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Text(
                                  '${totalCount.value} %',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w600),),
                              )
                          )
                      ),


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

                  Gap(50),

                  Center(
                    child: CustomButton(
                      title: "+ Add Another",
                      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 30),
                      onTap: (){


                        // navigationService.push(routeRecordAVideo,arguments: {navVideoRecord: false,});

                        },
                    ),
                  ),

                ],
              ),
            );
          }
        ),
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
                    child: Text(
                      "Back",
                        style: TextStyle(

                            fontSize: 15,
                            color: fullgray)),
                )
            ),
            Expanded(
                flex: 1,
                child: HookConsumer(
                  builder: (context, ref, child) {
                    return InkWell(
                      onTap: ()  async{

                        if (fatherController.text.isEmpty) {

                          displayToast( "Parentage Field  Can't Be Empty Enter Reason Father");
                        }else if (motherController.text.isEmpty) {

                          displayToast( "Parentage Field  Can't Be Empty Enter Reason");
                        }else if (spouseController.text.isEmpty){
                          displayToast( "Parentage Field  Can't Be Empty Enter Reason");
                        }else if (childController.length.toString().isEmpty){
                          displayToast( "Parentage Field  Can't Be Empty Enter Reason");
                        }else  if (totalCount.value >  100) {

                          displayToast("A Value Can't Be Above 100%");
                        }else if(totalCount.value < 100 ) {
                          displayToast("A Value Can't Be Less Then 100%");
                        }else {

                          String childNameData = "${childName}".replaceAll("[", '').replaceAll(']', '') ;

                          // print("chiassmmsd name ---->>${childNameData}");

                          ReqBeneficiary   beneficiaryData= ReqBeneficiary(
                              userId: getString(prefUserID),
                              relation: ["son" ,"father"],
                              name: [getString(prefFatherName),getString(prefMotherName),prefMarriedSpouseName,childNameData],
                              percentage: [fatherController.text ,motherController.text ,spouseController.text ,childController.length.toString()],
                              exclusionReason: [fatherReasonController.text ,motherReasonController.text ,spouseReasonController.text ,reasonChildController.length.toString()]
                          );


                          print("test data ---->>>> ${beneficiaryData.toJson()}");

                          await  ref.read(beneficiaryProvider.notifier)
                              .postBeneficiary(context: context, data: beneficiaryData).then((value) {

                                if(value!.status == 1){
                                  displayToast("${value.message}");
                                  navigationService.pushAndRemoveUntil(routeWillReview);

                                }else {
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




