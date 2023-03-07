import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';


class Account extends HookConsumerWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> account = [
      {"name": 'Complete your KYC', "icon": infoicon},
      {"name": 'Status of questiones', "icon": infoicon},
      {"name": 'Name', "icon": profile},
      {"name": 'PAN', "icon": verificationicon},
      {"name": 'Phone', "icon": callicon},
      {"name": 'Email ID', "icon": mailicon},
      {"name": 'DOB', "icon": calendericon},
      {"name": 'Address', "icon": locationicon},
      {"name": 'Plan Selected', "icon": planselectedicon},
      {"name": 'KYC Verification', "icon": verificationicon},
    ];

    keyValueData({
      required String key,
      required String value,
    }){
      return  Container(
        width: Utils.getWidth(context) - 28.w,
        decoration: BoxDecoration(
          color: bgProfileColor,
          border: Border(
            bottom: BorderSide(color: dividerProColor,width: 1.5),
          )
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(key,style: TextStyle(fontFamily: fontFamily,fontSize: 12.sp,fontWeight: FontWeight.w400),),

            Text(value,style: TextStyle(fontFamily: fontFamily,color: blue,fontSize: 15.sp,fontWeight: FontWeight.w400),),
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: gerywhite,
          leading: GestureDetector(
            onTap: () {
              navigationService.push(routeCustomDrawer);
            },
            child: Icon(
              Icons.menu, color: black, // add custom icons also
            ),
          ),
          centerTitle: true,
          title: Text("My Profile",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: fontFamily,fontSize: 16,color: black),),
          actions: <Widget>[
            // SizedBox(
            //   width: Utils.getHeight(context) * 0.05,
            // ),
            // Image.asset(
            //   icLogo,
            //   scale: 7,
            // ),
            // Spacer(),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: black,
                        size: 12,
                      ),
                      
                      Gap(5.w),

                      Text("Logout",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: fontFamily,fontSize: 12,color: black),),


                    ],
                  ),
                )),
          ]),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Gap(20.h),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                // width: Utils.getWidth(context) - 40.w,
                decoration: BoxDecoration(
                  color: white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: dividerProColor),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.0,
                          offset: Offset(0.5,0.5),
                      ),

                    ]
                ),
                padding: EdgeInsets.all(12),
                child: Row(

                  children: [

                    CircleAvatar(
                     radius: 14,
                      backgroundColor: webNeeded,
                      child: Text("!",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w800,color: white,fontFamily: fontFamily),),
                    ),

                    Gap(20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(CompleteYour,style: TextStyle(fontFamily: fontFamily,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                       Gap(4.h),
                        Text(goDigitalSave,style: TextStyle(fontFamily: fontFamily,color: blackLight,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                      ],
                    ),

                  ],
                ),
              ),

              Gap(20.h),

              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(accounts,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 0.8),),
              ),

              Gap(30.h),

              // Container(
              //   width: Utils.getWidth(context) - 28.w,
              //       color: bgProfileColor,
              //   padding: EdgeInsets.all(12),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Full Name",style: TextStyle(fontFamily: fontFamily,fontSize: 12.sp,fontWeight: FontWeight.w400),),
              //       Gap(2.h),
              //       Text("John Doe",style: TextStyle(fontFamily: fontFamily,color: blue,fontSize: 15.sp,fontWeight: FontWeight.w400),),
              //     ],
              //   ),
              // ),

              keyValueData(key: "Full Name", value: "john Doe"),
              // Divider(color: dividerProColor,height: 1,thickness: 1,),


              keyValueData(key: "DOB", value: "Invalid date"),
              // Divider(color: dividerProColor,height: 1,thickness: 1,),


              keyValueData(key: "Email", value: "johndoe123@gmail.com"),
              
              
              Gap(10.h),


              keyValueData(key: "Mobile", value: "+91 20255 50181"),
              // Divider(color: dividerProColor,height: 1,thickness: 1,),


              keyValueData(key: "Address", value: "Address line 1\nAddress line 2\nAddress line 3"),

              Gap(10.h),
              keyValueData(key: "KYC Verification", value: "Pending"),
              keyValueData(key: "Aadhaar Number", value: "xxxx xxxx xxxx"),
              keyValueData(key: "PAN Number", value: "xxxxx5522H"),
              keyValueData(key: "Plan Selected", value: "Gold - Yearly (Valid till dd/mm/yyyy)"),


              Gap(30.h),

              // ListView.builder(
              //     physics:
              //     ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              //     itemCount: account.length,
              //     shrinkWrap: true,
              //     itemBuilder: (BuildContext context, int index) {
              //       return  Column(
              //         children: [
              //           Container(
              //             padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
              //             color: lowwhite,
              //             child: Row(
              //               children: [
              //                 Image.asset( account[index]["icon"], scale: 4,),
              //                 Gap(30),
              //                 Expanded(
              //                   child: Text(
              //                     account[index]["name"],
              //                     style:
              //                     TextStyle(color: Colors.black, fontSize: 16),
              //                   ),
              //                 ),
              //
              //                 Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
              //               ],
              //             ),
              //           ),
              //           Divider(
              //             color: blue,height: 0.0,
              //             thickness: 1.5,
              //           ),
              //
              //
              //         index == 1 ? Gap(35) : Gap(7),
              //         ],
              //       );
              //     }),

              // Gap(150),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: Utils.getHeight(context) * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff037EEE).withOpacity(0.15),
              offset: const Offset(0.0, -1),
              blurRadius: 0.5,
              spreadRadius: 0.3,
            ), //BoxShadow
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  navigationService.push(routeKycScreen);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Deactivate Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xff727272))),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () async{

                  },
                  child: Container(
                    height: Utils.getHeight(context) * 0.08,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff3C87E0).withOpacity(0.9),
                          Color(0xff0E3563).withOpacity(0.9)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                  ),
                )),
          ],
        ),
      ),


    );
  }
}
