import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';

class TermsAndCondition extends HookConsumerWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: termsConditions,
        menuIcon: true,
        menuonTap: (){
          navigationService.pop();

        },
        notificationIcon: false,
      ),

    );
  }
}
