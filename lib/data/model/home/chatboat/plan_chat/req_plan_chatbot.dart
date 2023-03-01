class ReqPlanChatBot {
  String userId;
  String planId;
  // String processStatus;
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
  String isFatherAlive;
  String nominee;
  String nomineeRelation;
  String covidDose;
  String nicotineProducts;
  String planAssets;
  String paymentAmount;
  String transactionId;
  String transactionStatus;


  ReqPlanChatBot(
      {
        required this.userId,
        required this.planId,
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
        required this.isFatherAlive,
        required this.nominee,
        required this.nomineeRelation,
        required this.covidDose,
        required this.nicotineProducts,
        required this.planAssets,
        required this.paymentAmount,
        required this.transactionId,
        required this.transactionStatus
      });

  Map<String, dynamic> toJson() =>
      {
        'user_id': userId,
        'plan_id': planId,
        // 'process_status': processStatus,
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
        'is_father_alive': isFatherAlive,
        'nominee': nominee,
        'nominee_relation': nomineeRelation,
        'covid_dose': covidDose,
        'nicotine_products': nicotineProducts,
        'plan_assets': planAssets,
        'payment_amount': paymentAmount,
        'transaction_id': transactionId,
        'transaction_status': transactionStatus

      };
}
