class ReqSecurityContent {


  String? contentType;

  ReqSecurityContent(
      {

        this.contentType,

      });

  Map<String, dynamic> toJson() =>
      {

        "content_type": contentType,


      };
}
