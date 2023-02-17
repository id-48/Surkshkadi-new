import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/ui/Screens/dashboard/security_content_view_model.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/strings.dart';

class LegalAll extends HookConsumerWidget {
  final String securityContent;
  const LegalAll({Key? key,required this.securityContent}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

   final  dataHTML = useState<String>("");


    useEffect(()   {

      ReqSecurityContent data = ReqSecurityContent(contentType: securityContent);

      ref.read(securityContentProvider.notifier).getSecurityContent(context: context, data: data ).then((value) {
          if(value?.status == 1){
            // print("datata --->>> ${value?.response.termsConditions}");
            dataHTML.value = "${value?.response.content}" ;
          }
      } );;
    },[]);

    // final securityContentController = ref.watch(securityContentProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text( securityContent == "terms_conditions" ? termsConditions : securityContent == "privacy_policies" ? privacyPolicy : disclaimers,style: TextStyle(color: white),),
        centerTitle: true,
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        // child: Html(
        //   data: data,
        //   tagsList: Html.tags..addAll(["bird", "flutter"]),
        //   onLinkTap: (url, _, __, ___) {
        //     print("Opening $url...");
        //   },
        //   onImageTap: (src, _, __, ___) {
        //     print(src);
        //   },
        //   onImageError: (exception, stackTrace) {
        //     print(exception);
        //   },
        //   onCssParseError: (css, messages) {
        //     print("css that errored: $css");
        //     print("error messages:");
        //     messages.forEach((element) {
        //       print(element);
        //     });
        //   },
        // ),

       child:
             Html(
              data: dataHTML.value,
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
