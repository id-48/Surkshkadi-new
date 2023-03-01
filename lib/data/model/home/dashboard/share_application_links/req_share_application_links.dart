class ReqShareApplicationLinks {


  String? sharingPlatform;
  String? email;
  String? mobile;

  ReqShareApplicationLinks(
      {

        this.sharingPlatform,
        this.email,
        this.mobile,

      });

  Map<String, dynamic> toJson() =>
      {

        "sharing_platform": sharingPlatform,
        "email": email,
        "mobile": mobile,


      };
}
