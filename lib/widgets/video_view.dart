import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/record_video_screen/record_a_video_screen.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  final XFile videopicture;
  const VideoViewPage({Key? key, required this.videopicture}) : super(key: key);

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late  File videoData = File(widget.videopicture.path);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videopicture.path));
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 170,
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
                      child: CircularProgressIndicator(color: darkPrimaryColor),
                    );
                  }
                },
              ),
            ),
            Positioned(
              bottom: 20,
              right: 26,
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async {
                    _controller.pause();
                    var videoBytes = await videoData.readAsBytesSync();

                    String  videoBase64 = base64Encode(videoBytes);
                    String videoType = "data:image/" + '${widget.videopicture.path}'.split('.')[3].replaceAll("'", "") + ";base64,/";

                    String  videoData64 =  "$videoType${videoBase64}";

                     setState((){
                    navigationService.push(routeRecordAVideo,arguments: {navVideoPictureRV: File(widget.videopicture.path),navVideoRecord: true,navVideoBase64 : "${videoData64}"});
                     });
                    // navigationService.push(routeRecordAVideo,arguments: {navVideoPictureRV: widget.videopicture,navVideoRecord: true});
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RecordAVideo()));
                  },
                  child: CircleAvatar(
                       backgroundColor: Colors.teal,
                       radius: 25,
                       child: Icon(
                         Icons.check,
                         color: Colors.white,
                         size: 27,
                       ),
                     ),
                ),
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
    );
  }
}
