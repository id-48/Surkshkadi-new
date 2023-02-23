import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/beneficiary_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

import '../../../utils/strings.dart';


class WillReview extends HookConsumerWidget {
  const WillReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
    final check = useState<bool>(false);
    final issueController = useTextEditingController();
    return WillPopScope(
      onWillPop: (){
        navigationService.push(routeCustomBottomNavigationBar);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: willReview,
          backonTap: () {
            navigationService.push(routeCustomBottomNavigationBar);

          },
          notionTap: () {},
        ),

        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Gap(20),
                // Text(loremIpsumDolorSit,
                // style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                //
                // Gap(15),
                //
                // Text(loremIpsumDolorSitLongName,
                //   style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),


                Text("I ${getString(prefUserName)}, s/o Shri ${getString(prefFatherName)}, residing at ${getString(prefAddress)}, aged about <AGE> years, occupation ${getString(prefOccupation)}, declare this deed to be my last will and testament.",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12),),

                Gap(10),

                Text(iMaintainGood,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),



                Gap(10),

                Text(iHaveNotMadeAny,
                style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                Gap(10),

                Text(iAppointSurakshakadiDigital,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),


                Gap(10),

                Text(iHaveTheFollowing,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12),),

                Gap(8),

                Text("   1.   I am married to ${getString(prefMarriedSpouseName)}.",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                // Gap(10),

                Text("   2.   My father's name is ${getString(prefFatherName)}.",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                // Gap(10),

                Text("   3.   My mother's name is ${getString(prefMotherName)}.",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),


                Gap(10),

                Text(iHerebyDeclareThatAfter,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                Gap(10),

                Text(allUtilities,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                Gap(10),

                Text(iHerebyDeclareThatIHave,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12),),

                Gap(10),

                Text(InCasesWhereAnyClose,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,color: redFroly),),

                Gap(10),

                Text(ifABeneficiaryIsAMinor,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,),),

                Gap(10),

                Text("IN WITNESS WHEREOF, I have signed my name on ${getString(prefDOB)} at ${getString(prefCity)}, ${getString(prefState)}, declaring and publishing this instrument as my Last Will, in the presence of the undersigned witnesses, who witnessed this Last Will at my request, and in my presence.",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12),),

                Gap(30),

                Text(getString(prefUserName),
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12,),),

                Gap(34),

                SizedBox(
                  width: 100,
                  child: Divider(
                    height: 7,
                    color: dividerColor,
                    thickness: 1.5,
                  ),
                ),

                Text('  (Testators Signature)',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,),),

                Gap(22),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff8FB5E2),width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff8FB5E2).withOpacity(0.4),
                        blurRadius: 2,
                        offset: Offset(0.0 , 2.0)
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Witness 1',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14,),),
                      Gap(8),
                      Divider(
                        height: 3,
                        color: dividerColor,
                        thickness: 1,
                      ),

                      Gap(12),

                      rowText(context,keyText: "Name",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "Address",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "City",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "Occupation",valueText: ""),
                      Gap(8),



                    ],
                  ),
                ),

                Gap(20),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff8FB5E2),width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff8FB5E2).withOpacity(0.4),
                            blurRadius: 2,
                            offset: Offset(0.0 , 2.0)
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Witness 2',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14,),),
                      Gap(8),
                      Divider(
                        height: 3,
                        color: dividerColor,
                        thickness: 1,
                      ),

                      Gap(12),

                      rowText(context,keyText: "Name",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "Address",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "City",valueText: ""),
                      Gap(12),
                      rowText(context,keyText: "Occupation",valueText: ""),
                      Gap(8),



                    ],
                  ),
                ),

                Gap(30),

                Center(
                  child: CustomButton(
                    title: submit,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                    onTap: (){
                      // setString(prefIssueDetail, issueController.text);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Beneficiary() ));

                      // navigationService.push(routeRecordAVideo,arguments: {navVideoRecord: false,});
                    },
                  ),
                ),


                Gap(40),




                // Row(
                //   children: [
                //     InkWell(
                //       onTap: (){
                //         check.value = !check.value;
                //       },
                //       child: Container(
                //         height: 19,
                //         width: 20,
                //         // padding: EdgeInsets.only(right: 3,bottom: 3),
                //         decoration: BoxDecoration(
                //           color: check.value == true ? blue : white,
                //           borderRadius: BorderRadius.circular(3),
                //           border: Border.all(color: blue),
                //           // boxShadow: [ BoxShadow(
                //           //     color: Colors.black54, //New
                //           //     blurRadius: 2.0,
                //           //     offset: Offset(0,3))],
                //         ),
                //         child: Icon(Icons.check,color: white,size: 18,),
                //       ),
                //     ),
                //
                //
                //     Gap(10),
                //
                //     Text(iAgreeTo,
                //       style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),)
                //
                //   ],
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 28,),
                //   child: Text(asPerDoc,
                //     style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                // ),
                // Gap(10),
                // CustomTextfeild(
                //   height: 85,
                //   contentPadding: EdgeInsets.only(top: 4,left: 8,),
                //   containerborder: Border.all(color: textFieldBorder),
                //   containercolor: white,borderRadius: BorderRadius.circular(5),
                //     controller: issueController,
                //     blurRadius: 0.0,
                //     offset: Offset(0.0,0.0),maxLines: 4,
                //     border: InputBorder.none,
                //     hinttext: 'Have an issue?\nWrite to us here.',
                //      hintStyle: TextStyle(
                //        fontSize: 13,
                //      ), textCapitalization: TextCapitalization.none,
                // ),

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
        //             alignment: Alignment.center,
        //             child: Text(
        //                 back,
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 15,
        //                     color: blue)),
        //           )
        //       ),
        //       Expanded(
        //           flex: 1,
        //           child: HookConsumer(
        //             builder: (context, ref, child) {
        //               return InkWell(
        //                 onTap: ()  {
        //                   // if(check.value) {
        //                   //   setString(prefIssueDetail, issueController.text);
        //                   //   navigationService.push(routeRecordAVideo,arguments: {navVideoRecord: false,});
        //                   // }else{
        //                   //   displayToast("Please Agree Terms And Conditions");
        //                   // }
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
      ),
    );
  }

  rowText (context,{
  required  String keyText,
  required  String valueText
  }){
    return    Row(
      children: [
        Gap(6),
        Expanded(
          flex: 3,
          child:  Text(keyText,
            style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14,),),

        ),

        Text(':',
          style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14,),),


        Expanded(
          flex: 7,
          child:  Text(valueText,
            style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14,),),

        ),

      ],
    );
  }

}
