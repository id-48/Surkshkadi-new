import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';

class ReferAndEarn extends HookConsumerWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: blue,
                  image: DecorationImage(
                    image: AssetImage(referBg),
                    fit: BoxFit.fill,
                    // scale: 4,

                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(40.h),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                          onTap: (){
                            navigationService.pop();
                          },
                          child: Icon(Icons.arrow_back_ios,size: 25,)),
                    ),


                    Center(
                      child :  Image.asset(introOffer,scale: 4,),
                    ),

                    Gap(24.h),


                    Text(get300Points,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.sp,fontFamily: fontFamily,fontWeight: FontWeight.w700),
                    ),

                    Gap(24.h),


                    Row(
                      children: [
                        Gap(40.w),
                        Expanded(
                          child: Text(withOurReferral,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily,fontWeight: FontWeight.w600,color: Color(0xff919191)),
                          ),
                        ),
                        Gap(40.w),

                      ],
                    ),

                    Gap(40.h),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(addFriend,scale: 4,),
                                Gap(16.h),
                                Text("For Your\nFriends",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: fontFamily,fontSize: 14.sp),),
                              ],
                            ),
                          ),
                        ),


                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(referralIn,scale: 4,),
                                Gap(16.h),
                                Text("Referral\nIncentive",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w700,fontFamily: fontFamily,fontSize: 14.sp),),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(unPoint,scale: 4,),
                                Gap(16.h),
                                Text("Unlimited\nPoints",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: fontFamily,fontSize: 14.sp),),
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

          Expanded(
            flex: 4,
            child: Stack(
              clipBehavior: Clip.none,
              // color: Colors.white,
              children: [

                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Gap(100.h),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        width: Utils.getWidth(context) - 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: dividerProColor)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Container(
                              height: 35.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: navyLight,),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Gap(20.w),
                                  Text("https://surakshakadi.com/#",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.sp),),

                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      FlutterClipboard.copy('https://surakshakadi.com/#');
                                      displayToast("Copied Text");
                                    },
                                    child: Container(
                                      height: 26.h,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                                      decoration: BoxDecoration(
                                        color: navyLight,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text("Copy Link",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.sp,color: buttonColor),),
                                    ),
                                  ),

                                  Gap(3.w),

                                ],
                              ),
                            ),
                            
                            Gap(16.h),

                            Center(
                              child: Container(
                                height: 35.h,
                                width: 160.w,
                                // padding: EdgeInsets.symmetric(horizontal: 30.w),
                                decoration: BoxDecoration(
                                 color: whatsAppGreen,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.whatsapp,size: 20,color: white,),

                                    Gap(10),
                                    
                                    Text("Refer Now",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: white,fontFamily: fontFamily),),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Gap(50.h),

                    ],
                  ),
                ),

                Positioned(
                  top: -30,
                    child: Container(
                      height: 100.h,
                      margin: EdgeInsets.symmetric(horizontal: 35.w),
                      width: Utils.getWidth(context) - 70.w,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            offset: Offset(2.0, 2.0)
                          ),
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              offset: Offset(-2.0, -2.0)
                          ),
                        ]
                      ),
                      child: Column(
                        children: [
                          Gap(25.h),
                          Text("TOTAL POINTS",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily,fontWeight: FontWeight.w600,color: greenjerry),),
                          Gap(12.h),
                          Text("0.00",style: TextStyle(fontSize: 18.sp,fontFamily: fontFamily,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
