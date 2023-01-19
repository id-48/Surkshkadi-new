import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar_web.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class AddInfoWeb extends HookConsumerWidget {

  const AddInfoWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueController = useTextEditingController();
    final emailController = useTextEditingController();
    final statee = useState<String>("");
    final cityy = useState<String>("");
    final imageList = useState<List<XFile>>([]);
    final ImagePicker _picker = ImagePicker();
    XFile? image;


    Widget selectedImageViewer() {
      return ClipRRect(
        // borderRadius: BorderRadius.circular(15),
        child: imageList.value.isNotEmpty
            ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(15.0),
            child: Image.network(File(image!.path).path,
              fit: BoxFit.cover, height: 100,width: 100,),
          ),
        )
            :
        Container(
          // color: redFroly,
          // height: 100,
          child: Row(
            children: [
              Image.asset(webCamera,scale: 4,),

            ],
          ),
        ),
      );
    }



    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LogoBackButton(backButton: true),

            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.20 : 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(30),
                  Text(confirmation,style: GoogleFonts.bonaNova (textStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),),
                  Gap(30),
                  Text(
                    shareMoreDetails,
                    style: TextStyle(color: blue, fontSize: 18),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.02,
                  ),
                  Container(
                    // height: Utils.getHeight(context) * 0.22,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: lightsky,
                          border: Border.all(color: blue),
                          boxShadow: [
                            BoxShadow(
                                color: black12.withOpacity(0.05), //New
                                blurRadius: 6.0,
                                offset: Offset(-3, 5))
                          ],
                        ),
                        child: CustomTextfeild(height: Utils.getHeight(context) * 0.22,
                          textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                          containercolor: lightsky,
                          borderRadius: BorderRadius.circular(7),
                          blurRadius: 0.0,textCapitalization: TextCapitalization.none,
                          offset: Offset(0, 0),
                          controller: issueController,
                          border: InputBorder.none,
                          hinttext: 'Please add details here.',
                          maxLines: 10,
                          hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
                          prefix: Column(
                            children: [
                              Gap(6),
                              Image.asset(textlineicon, scale: 4,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.03,
                  ),
                  Text(
                    beforeWeProceeFill,
                    // style: TextStyle(color: blue, fontSize: 15),
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                      fontSize: 18,
                      color: blue,
                    )),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.017,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2, top: 7),
                    child: Text(
                      emailId,
                      style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                  ),
                  Container(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: CustomTextfeild(
                          textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                          blurRadius: 5.0,
                          offset: Offset(-1, 1),textCapitalization: TextCapitalization.none,
                          containerborder: Border.all(color: blue),
                          containercolor: lightsky,
                          maxLines: 1,
                          borderRadius: BorderRadius.circular(7),
                          controller: emailController,
                          hinttext: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
                          prefix: Icon(
                            Icons.email_outlined,
                            color: Color(0xffD6D6D6),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.007,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 7),
                    child: Text(
                      states,
                      style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: lightsky,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                                color: black12, //New
                                blurRadius: 5.0,
                                offset: Offset(-1, 3))
                          ],
                        ),
                        child: CustomSelectWeb(
                          borderCon: BorderSide(
                            width: 1.0,
                            color: blue,
                          ),
                          boxShadow: [],
                          onChanged: (val) {
                            statee.value = val;
                          },
                          items: ['Gujarat', 'Goa', 'Mumbai'],
                          hint: 'Choose your state',
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                              right: 15,
                            ),
                            child: Image.asset(
                              state,
                              scale: 3.8,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.007,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 7),
                    child: Text(
                      city,
                      style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: lightsky,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                              color: black12,
                              blurRadius: 5.0,
                              offset: Offset(-1, 3))
                        ],
                      ),
                      child: CustomSelectWeb(
                        borderCon: BorderSide(
                          width: 1.0,
                          color: blue,
                        ),
                        boxShadow: [],
                        onChanged: (val) {
                          cityy.value = val;
                        },
                        items: ['Amreli', 'Surat', 'Ahemdabad'],
                        hint: 'Choose your city',
                        prefix: Padding(
                          padding: EdgeInsets.only(
                            top: 0,
                            right: 15,
                          ),
                          child: Image.asset(
                            cityicon,
                            scale: 3.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.03,
                  ),
                  Divider(
                    thickness: 4,
                    color: textFieldBorder,
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.03,
                  ),
                  Container(
                    width: Utils.getWidth(context),
                    height: Utils.getHeight(context) * 0.055,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Gap(5),
                        Icon(
                          Icons.attach_file,
                          size: 25,
                          color: white,
                        ),
                        Gap(20),
                        Text(
                          attachDocument,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.08,
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context,setState){
                        return Custom_Dottedborder(
                          padding: EdgeInsets.only(left: 16,top: 20,right: 16,bottom: 20),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(clickPhoto,),
                                Gap(14),
                                Row(
                                  children: [
                                    selectedImageViewer(),
                                    Gap(20),
                                    InkWell(
                                      onTap: () async {
                                        image = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        if (image != null) {
                                          imageList.value.add(image!);
                                          setState(() {});
                                          print("SUCCES");
                                        }
                                      },
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(uploadImage,style: TextStyle(fontSize: 13,),),
                                            Text(uploadMultipleImage,style: TextStyle(fontSize: 13,color: dividerColor),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.1,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        navigationService.push(routePaymentConfoSpeciWeb);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Utils.getHeight(context) * 0.1,
                  ),
                ],
              ),
            ),

            CustomWebBottomBar(
              bgColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
