import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:surakshakadi/utils/color_utils.dart';

class Demo_Plans_Screen extends HookConsumerWidget {
  const Demo_Plans_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: oreng,
      body: Center(
        child: Text(
          'Plans',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
      ),
    );
  }
}





class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

     const htmlData = "";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          tagsList: Html.tags..addAll(["bird", "flutter"]),
          onLinkTap: (url, _, __, ___) {
            print("Opening $url...");
          },
          onImageTap: (src, _, __, ___) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
          onCssParseError: (css, messages) {
            print("css that errored: $css");
            print("error messages:");
            messages.forEach((element) {
              print(element);
            });
          },
        ),
      ),
    );
  }
}