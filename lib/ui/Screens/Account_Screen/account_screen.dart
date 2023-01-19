import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        backonTap: () {},
        title: '${accounts}',
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 20),
                child: Text(avinashSahini,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 0.8),),
              ),

              ListView.builder(
                  physics:
                  ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                  itemCount: account.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return  Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 20,top: 12,bottom: 12),
                          color: lowwhite,
                          child: Row(
                            children: [
                              Image.asset( account[index]["icon"], scale: 4,),
                              Gap(30),
                              Expanded(
                                child: Text(
                                  account[index]["name"],
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),

                              Icon(Icons.arrow_forward_ios,size: 25,color: blue,),
                            ],
                          ),
                        ),
                        Divider(
                          color: blue,height: 0.0,
                          thickness: 1.5,
                        ),


                      index == 1 ? Gap(35) : Gap(7),
                      ],
                    );
                  }),

              Gap(150),
            ],
          ),
        ),
      ),
    );
  }
}
