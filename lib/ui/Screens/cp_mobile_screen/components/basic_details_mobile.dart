import 'package:flutter/Material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/ui/Screens/state_and_city_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/image_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/widgets/custom_select.dart';
import 'package:surakshakadi/widgets/custom_textfeild.dart';

class BasicDetailsMobile extends HookConsumerWidget {
  const BasicDetailsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final individualCheck = useState<bool>(true);
    final companyCheck = useState<bool>(false);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final mailController = useTextEditingController();
    final mobileController = useTextEditingController();
    final statee = useState<String>('');
    final cityy = useState<String>('');
    final cityList = useState<List<String>>([]);


    return Column(
      children: [
        Text(
          basicDetails,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Gap(18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              iAm,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: blue),
            ),
            Gap(20),
            InkWell(
              onTap: () {
                individualCheck.value = true;
                if (individualCheck.value == true) {
                  companyCheck.value = false;
                }
              },
              child: individualCheck.value == true
                  ? Icon(
                      Icons.check_box,
                      size: 24,
                      color: blue,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_sharp,
                      size: 24,
                      color: blue,
                    ),
            ),
            Gap(8),
            Text(
              individual,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Gap(20),
            InkWell(
              onTap: () {
                companyCheck.value = true;
                if (companyCheck.value == true) {
                  individualCheck.value = false;
                }
              },
              child: companyCheck.value == true
                  ? Icon(
                      Icons.check_box,
                      size: 24,
                      color: blue,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_sharp,
                      size: 24,
                      color: blue,
                    ),
            ),
            Gap(8),
            Text(
              company,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Gap(26),
        rowTextField(context, controller: firstNameController, title: firstName),
        Gap(14),
        rowTextField(context, controller: lastNameController, title: lastName),
        Gap(14),
        rowTextField(context, controller: mailController, title: mailId),
        Gap(14),
        rowTextField(context, controller: mobileController, title: mobileNumber),
        Gap(14),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: states,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13, color: black)),
                    TextSpan(
                      text: star,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: oreng,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child:Container(

                  decoration: BoxDecoration(
                    color: lightsky,
                    borderRadius: BorderRadius.circular(7),
                    // border: Border.all(color: blue),
                    boxShadow: [
                      BoxShadow(
                          color: black12, //New
                          blurRadius: 4.0,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: CustomSelect(
                    height: 36,
                    colors: lightsky,
                    onChanged: (stateVal) async {

                      cityList.value.clear();
                      statee.value = stateVal;

                      ReqCity cityData = ReqCity(state: "${stateVal}" );

                      await ref
                          .read(cityProvider.notifier)
                          .getCity(context: context, data: cityData).then((value) {
                        if(value!.status == 1){
                          // displayToast("${value.message}");
                          for(int j = 0; j<value.response.cities.length; j++){
                            cityList.value.add(value.response.cities[j].name);
                          }
                        }else{
                          displayToast("${value.message}");
                        }
                      });
                    },
                    items: stateList,
                    // items: ['Gujarat', 'Goa', 'Mumbai'],
                    hint: '',

                  )),
            ),
          ],
        ),

        Gap(14),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: city,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13, color: black)),
                    TextSpan(
                      text: star,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: oreng,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child:Container(

                  decoration: BoxDecoration(
                    color: lightsky,
                    borderRadius: BorderRadius.circular(7),
                    // border: Border.all(color: blue),
                    boxShadow: [
                      BoxShadow(
                          color: black12, //New
                          blurRadius: 4.0,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: CustomSelect(
                    height: 36,
                    colors: lightsky,
                    onChanged: (cityVal) async {

                      cityy.value = cityVal;

                    },
                    items: cityList.value,
                    // items: ['Gujarat', 'Goa', 'Mumbai'],
                    hint: '',

                  )),
            ),
          ],
        ),
        Gap(40),

        InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CPPartnerConfirmationWeb()));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 8, horizontal: 40),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(8),
              color: oreng,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12
                        .withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5))
              ],
            ),
            child: Text(
              proceed,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: white),
            ),
          ),
        ),
        Gap(20),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: iAgreeToAbide,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,color: black)),
              TextSpan(
                text: privacyPolicy,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cinnabarRed,
                    fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

rowTextField(
  context, {
  required TextEditingController controller,
  required String title,
}) {
  return Row(
    children: [
      Expanded(
        flex: 4,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: title,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 13, color: black)),
              TextSpan(
                text: star,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: oreng,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 6,
        child: CustomTextfeild(
          height: 36,
          textCapitalization: TextCapitalization.none,
          contentPadding: EdgeInsets.only(left: 5, right: 5, bottom: 0, top: -10),
          blurRadius: 4.0,
          maxLines: 1,
          offset: Offset(0.0, 4,),
          containerborder: Border.all(color: blue),
          containercolor: lightsky,
          borderRadius: BorderRadius.circular(7),
          controller: controller,
          textStyle: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}
