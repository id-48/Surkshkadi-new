


import 'dart:math';


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/widgets/video_view.dart';

import '../utils/color_utils.dart';

late List <CameraDescription>   cameras ;

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key,}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;


  bool _isRearCameraSelected = true;
  bool isrecording = false;
  bool flash = false ;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(cameras[0]);
  }

  Future takePicture(BuildContext context) async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => CameraViewPage(
      //           picture: picture,
      //         )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }
  Future videorecord (BuildContext context) async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      // await _cameraController.setFlashMode(FlashMode.off);

    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
        body: SafeArea(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: (_cameraController.value.isInitialized)
                  ? CameraPreview(_cameraController)
                  : Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator())),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  decoration: const BoxDecoration(
                      color: Colors.transparent),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    IconButton(
                      icon:  Icon( flash ? Icons.flash_on : Icons.flash_off, color: Colors.white,size: 27,),
                      onPressed: (){
                        setState(() {
                          flash = !flash;
                        });
                        flash ? _cameraController.setFlashMode(FlashMode.always) : _cameraController.setFlashMode(FlashMode.off);
                        },
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    GestureDetector(
                      onLongPress: () async {

                       await _cameraController.startVideoRecording();
                        setState(() {
                          isrecording = true;
                        });
                      },
                      onLongPressUp: () async {
                         XFile videoFile = await _cameraController.stopVideoRecording();
                         // await _cameraController.stopVideoRecording();

                         print("video player --->> ${videoFile.path}");
                        setState(() {
                          isrecording = false;

                        });

                        Navigator.push(context, MaterialPageRoute(builder: (builder) => VideoViewPage(videopicture:videoFile)));
                      },

                      child: isrecording == true ? Icon(Icons.radio_button_checked,color: Colors.red,size: 60,)
                          : Icon(Icons.panorama_fish_eye,color: Colors.white,size: 60,)

                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: Icon(
                          _isRearCameraSelected
                              ? CupertinoIcons.switch_camera
                              : CupertinoIcons.switch_camera_solid,
                          color: Colors.white,size: 27,),
                      onPressed: () {
                        setState(
                                () => _isRearCameraSelected = !_isRearCameraSelected);
                        initCamera(cameras[_isRearCameraSelected ? 0 : 1]);
                      },
                    ),


                   ]
                  ),
                )
              ),
            ]
          ),
        )
      );
    }
  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

}

