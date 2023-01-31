import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';

import '../../../di/locator.dart';

class MyProfile extends HookConsumerWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: myProfile,
        menuIcon: true,
        menuonTap: (){
         navigationService.pop();
        },
        notificationIcon: false,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(19.h),

            Center(
              child:  Container(
                height: 84,
                width: 92,
                decoration: BoxDecoration(
                    color: lavenderGrey,
                    shape: BoxShape.circle,
                ),
                child: Container(child: Image.asset(clientIcon,scale: 4,fit: BoxFit.contain,)),
              ),
            ),

            Gap(6.h),
            Center(
              child: Text("John Doe",style: TextStyle(fontSize: 16.sp,fontFamily: fontFamily,fontWeight: FontWeight.w600,),),
            ),

            Gap(24.h),

            SizedBox(
              height: 58.h,
              child: Row(
                children: [
                  Expanded(flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgProfileColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(callIconTwo,scale: 4,color: blue,),
                            Gap(6.h),

                            Text("audio",style: TextStyle(fontFamily: fontFamily,fontSize: 13.sp,fontWeight: FontWeight.w400,color: blue),)

                          ],
                        ),
                      ),
                  ),
                  Gap(14.w),
                  Expanded(flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: bgProfileColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(videoIcon,scale: 4,color: blue,),
                          Gap(6.h),
                          Text("video",style: TextStyle(fontFamily: fontFamily,fontSize: 13.sp,fontWeight: FontWeight.w400,color: blue),)


                        ],
                      ),
                    ),
                  ),
                  Gap(14.w),
                  Expanded(flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: bgProfileColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search,color: blue,),

                          Text("search",style: TextStyle(fontFamily: fontFamily,fontSize: 13.sp,fontWeight: FontWeight.w400,color: blue),)


                        ],
                      ),
                    ),
                  ),
                  Gap(14.w),
                  Expanded(flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: bgProfileColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(momentsIcon,scale: 4,color: blue,),
                          Gap(6.h),
                          Text("moments",style: TextStyle(fontFamily: fontFamily,fontSize: 13.sp,fontWeight: FontWeight.w400,color: blue),)


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(19.h),

            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                  Gap(3.h),
                  Text("John",style: TextStyle(fontSize: 14.sp,color: blue,fontFamily: fontFamily),),
                ],
              ),
            ),

            Divider(
              color: dividerProColor,
              thickness: 1,
              height: 0,
            ),


            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Last Name",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                  Gap(3.h),
                  Text("Doe",style: TextStyle(fontSize: 14.sp,color: blue,fontFamily: fontFamily),),
                ],
              ),
            ),

            Divider(
              color: dividerProColor,
              thickness: 1,
              height: 0,
            ),

            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                  Gap(3.h),
                  Text("johndoe123@gmail.com",style: TextStyle(fontSize: 14.sp,color: blue,fontFamily: fontFamily),),
                ],
              ),
            ),

            Gap(16.h),

            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("mobile",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                  Gap(3.h),
                  Text("+1 202 5555 0181",style: TextStyle(fontSize: 14.sp,color: blue,fontFamily: fontFamily),),
                ],
              ),
            ),

            Divider(
              color: dividerProColor,
              thickness: 1,
              height: 0,
            ),


            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("username",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                      Gap(3.h),
                      Text("@John_doe10",style: TextStyle(fontSize: 14.sp,color: blue,fontFamily: fontFamily),),
                    ],
                  ),

                  Image.asset(scanBarcodeIcon,scale: 4,),
                ],
              ),
            ),

            Divider(
              color: dividerProColor,
              thickness: 1,
              height: 0,
            ),

            Container(
              width: double.infinity,
              color: bgProfileColor,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("bio",style: TextStyle(fontSize: 12.sp,fontFamily: fontFamily),),
                  Gap(3.h),
                  Text("Lorem ipsum dolor sit amet.",style: TextStyle(fontSize: 14.sp,fontFamily: fontFamily),),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
