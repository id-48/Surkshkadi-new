import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
