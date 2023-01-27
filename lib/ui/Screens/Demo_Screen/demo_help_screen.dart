import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/will_review_screen.dart';

import 'package:surakshakadi/utils/color_utils.dart';

class Demo_Help_Screen extends HookConsumerWidget {
  const Demo_Help_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: deepSkyBlue,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => WillReview()));
          },
          style: ElevatedButton.styleFrom(
            primary: white,
            onPrimary: deepSkyBlue,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
          ),
          child: Text(
            'Help',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: black),
          ),
        ),
      ),
    );
  }
}
