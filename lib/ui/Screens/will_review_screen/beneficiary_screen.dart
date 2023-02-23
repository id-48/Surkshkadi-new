import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

class Beneficiary extends HookConsumerWidget {
  const Beneficiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final fatherController = useTextEditingController(text: "100.00");
    final motherController = useTextEditingController(text: "00.00");
    final spouseController = useTextEditingController(text: "00.00");
    final child1Controller = useTextEditingController(text: "00.00");
    final child2Controller = useTextEditingController(text: "00.00");


    rowValue (context,{
      required String keyText,
      required String valueText,
      required TextEditingController controller,
      required void Function()? onTap,
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
                                offset: Offset(0.0,0.0),
                                blurRadius: 0.0,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)
                                ),
                                containercolor: Color(0xffDEE8FF),
                                controller: controller,
                                contentPadding: EdgeInsets.only(left: 4,top: -13,bottom: 12),
                                textInputType: TextInputType.numberWithOptions(decimal: true,signed: false),
                                maxLines: 1,
                                maxLength: 6,
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


    return Scaffold(
      appBar: CustomAppBar(
        title: "Beneficiary",
        backonTap: (){
        },
      ),

      body: Padding(
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
                valueText: '',
                // valueText: getString(prefFatherName),
                controller: fatherController,
                onTap: (){},
            ),

            rowValue(context,
              keyText: "Mother",
              valueText: '',
              // valueText: getString(prefMotherName),
              controller: motherController,
              onTap: (){},
            ),


            rowValue(context,
              keyText: "Spouse",
              valueText: '',
              // valueText: getString(prefMarriedSpouseName),
              controller: spouseController,
              onTap: (){},
            ),


            rowValue(context,
              keyText: "Child 1",
              valueText: '',
              controller: child1Controller,
              onTap: (){},
            ),

            rowValue(context,
              keyText: "Child 2",
              valueText: '',
              controller: child2Controller,
              onTap: (){},
            ),



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
                          padding: EdgeInsets.only(right: 5),
                          height: 24,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color(0xffFFE1E1),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextfeild(
                                  textStyle: GoogleFonts.inter(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w600),
                                  textCapitalization: TextCapitalization.none,
                                  offset: Offset(0.0,0.0),
                                  blurRadius: 0.0,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)
                                  ),
                                  containercolor: Color(0xffFFE1E1),
                                  controller: fatherController,
                                  contentPadding: EdgeInsets.only(left: 4,top: -13,bottom: 12),
                                  textInputType: TextInputType.numberWithOptions(decimal: true,signed: false),
                                  maxLines: 1,
                                  maxLength: 6,
                                ),
                              ),
                              Text('%',style: GoogleFonts.inter(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w600),),
                            ],
                          ),
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

                  navigationService.push(routeRecordAVideo,arguments: {navVideoRecord: false,});

                  },
              ),
            ),
            
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




