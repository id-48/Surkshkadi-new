import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';


class RecordAVideo extends HookConsumerWidget {
  final String textIssue;
  const RecordAVideo({Key? key,required this.textIssue}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: recordAVideo,
        backonTap: () {
          Navigator.pop(context);
        },
        notionTap: (){},
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        child: Column(
          children: [
            Gap(10),
            Row(
              children: [
                Gap(20),
                Image.asset(videoIcon,scale: 4,),
                Gap(20),
                Text(loremIpsumDolorSitSmallName,style: TextStyle(fontSize: 13,color: blue),),
              ],
            ),
            Gap(20),
            Container(
              height: 200,
              width: Utils.getWidth(context),
              decoration: BoxDecoration(
                border: Border.all(color: bordervideo,width: 1.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(videoIcon,scale: 4,color: black,),
            ),
            Gap(50),
            Container(
                width: Utils.getWidth(context),
                child: Text(loremIpsumDolorSit,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),)
            ),
            Gap(60),
            Center(
              child: CustomButton(
                title: submit,
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                onTap: () {
                 navigationService.push(routeAssetScreen);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
