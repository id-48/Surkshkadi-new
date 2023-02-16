import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/ui/Screens/dashboard/security_content_view_model.dart';

class LegalAll extends HookConsumerWidget {
  const LegalAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

   final  dataHTML = useState<String>("");


    useEffect(()   {

      ReqSecurityContent data = ReqSecurityContent(contentType: 'terms_conditions');

      ref.read(securityContentProvider.notifier).getSecurityContent(context: context, data: data ).then((value) {
          if(value?.status == 1){
            // print("datata --->>> ${value?.response.termsConditions}");
            dataHTML.value = "${value?.response.termsConditions}" ;
          }
      } );;
    },[]);

    final securityContentController = ref.watch(securityContentProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example',style: TextStyle(color: Colors.black),),
        centerTitle: true,
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
