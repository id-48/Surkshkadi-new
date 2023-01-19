import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/extensions/size_extension.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/utils.dart';

import 'commonmodal.dart';

class Commonpagee extends HookConsumerWidget {
  const Commonpagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final currentIndex = useState<int>(0);
    Timer _timer;

    Container buildDot(int index, BuildContext context) {
      return Container(
        height: 8,
        width: currentIndex.value == index ? 8 : 8,
        margin: const EdgeInsets.only(right: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex.value == index
              ? Color(0xff134E95)
              : Color(0xffD2E1F3),
        ),
      );
    }

    PageController? _controller;

    useEffect(() {
      _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (currentIndex.value < 4) {
          currentIndex.value++;
        } else {
          currentIndex.value = 0;
        }

        _controller?.animateToPage(
          currentIndex.value,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
        _controller = PageController();
        FocusManager.instance.primaryFocus?.unfocus();
      });
      _timer.cancel();
    },[]);

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(newbgcolor), scale: 4, fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Container(
                height: Utils.getHeight(context),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    currentIndex.value = index;
                  },
                  itemBuilder: (_, i) {
                    return Container(

                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: Utils.getHeight(context) *0.065,),

                              Image.asset(icLogo,scale: 5,),

                              SizedBox(height: Utils.getHeight(context) *0.05,),

                              Image.asset(contents[i].image!, scale: Utils.getHeight(context) * 0.0053,),

                              SizedBox(height: Utils.getHeight(context) *0.035,),


                              Text(contents[i].boldname!, textAlign: TextAlign.center,
                                style: GoogleFonts.bonaNova(
                                  textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: Utils.getHeight(context)* 0.03,letterSpacing: 0.5),),),

                              SizedBox(height: Utils.getHeight(context) *0.004,),

                              Container(
                                height: h*0.0046,
                                width: w*0.18,
                                decoration: BoxDecoration(
                                  color: Color(0xfffA9836),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                              SizedBox(height: Utils.getHeight(context) *0.03,),

                              Text(contents[i].discription!,
                                style:  TextStyle(fontSize: Utils.getHeight(context) * 0.021,fontWeight: FontWeight.w400,letterSpacing: 0.3),textAlign: TextAlign.center,),


                              SizedBox(height: Utils.getHeight(context) *0.4,),

                            ],
                          ),
                        )

                    );


                  },
                ),
              ),
            ),


            Positioned(
              bottom: 0,
              left: 0,right: 0,
              child:  Container(
                height: Utils.getHeight(context) * 0.29 ,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text('Let’s Get Started!!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 0.5),),

                    // SizedBox(height: Utils.getHeight(context) * 0.02 ,),

                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardWeb()));
                        navigationService.push(routeSignin);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: Utils.getWidth(context) * 0.09 ),
                        child: Card(elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Container(

                            height: Utils.getHeight(context) * 0.06 ,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: black.withOpacity(0.1), //New
                                      blurRadius: 5.0,
                                      offset: Offset(-3, 7))
                                ],

                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff2F75C9).withOpacity(0.4),
                                      white.withOpacity(0.3),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                )

                            ),




                            child: Row(
                              children: [

                                SizedBox(width: 15,),

                                Image.asset(callicon,scale: 4,),

                                SizedBox(width: 15,),

                                Text('Enter Mobile Number',style: TextStyle(fontSize: 13),),
                              ],
                            ),


                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        navigationService.push(routeSignin);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardWeb()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.5,),
                        margin: EdgeInsets.symmetric(horizontal: 65),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.4), //New
                                blurRadius: 4.0,
                                offset: Offset(-1, 4))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff3C87E0).withOpacity(0.9),
                              Color(0xff0E3563).withOpacity(0.9)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Positioned(
              bottom: Utils.getHeight(context) * 0.3,
              left: 0,
              right: 0,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context),
                ),
              ),),
          ],
        ),
      ),


    );
  }
}








