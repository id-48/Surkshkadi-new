import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_view_modal.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/strings.dart';
import 'package:surakshakadi/utils/utils.dart';
import 'package:surakshakadi/widgets/custom_appbar.dart';
import 'package:surakshakadi/widgets/custom_expandable_card.dart';
import 'package:surakshakadi/widgets/loading.dart';

class HelpAndSupport extends HookConsumerWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final faqController = ref.watch(dashboardProvider);
    final viewAll = useState<bool>(false);

    useEffect(() {
      ref.read(dashboardProvider.notifier).getDashboard(context: context);

      return null;
    },[]);


    return Scaffold(
      appBar: CustomAppBar(
        title: "Help & Support",
        menuIcon: true,
        menuonTap: (){
          navigationService.pop();
        },
        notificationIcon: false,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),


              Text(
                faqs,
                style: GoogleFonts.bonaNova(
                  textStyle: TextStyle(
                      color: navyblue,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                weHaveYouCOvered,
                style: TextStyle(
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Gap(4.h),
              Container(
                height: 2,
                width: 100,
                color: oreng,
              ),


              Gap(30.h),


              faqController.when(
                data: (data){
                  return Container(
                    // height: viewAll.value == false ? 340 : 720,
                    child: ListView.builder(
                      shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        // itemCount: data.response.faqs.length,
                        itemCount: viewAll.value == false ? 4 : data.response.faqs.length,
                        itemBuilder: ( context, index){
                          return Column(
                            children: [
                             CustomExpandTextCard(
                                faq: true,
                                title: "${data.response.faqs[index].question}",
                                boxcolor: white,
                                arrowColor: black,
                                border: Border(
                                  bottom: BorderSide(color: black)
                                ),
                                isExpanded: ValueNotifier(1),
                                index: 0,
                                expandedChild: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("${data.response.faqs[index].answer}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                                ),
                              ),



                              Gap(14),
                            ],
                          );
                        }),
                  );
                },
                error: (obj, trace) => ErrorWidget(obj),
                loading: () => const Loading(),
              ),


              if(viewAll.value == false)...[
                Gap(70),
                Center(
                  child: InkWell(
                    onTap: (){
                      viewAll.value = true;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 34),
                      decoration: BoxDecoration(
                        border: Border.all(color: blue, width: 1.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        viewMore,
                        style: TextStyle(fontSize: 15, color: blue),
                      ),
                    ),
                  ),
                ),
              ],

            ],
          ),
        ),
      ),


    );
  }
}
