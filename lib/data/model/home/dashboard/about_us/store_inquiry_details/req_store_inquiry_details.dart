class ReqStoreInquiryDetails {


  String firstName;
  String lastName;
  String mobile;
  String email;
  String state;
  String city;
  String message;

  ReqStoreInquiryDetails(
      {

     required   this.firstName,
     required   this.lastName,
     required   this.mobile,
     required   this.email,
     required   this.state,
     required   this.city,
     required   this.message,

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
