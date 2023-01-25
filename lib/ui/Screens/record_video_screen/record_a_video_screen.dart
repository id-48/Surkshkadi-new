import 'dart:io';

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
  String videoData = "" ;
  @override
  void initState()
  {
    super.initState();
    if(widget.videoRecord == true ) {
      _controller = VideoPlayerController.file(widget.videoPictureRV!);
      // _controller = VideoPlayerController.file(File(widget.videoPictureRV!.path));
      videoData = "${widget.videoBase64}";

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
                        //
                        // var headers = {
                        //   'Cookie': 'ci_session=e3dd7dd3f24d62e15c0ff7b5c26014953a834619'
                        // };
                        // var request = MultipartRequest('POST', Uri.parse('https://backends.surakshakadi.com/store-will-review-details'));
                        // request.fields.addAll({
                        //   'user_id': '7',
                        //   'terms_conditions_status': '1',
                        //   'issue_details': 'yeajdk,djsckdsdsds   jdsndfnfd  sdkfs',
                        //   'video_file': 'dabshdajkda  aasnxu oaxj safa usa jsa843d38r9'
                        // });
                        //
                        // request.headers.addAll(headers);
                        //
                        // StreamedResponse response = await request.send();
                        //
                        // if (response.statusCode == 200) {
                        //   print(await response.stream.bytesToString());
                        // }
                        // else {
                        //   print(response.reasonPhrase);
                        // }


                        /// dio code


                        if(widget.videoRecord == true){

                          print("video--->> ${videoData}");


                          if(widget.videoRecord == true){



                            ReqStoreWillReviewDetails willReviewData = ReqStoreWillReviewDetails(
                              userId: getString(prefUserID),
                              issueDetails: "${getString(prefIssueDetail)}",
                              termsConditionsStatus: 1,
                              videoFile: videoData,
                            );

                            setState((){});
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
                          }


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



