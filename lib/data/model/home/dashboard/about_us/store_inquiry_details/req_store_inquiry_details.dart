class ReqStoreInquiryDetails {


  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? state;
  String? city;
  String? message;

  ReqStoreInquiryDetails(
      {

        this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.state,
        this.city,
        this.message,

      });

  Map<String, dynamic> toJson() =>
      {

        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "email": email,
        "state": state,
        "city": city,
        "message": message,


      };
}
