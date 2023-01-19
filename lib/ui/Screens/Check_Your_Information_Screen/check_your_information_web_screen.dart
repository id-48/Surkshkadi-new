import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_web_screen.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/components.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class CheckYourInfoWeb extends HookConsumerWidget {
  const CheckYourInfoWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LogoBackButton(),

            Gap(50),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.22 : 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(checkYourInformation,style: GoogleFonts.bonaNova (textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),),
                        Gap(20),
                        Text(informationCorrect,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                        Gap(10),
                        SizedBox(
                          width: MediaQuery.of(context).orientation == Orientation.landscape ? 550 : MediaQuery.of(context).size.width - 33,
                          child: Row(
                            children: [
                              Expanded(child: Text(beforeWeProceeds,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: deepindigo),)),
                            ],
                          ),
                        ),

                        Gap(40),

                        SizedBox(
                          width: MediaQuery.of(context).orientation == Orientation.landscape ?   MediaQuery.of(context).size.width * 0.45 :  MediaQuery.of(context).size.width - 33 ,

                          child: Row(children: [
                            Text(personalInfo,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                            Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,color: oreng,size: 20,),
                                  Gap(10),
                                  Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng,fontSize: 16),),
                                ],
                              ),
                            ),

                          ],),
                        ),
                        Gap(5),
                        Container(
                          color: dividerColor,
                          height: 1,
                          width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.47 : MediaQuery.of(context).size.width - 33 ,
                        ),
                        Gap(10),

                        KeyValue(
                            keyy: fullName,
                            valuee: 'Avinash Sahani'
                        ),
                        KeyValue(
                            keyy: dob,
                            valuee: '22/04/1975'
                        ),

                        KeyValue(
                            keyy: gender,
                            valuee: 'Male'
                         ),

                        KeyValue(
                            keyy: states,
                            valuee: 'Maharashatra'
                        ),

                        KeyValue(
                            keyy: city,
                            valuee: 'Pune'
                        ),

                        KeyValue(
                            keyy: pinCode,
                            valuee: '411028'
                        ),

                        Gap(30),

                        SizedBox(
                          width: MediaQuery.of(context).orientation == Orientation.landscape ?   MediaQuery.of(context).size.width * 0.45 :  MediaQuery.of(context).size.width - 33 ,

                          child: Row(children: [
                            Text(contactInfo,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                            Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,color: oreng,size: 20,),
                                  Gap(10),
                                  Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng,fontSize: 16),),
                                ],
                              ),
                            ),

                          ],),
                        ),
                        Gap(5),
                        Container(
                          color: dividerColor,
                          height: 1,
                          width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.47 : MediaQuery.of(context).size.width - 33 ,
                        ),
                        Gap(10),

                        KeyValue(
                            keyy: emaill,
                            valuee: 'avinash.sahani78@gmail.com'
                        ),

                        KeyValue(
                            keyy: mobileNumber,
                            valuee: '84XXXXXXX5'
                        ),

                        KeyValue(
                            keyy: address,
                            valuee: ''
                        ),

                        Gap(30),

                        SizedBox(
                          width: MediaQuery.of(context).orientation == Orientation.landscape ?   MediaQuery.of(context).size.width * 0.45 :  MediaQuery.of(context).size.width - 33 ,

                          child: Row(children: [
                            Text(professionalInfo,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                            Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,color: oreng,size: 20,),
                                  Gap(10),
                                  Text(edit,style: TextStyle(fontWeight: FontWeight.bold,color: oreng,fontSize: 16),),
                                ],
                              ),
                            ),

                          ],),
                        ),
                        Gap(5),
                        Container(
                          color: dividerColor,
                          height: 1,
                          width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.47 : MediaQuery.of(context).size.width - 33 ,
                        ),
                        Gap(10),

                        KeyValue(
                            keyy: occupation,
                            valuee: 'Government Employee'
                        ),

                        KeyValue(
                            keyy: income,
                            valuee: '2 Lakhs - 5 Lakhs per anum'
                        ),




                      ],
                    ),

                    SizedBox(
                      width:  16,
                    ),

                  ],
                ),
              ],
            ),

            Gap(70),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssetsWeb()));
                // navigationService.push(routePartnerWithWeb);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                child:
                Text(continuee, style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),
                decoration: BoxDecoration(
                  // color: blue,
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff3C87E0).withOpacity(0.9),
                        Color(0xff0E3563).withOpacity(0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    )
                  ],

                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Gap(70),

            CustomWebBottomBar(bgColor: true,),


          ],
        ),
      ),
    );
  }
}
