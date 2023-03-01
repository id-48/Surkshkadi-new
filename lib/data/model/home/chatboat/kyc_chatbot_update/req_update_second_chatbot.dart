class ReqUpdateSecondChatBot {
  String userId;
  String subRegisterStatus;
  String motherName;
  String isMotherAlive;
  String maritalStatus;
  String spouseName;
  String divorceStatus;
  String noOfChildren;
  String childName;
  String childAge;
  String childGender;
  String minorBeneficiaryName;
  String minorBeneficiaryRelation;
  String minorBeneficiaryAddress;



  ReqUpdateSecondChatBot(
      {
        required this.userId,
        required this.subRegisterStatus,
        required this.motherName,
        required this.isMotherAlive,
        required this.maritalStatus,
        required this.spouseName,
        required this.divorceStatus,
        required this.noOfChildren,
        required this.childName,
        required this.childAge,
        required this.childGender,
        required this.minorBeneficiaryName,
        required this.minorBeneficiaryRelation,
        required this.minorBeneficiaryAddress,


      });

  Map<String, dynamic> toJson() =>
      {
        'user_id': userId,
        'sub_register_status': subRegisterStatus,
        'mother_name': motherName,
        'is_mother_alive': isMotherAlive,
        'marital_status': maritalStatus,
        'spouse_name': spouseName,
        'divorce_status': divorceStatus,
        'no_of_children': noOfChildren,
        'child_name': childName,
        'child_age': childAge,
        'child_gender': childGender,
        'minor_beneficiary_name': minorBeneficiaryName,
        'minor_beneficiary_relation': minorBeneficiaryRelation,
        'minor_beneficiary_address': minorBeneficiaryAddress,

      };
}
