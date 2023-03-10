import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:surakshakadi/widgets/custom_dottedborder.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

import '../../../../utils/constants/navigation_route_constants.dart';

class FillTextField extends HookWidget {
  final String  title ;
  final TextEditingController  controller ;
  const FillTextField({Key? key,required this.title,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Row(
        children: [
          Expanded(flex: 3,
            child: RichText(
              text: TextSpan(
                children:  <TextSpan>[
                  TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.w400,fontSize: MediaQuery.of(context).orientation == Orientation.landscape ? 20 : 17)),
                  TextSpan(text: star, style: TextStyle(fontWeight: FontWeight.bold,color: cinnabarRed,fontSize: 20),),
                ],
              ),
            ),
          ),

          Expanded(flex: 4,
            child: CustomTextfeild(
              textCapitalization: TextCapitalization.none,
              contentPadding: EdgeInsets.only(left: 10,),
              blurRadius: 4.0,
              maxLines: 1,
              offset: Offset(0.0, 4,),
              containerborder: Border.all(color: webBorder),
              containercolor : white,
              borderRadius: BorderRadius.circular(10),
              controller: controller,
              textStyle: TextStyle(fontSize: 20),

            ),

          ),

        ],
      ),
    );
  }
}


 assetsPhotoText (context,{
  required TextEditingController controller,
  required List<XFile> imageFileList,
  required List<XFile> cameraFileList,
   bool textField = true,
}){
  ImagePicker _picker = ImagePicker();



XFile? image;
final pickedImage = useState<File>(File(""));


  XFile? addImage;
  final addPickedImage = useState<File>(File(""));


  XFile? cameraImage;
  final cameraPickedImage = useState<File>(File(""));
  final isCameraPicked = useState<bool>(false);

  return StatefulBuilder(
    builder: (context,setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Divider(thickness: 5, endIndent: 0, color: Color(0xffEAE7E7),),


          if(textField == true) ...[
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Text(attachDocuments,style: TextStyle(fontWeight: FontWeight.w400,color: black ,fontSize: 12,fontFamily: fontFamily),)),
           ],

          SizedBox(height: Utils.getHeight(context) * 0.025,),

          InkWell(
            onTap: () async{
              image = await _picker.pickImage(source: ImageSource.gallery);
              print('image path 216${image}');
              if (image != null) {
                pickedImage.value = File(image!.path);
                 imageFileList.add(image!);
                displayToast("Image Successful Upload");
                setState((){});
              }

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: Utils.getWidth(context),
              height: Utils.getHeight(context) * 0.055,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Gap(5),
                  Icon(Icons.attach_file,size: 25,color: white,),
                  Gap(20),
                  Text(attachDocument,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: white),),
                ],
              ),
            ),
          ),

          SizedBox(
            height: Utils.getHeight(context) * 0.025,
          ),

          InkWell(
            onTap: () async{
              print('------------->>>>>>>>>>>>>>>>>.image ');
              addImage = await _picker.pickImage(source: ImageSource.gallery);
              print('image path 216${addImage}');
              if (addImage != null) {
                addPickedImage.value = File(addImage!.path);
                print(
                    ' image path 200 ---->>>>>>${addPickedImage}');
                imageFileList.add(addImage!);
                displayToast("Image Successful Upload");

                setState((){});

              }

              // getImage(imageFileList);
              // isPicked.value = true;
            },
            child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(addAnotherDocument,style: TextStyle(fontWeight: FontWeight.w500,color: blueee ,fontSize: 12),)),
          ),


          SizedBox(
            height: Utils.getHeight(context) * 0.03,
          ),

          // StatefulBuilder(
          //   builder:  (BuildContext context, void Function(void Function()) setState) {
          //     return
                Container(
                height: 170,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Custom_Dottedborder(
                  padding: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clickPhoto,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: black,fontFamily: fontFamily),),
                        Gap(15),

                        Row(
                          children: [
                            Center(
                              child: Container(
                                height: 90,
                                width: Utils.getWidth(context) * 0.27,
                                child:
                                Container(
                                  child:cameraFileList.isNotEmpty
                                      ? Stack(
                                    clipBehavior: Clip.none,
                                    children :[
                                      Image.file(
                                        File(cameraFileList[0].path),
                                        fit: BoxFit.fill,
                                        height: 90,
                                        width: Utils.getWidth(context) * 0.27,
                                      ),


                                      Positioned(
                                        top: -10,
                                        right: -10,
                                        child: GestureDetector(
                                          onTap: () {
                                            cameraFileList.clear();
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle, color: Colors.red),
                                            child: const Icon(
                                              Icons.close,
                                              color: white,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                          : InkWell(
                                             onTap: () async{
                                               cameraImage = await _picker.pickImage(source: ImageSource.camera);

                                               if (cameraImage != null) {
                                                 cameraPickedImage.value = File(cameraImage!.path);
                                                 cameraFileList.add(cameraImage!);
                                               }

                                             },
                                            child: Image.asset(
                                      informationupload,
                                      scale: 4,
                                      fit: BoxFit.fill,
                                    ),
                                          ),


                                ),
                              ),
                            ),

                            Gap(25),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(uploadImage,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: black,fontFamily: fontFamily),),
                                Gap(2),
                                Text(uploadMultipleImage,style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: hintTextColor,fontFamily: fontFamily),),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            // }
          // ),


          if(textField == true)  ...[
          Gap(8),
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(anyMessage,style: TextStyle(fontWeight: FontWeight.w600,color: blueee ,fontSize: 12,fontFamily: fontFamily),)),
          Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Custom_Dottedborder(
              padding: EdgeInsets.only(left: 15,top: 1,right: 1,bottom: 1),
              child: CustomTextfeild(
                controller: controller,
                textCapitalization: TextCapitalization.none,
                blurRadius: 0.0,
                offset: Offset(0.0,0.0),
                containercolor: white,
                borderRadius: BorderRadius.circular(10),
                // height: 80,
                maxLines: 3,
                hinttext: writeThe,
                hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: hintTextColor,fontFamily: fontFamily),
              ),
            ),
          ),
          ],

          Gap(35),




        ],
      );
    }
  );
}

iconText(context){
  return  Padding(
    padding: EdgeInsets.only(top: 15,bottom: 15,left: 15),
    child: Row(
      children: [
        Image.asset(
          'assets/images/iconright.png',
          scale: 3.5,
        ),
        SizedBox(
          width: Utils.getWidth(context) * 0.03,
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Text(
                  privacyHeadline,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: blue,
                      height: 1.5,
                      letterSpacing: 0.2),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

header(context,{
 required String image,
 required String title,
 required String description,
}){
  return Container(
    padding: EdgeInsets.only(top: 10,bottom: 10,left: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              lightindigotwo ,
               lightindigo ,
              // dattaa["colortwo"],
              // dattaa["color"],
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
        )
    ),
    child: Row(
      children: [
        Image.asset(
          image,
          scale: 4,
        ),
        Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5),
            Text(
              description,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}


expandRow(context,{
  required String title,
  required TextEditingController controller,
}){
  return    Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    margin: EdgeInsets.only(bottom: 14),
    child: Row(
      children: [
        Expanded(
            flex: 7,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500,fontFamily: fontFamily),
            )),
        Expanded(
          flex: 10,
          child: CustomTextfeild(
            height: 32,textCapitalization: TextCapitalization.none,
            contentPadding: EdgeInsets.only(left: 5,top: -3.0,bottom: 15),
            blurRadius: 2.0,
            offset: Offset(2, 2,),
            containerborder: Border.all(color: blue),
            containercolor : lightsky,
            borderRadius: BorderRadius.circular(7),
            controller: controller,
            hintStyle: TextStyle(color: greenjerry, fontSize: 13),

          ),
        ),
      ],
    ),
  );
}


addAnotherDoc(context,{
  required List<XFile> imageFileList,
}){

  ImagePicker _picker = ImagePicker();



  XFile? imageAdd;
  final pickedAddImage = useState<File>(File(""));

  return   Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () async{

          imageAdd = await _picker.pickImage(source: ImageSource.gallery);
          if (imageAdd != null) {
            pickedAddImage.value = File(imageAdd!.path);
            imageFileList.add(imageAdd!);
            displayToast("Image Successful Upload");
            // setState((){});
          }

        },
        child: Text(
          addAnother,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: blueee,
              fontSize: 12),
        ),
      ));
}

infoAssetsCustomDialog(BuildContext context) {
  print("welcome to display Dialog in Assets Info");
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      insetPadding:
      const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: 250,
            width: Utils.getWidth(context) - 40,
            padding: EdgeInsets.only(
                top: 15,left: 10,right: 10
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: indigo, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          cross,
                          scale: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),

                Gap(20),
                Text("Please ensure to access your Asset Wallet from the Home page menu and update information for your loved ones as soon as possible.",
                  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: fontFamily),),
                Gap(20),

                CustomButton(
                  title: "OK",
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 11),
                  onTap: (){
                    navigationService.push(routeCustomBottomNavigationBar);
                  },
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
