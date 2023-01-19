import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'color_utils.dart';

class SelectedImageViewer extends StatelessWidget {
  final ValueNotifier<List<XFile>> res;
  final void Function(void Function()) setState;

  const SelectedImageViewer(
      {Key? key, required this.res, required this.setState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              mainAxisExtent: 130,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 15),
          shrinkWrap: true,
          itemCount: res.value.length,
          itemBuilder: (BuildContext ctx, index) {
            // print('Img List DATA ==>>${res.value}');
            return Image.file(File(res.value[index].path),
                height: 100, width: 100, fit: BoxFit.fill);
          }),
    );
  }
}
