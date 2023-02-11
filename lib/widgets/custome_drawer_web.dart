import 'package:flutter/Material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../di/locator.dart';
import '../utils/color_utils.dart';
import '../utils/constants/navigation_route_constants.dart';
import '../utils/image_utils.dart';
import '../utils/strings.dart';

class Custome_drawer_web extends HookConsumerWidget {
  final int index;
  final bool button;
  const Custome_drawer_web({Key? key,required this.index,required this.button}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedindex = useState<int>(index);

    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Drawer(
      // width: 300,
      elevation: 0,
      backgroundColor: white,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 30),
                  child: Container(
                    // color: Colors.redAccent,
                      margin: EdgeInsets.only(
                          right:
                          MediaQuery.of(context).size.width <= 550 ? 0 : 20),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top:  MediaQuery.of(context).size.width <= 550 ? 0 : 30,
                              bottom: MediaQuery.of(context).size.width <= 550
                                  ? 0
                                  : 10),
                          child: Image.asset(startupIndia,scale: 2,))),
                ),
              ),



            InkWell(
                onTap: () {
                  selectedindex.value == 0;
                  navigationService.push(routeDashboardWeb);
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 17,
                        color: selectedindex.value == 0
                            ? buttonColor
                            : textColor),
                  ),
                )
            ),

            InkWell(
                onTap: () {
                  selectedindex.value == 1;
                  navigationService.push(routeAboutUsWeb);
                },
                child: Padding(
                  padding: EdgeInsets.all( 12),
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        fontSize: 17,
                        color: selectedindex.value == 1
                            ? buttonColor
                            : textColor),
                  ),
                )),

            InkWell(
                onTap: () {
                  selectedindex.value == 2;
                  navigationService.push(routePlansWeb);
                },

                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Plans',
                    style: TextStyle(
                        fontSize: 17,
                        color: selectedindex.value == 2
                            ? buttonColor
                            : textColor),
                  ),
                )),

            InkWell(
                onTap: () {
                  selectedindex.value == 3;
                  navigationService.push(routePartnerWithWeb);
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    partnerWithUs,
                    style: TextStyle(
                        fontSize: 17,
                        color: selectedindex.value == 3
                            ? buttonColor
                            : textColor),
                  ),
                )),

            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                faq,
                style: TextStyle(fontSize: 17, color: textColor),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'My Account',
                style: TextStyle(fontSize: 17, color: textColor),
              ),
            ),


          ],

        ),
      ),
    );
  }
}
