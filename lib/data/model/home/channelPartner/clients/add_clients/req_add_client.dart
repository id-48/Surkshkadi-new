class ReqAddClient {
  int?  cpUserId;
  String?  clientType;
  String?  companyName;
  String?  name;
  String?  email;
  String?  mobile;

  ReqAddClient({
    this.cpUserId,
    this.clientType,
    this.companyName,
    this.name,
    this.email,
    this.mobile,
  });

  Map<String, dynamic> toJson() => {
        "cp_user_id": cpUserId,
        "client_type": clientType,
        "company_name": companyName,
        "name": name,
        "email": email,
        "mobile": mobile,
      };
}
