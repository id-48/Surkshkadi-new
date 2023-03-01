

class ReqKycChatBot {
  String? userId;
  String? subRegisterStatus;
  String? motherName;
  String? isMotherAlive;
  String? maritalStatus;
  String? spouseName;
  String? divorceStatus;
  String? noOfChildren;
  String? childName;
  String? childAge;
  String? childGender;
  String? minorBeneficiaryName;
  String? minorBeneficiaryRelation;
  String? minorBeneficiaryAddress;
  String? appointSurakshakadiStatus;
  String? authorizeSurakshakadiStatus;
  String? termsConditionStatus;

  ReqKycChatBot(
      {
        this.userId,
        this.subRegisterStatus,
        this.motherName,
        this.isMotherAlive,
        this.maritalStatus,
        this.spouseName,
        this.divorceStatus,
        this.noOfChildren,
        this.childName,
        this.childAge,
        this.childGender,
        this.minorBeneficiaryName,
        this.minorBeneficiaryRelation,
        this.minorBeneficiaryAddress,
        this.appointSurakshakadiStatus,
        this.authorizeSurakshakadiStatus,
        this.termsConditionStatus,
      });
  Map<String, dynamic> toJson() =>
      {
        "user_id": userId,
        "sub_register_status": subRegisterStatus,
        "mother_name": motherName,
        "is_mother_alive": isMotherAlive,
        "marital_status": maritalStatus,
        "spouse_name": spouseName,
        "divorce_status": divorceStatus,
        "no_of_children": noOfChildren,
        "child_name": childName,
        "child_age": childAge,
        "child_gender": childGender,
        "minor_beneficiary_name": minorBeneficiaryName,
        "minor_beneficiary_relation": minorBeneficiaryRelation,
        "minor_beneficiary_address": minorBeneficiaryAddress,
        "appoint_surakshakadi_status": appointSurakshakadiStatus,
        "authorize_surakshakadi_status": authorizeSurakshakadiStatus,
        "terms_condition_status": termsConditionStatus,

      };
}
