class ReqPlanChatBot {
  String userId;
  String planId;
  String processStatus;
  String name;
  String email;
  String wpNo;
  String dob;
  String gender;
  String address;
  String state;
  String city;
  String postCode;
  String annualIncome;
  String occupation;
  String fatherName;
  String nominee;
  String nomineeRelation;
  String covidDose;
  String nicotineProducts;
  String planAssets;


  ReqPlanChatBot(
      {
        required this.userId,
        required this.planId,
        required this.processStatus,
        required this.name,
        required this.email,
        required this.wpNo,
        required this.dob,
        required this.gender,
        required this.address,
        required this.state,
        required this.city,
        required this.postCode,
        required this.annualIncome,
        required this.occupation,
        required this.fatherName,
        required this.nominee,
        required this.nomineeRelation,
        required this.covidDose,
        required this.nicotineProducts,
        required this.planAssets
      });

  Map<String, dynamic> toJson() =>
      {
        'user_id': userId,
        'plan_id': planId,
        'process_status': processStatus,
        'name': name,
        'email': email,
        'wp_no': wpNo,
        'dob': dob,
        'gender': gender,
        'address': address,
        'state': state,
        'city': city,
        'post_code': postCode,
        'annual_income': annualIncome,
        'occupation': occupation,
        'father_name': fatherName,
        'nominee': nominee,
        'nominee_relation': nomineeRelation,
        'covid_dose': covidDose,
        'nicotine_products': nicotineProducts,
        'plan_assets': planAssets

      };
}
