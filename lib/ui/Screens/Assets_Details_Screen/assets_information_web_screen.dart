import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_logo_backbutton.dart';
import 'package:surakshakadi/widgets/custom_web_bottombar.dart';

class AssetsInformationWeb extends HookConsumerWidget {
  var selectdattaa;
  int selectindex;
   AssetsInformationWeb({Key? key,required this.selectdattaa,required this.selectindex}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final imageList = useState<List<XFile>>([]);
    final ImagePicker _picker = ImagePicker();
    XFile? image;

    final addressHouseController = useTextEditingController();
    final societyNameController = useTextEditingController();
    final landmarkAreaController = useTextEditingController();
    final districtController = useTextEditingController();
    final pinCodeController = useTextEditingController();
    final postOfficeController = useTextEditingController();
    final khasraNoController = useTextEditingController();


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
              Gap(10),
              Image.asset(webCamera,scale: 4,),
              Gap(10),
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
            LogoBackButton(backButton: false),
            Gap(40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.21 : 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.22 : 16),
                      Text(assetsInformation,style: GoogleFonts.bonaNova(textStyle:  TextStyle(fontSize: 22,fontWeight: FontWeight.w700)),),
                    ],
                  ),

                  Gap(30),
                  Container(
                    child: Row(
                      children: [
                        // Gap(MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.22 : 16),
                        Image.asset(iconRight,scale: 3,),

                        Gap(30),

                        Expanded(child: Text(privacyHeadline,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: blue),)),
                      ],
                    ),
                  ),

                  Gap(30),

                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.21 : 16),
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 20),
                    decoration: BoxDecoration(
                      color:whiteindigo,
                      boxShadow: [
                        BoxShadow(
                          color: black12,
                          blurRadius: 2.0,
                          offset: Offset(0.0,4.0),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          // bank,
                          selectdattaa["image"],
                          scale: 3,
                        ),
                        Gap(26),
                        Text(
                          // "Immovable Assets",
                          selectdattaa["title"],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 20,letterSpacing: 1
                          ),
                        ),

                      ],
                    ),
                  ),

                  Gap(30),

                  Container(
                    color: blue,
                    width: Utils.getWidth(context),
                    padding: EdgeInsets.only(left: 20,top: 16,bottom: 16),
                    child: Text(typeOfLand,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 24,color: white),),
                   ),

                  Gap(20),
                  FillTextField(
                      title: addressHouse,
                      controller: addressHouseController,
                  ),

                  Gap(12),
                  FillTextField(
                    title: societyName,
                    controller: societyNameController,
                  ),

                  Gap(12),
                  FillTextField(
                    title: landmarkArea,
                    controller: landmarkAreaController,
                  ),

                  Gap(12),
                  FillTextField(
                    title: district,
                    controller: districtController,
                  ),


                  Gap(12),
                  FillTextField(
                    title: pinCode,
                    controller: pinCodeController,
                  ),

                  Gap(12),
                  FillTextField(
                    title: postOffice,
                    controller: postOfficeController,
                  ),

                  Gap(30),
                  Container(
                    color: blue,
                    width: Utils.getWidth(context),
                    padding: EdgeInsets.only(left: 20,top: 16,bottom: 16),
                    child: Text(typeOfOwnership,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 24,color: white),),
                  ),

                  Gap(30),
                  FillTextField(
                    title: khasraNo,
                    controller: khasraNoController,
                  ),
                  Gap(20),

                  Container(alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      child: Text(addAnother,style: TextStyle(fontWeight: FontWeight.w400,color: blueee ,fontSize: 16),)),

                  Gap(30),
                  Divider(
                    thickness: 3,
                    color: textFieldBorder,
                  ),
                  Gap(20),
                  Container(
                    width: Utils.getWidth(context),
                    padding: EdgeInsets.only(left: 20,top: 16,bottom: 16),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Gap(10),
                        Icon(Icons.attach_file,size: 30,color: white,),
                        Gap(20),
                        Text(attachSupportingDoc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: white),),                      ],
                    ),
                  ),

                  Gap(20),

                  Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(addAnotherDocument,style: TextStyle(fontWeight: FontWeight.w400,color: blueee ,fontSize: 16),)),

                  Gap(30),

                  StatefulBuilder(
                      builder: (BuildContext context,setState){
                        return Custom_Dottedborder(
                          padding: EdgeInsets.only(left: 16,top: 20,right: 16,bottom: 20),
                          child: Container(
                            child: Column(
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
                ],
              ),
            ),

            Gap(30),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DashBoardWeb()));

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

            Gap(30),
            CustomWebBottomBar(bgColor: true,),
          ],
        ),
      ),
    );
  }
}
