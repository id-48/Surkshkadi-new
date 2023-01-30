import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/store_will_review_details/req_store_will_review_details.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/record_video_screen/store_will_review_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/camera_screen.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_button.dart';
import 'package:video_player/video_player.dart';


class RecordAVideo extends StatefulWidget {
  final File? videoPictureRV;
  final bool videoRecord;
  final String? videoBase64;
  const RecordAVideo({Key? key, this.videoPictureRV,required this.videoRecord,this.videoBase64}) : super(key: key);

  @override
  State<RecordAVideo> createState() => _RecordAVideoState();
}

class _RecordAVideoState extends State<RecordAVideo> {


  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late String videoData = "${widget.videoBase64!}" ;
  @override
  void initState()
  {
    super.initState();
    if(widget.videoRecord == true ) {
      _controller = VideoPlayerController.file(widget.videoPictureRV!);
      // _controller = VideoPlayerController.file(File(widget.videoPictureRV!.path));
      videoData = widget.videoBase64!;

      _initializeVideoPlayerFuture = _controller.initialize();

      _controller.setLooping(true);
    }else{
      print("Not value for Video");
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: recordAVideo,
        backonTap: () {
          navigationService.push(routeWillReview);
        },
        notionTap: (){},
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Gap(14),
              Row(
                children: [
                  Gap(20),
                  Image.asset(videoIcon,scale: 4,),
                  Gap(20),
                  Text(loremIpsumDolorSitSmallName,style: TextStyle(fontSize: 13,color: blue),),
                ],
              ),
              Gap(20),
              widget.videoRecord == false
                  ? GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage() ));
                },
                child: Container(
                  height: 200,
                  width: Utils.getWidth(context),
                  decoration: BoxDecoration(
                    border: Border.all(color: bordervideo,width: 1.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:  Image.asset(videoIcon,scale: 4,color: black,),
                ),
              )
                  : Container(
                    alignment: Alignment.center,
                    height: Utils.getHeight(context) * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: Utils.getHeight(context) * 0.39,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _controller.value.isPlaying ? _controller.pause(): _controller.play();
                          });
                        },
                        child:CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.black38,
                            child: Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow,color: Colors.white,size: 50,)),
                      ),
                    )
                  ],
                ),
              ),
              Gap(30),
              Container(
                  width: Utils.getWidth(context),
                  child: Text(loremIpsumDolorSit,
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),)
              ),
              Gap(40),
              Center(
                child: HookConsumer(
                  builder: (context,ref,child) {
                    return CustomButton(
                      title: submit,
                      padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                      onTap: () async{

                        if(widget.videoRecord == true){
                          // Uint8List videoBytes = await widget.videoPictureRV!.readAsBytes();
                          // // Uint8List videoBytes = await widget.videoPictureRV!.readAsBytesSync();
                          // print("videodata----->>${videoBytes.runtimeType}");
                          // String  videoBase64 = base64.encode(videoBytes);
                          // // String  videoBase64 = base64Encode(videoBytes);
                          String videoType = "data:image/" + '${widget.videoPictureRV!.path}'.split('.')[3] + ";base64,/";
                          // print("video type---${videoType}");
                          // // String  videoeeee =  videoType.replaceAll("'", "");
                          String  videoDataa =  "videoType";
                          // String  videoData =  "${videoType}" + "${videoBase64}";
                          // print("video--->> ${videoData}");


                          print("enter your imageFile 111---->>>>> ${widget.videoPictureRV!.path.toString()}");
                          File imageFile =  File(widget.videoPictureRV!.path);
                          print("enter your imageFile ---->>>>> ${imageFile}");
                          List<int> imageBytes = imageFile.readAsBytesSync();
                          String base64Image = base64Encode(imageBytes);

                          print("enter your ---->>>>> $base64Image  --");


                              ReqStoreWillReviewDetails willReviewData = await ReqStoreWillReviewDetails(
                                userId: getString(prefUserID),
                                issueDetails: "${getString(prefIssueDetail)}",
                                termsConditionsStatus: 1,
                                videoFile: "'$videoType${base64Image}'",
                                // videoFile: "${imageFile}",
                              );

                              print("--------${willReviewData.videoFile}");

                            await ref.read(storeWillReviewProvider.notifier)
                                .willReviewVideo(context: context, data: willReviewData)
                                .then((value) {
                                  if(value?.status == 1){
                                    displayToast("${value?.message}");
                                    navigationService.push(routeAssetScreen);
                                  }else{

                                    displayToast("${value?.message}");
                                  }
                            });

                        }else{
                          displayToast("Please Record Video");
                        }


                      },
                    );
                  }
                ),
              ),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}



