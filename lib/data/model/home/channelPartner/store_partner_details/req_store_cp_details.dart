class ReqStoreCPDetails {
  String? userId;
  String? partnerType;
  String? companyName;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? state;
  String? city;

  ReqStoreCPDetails({
    this.userId,
    this.partnerType,
    this.companyName,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.state,
    this.city,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "partner_type": partnerType,
        "company_name": companyName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "contact_number": contactNumber,
        "state": state,
        "city": city,
      };
}
