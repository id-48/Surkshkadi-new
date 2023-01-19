import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/immovable_property_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

import '../../../widgets/custom_dottedborder.dart';


class AssetsInformation extends HookConsumerWidget {
  var dattaa;
  int selectedindex;

  AssetsInformation(
      {Key? key, required this.dattaa, required this.selectedindex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ImagePicker _picker = ImagePicker();

    XFile? image;
    final pickedImage = useState<File>(File(""));
    final isPicked = useState<bool>(false);

    final boxController = useTextEditingController();
    final messageController = useTextEditingController();



    return Scaffold(
      appBar: CustomAppBar(
        backonTap: () {
          Navigator.pop(context);
        },
        title: "${assetsInformation}",
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconText(context),

              header(context, image: immovable, title: "Immovable Assets", description: "(Property)"),

              Gap(16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomExpandableCardCode(
                  index: 0,
                  isExpanded: ValueNotifier(1),
                  border:  Border.all(color: blue),
                  height: 40,
                  name: "Type of Property",
                  textColor: white,
                  iconColor: white,
                  boxcolor: blue,
                  expandedChild: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // height: 150,
                    // width: Utils.getWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      color: white,
                      // border: Border.all(color: blue),
                    ),

                    child: Column(
                      children: [
                        // ...dattaa["description"]
                        //     .map(
                        //       (e) =>
                              GestureDetector(
                                onTap: (){

                                     Navigator.push(context, MaterialPageRoute(builder: (context)  => ImmovableProperty()));
                                  //     colorBox == true ?
                                  // navigationService.push(routeAssetsInformation,arguments: {navSelectedindex: data["description"].indexOf(e),navDattaa: data,});
                                  // :
                                  // navigationService.push(routeAssetsInformationWeb,arguments: {navSelectIndex : data["description"].indexOf(e), navSelectDattaa : data });
                                  //  data.indexof(e);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(thickness: 1.2, endIndent: 0, color: blue,height: 0,),

                                    Container(
                                      height: 100,
                                      width: Utils.getWidth(context),
                                      padding: EdgeInsets.only(left: 20,top: 6,bottom: 6),

                                    ),



                                  ],
                                ),
                              ),
                        // )
                        //     .toList(),
                      ],
                    ),
                  ),
                ),
              ),


              Gap(16),

              expandRow(context,controller: boxController,title: "Property Address"),
              expandRow(context,controller: boxController,title: "Rough Value of the Property"),

              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Text(
                          'Type of Ownership',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        )),
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          Expanded(flex: 1,child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: lightsky,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: blue),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26, blurRadius: 2.0, offset: Offset(2,2)),
                              ],
                            ),
                            child: Text("Single",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: blue),),
                           ),
                          ),
                          
                          Gap(8),

                          Expanded(flex: 1,child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: lightsky,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: blue),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26, blurRadius: 2.0, offset: Offset(2,2)),
                              ],
                            ),
                            child: Text("Joint",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: blue),),
                           ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              expandRow(context,controller: boxController,title: "Details of the Loan(If Taken)"),
              expandRow(context,controller: boxController,title: "Details of the Insurance(If Taken)"),

              Gap(16),
              Padding(
                padding: EdgeInsets.only(left: 15),
                  child: Text(addAnother,style: TextStyle(fontWeight: FontWeight.w500,color: blueee ,fontSize: 12),)),
              Gap(10),

              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(noteACopyYour,style: TextStyle(fontWeight: FontWeight.w400,color: black ,fontSize: 12,fontFamily: fontFamily),)),

              assetsPhotoText(context,controller: messageController),

              Center(
                child: CustomButton(
                  title: continuee,
                  padding:
                  EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: () {
                    navigationService.push(routeCustomeBottomNavigationBar,);
                  },
                ),
              ),
              SizedBox(
                height: Utils.getHeight(context) * 0.023,
              ),


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
      //               alignment: Alignment.center,
      //               child: Text(
      //                 "Raise a ticket",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15,
      //                       color: blue)),
      //           )
      //       ),
      //       Expanded(
      //           flex: 1,
      //           child: HookConsumer(
      //             builder: (context, ref, child) {
      //               return InkWell(
      //                 onTap: ()  {
      //                   navigationService.push(routeCustomeBottomNavigationBar,);
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
    );
  }
}
