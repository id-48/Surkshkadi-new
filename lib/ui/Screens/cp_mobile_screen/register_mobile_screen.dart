import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/ui/Screens/cp_mobile_screen/components/basic_details_mobile.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';

class RegisterMobile extends HookConsumerWidget {
  const RegisterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final individualCheck = useState<bool>(true);
    final companyCheck = useState<bool>(false);


    return Scaffold(
      appBar: CustomAppBar(
        title: "Chanel Partner",
        backonTap: (){},
        notionTap: (){},
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14,right: 14,top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      individualCheck.value = true;
                      if (individualCheck.value == true) {
                        companyCheck.value = false;
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                      color: individualCheck.value == true ? oreng : white,
                      border: Border.all(color: oreng),
                          borderRadius: BorderRadius.circular(7)

                      ),
                      alignment: Alignment.center,
                      child: Text(
                        basicDetails,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: individualCheck.value == true
                                ? white
                                : black),
                      ),
                    ),
                  ),
                ),
                Gap(14),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      companyCheck.value = true;
                      if (companyCheck.value == true) {
                        individualCheck.value = false;
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: companyCheck.value == true ? oreng : white,
                          border: Border.all(color: oreng),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        eKyc,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: companyCheck.value == true ? white : black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(26),
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: BasicDetailsMobile(),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
