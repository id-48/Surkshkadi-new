
class ReqBeneficiary {

  String userId;
  List <String> relation;
  List <String>  name;
  List <String>  percentage;
  List <String>  exclusionReason;




  ReqBeneficiary(
      {

         required this.userId,
         required this.relation,
         required this.name,
         required this.percentage,
         required this.exclusionReason,



      });

  Map<String, dynamic> toJson() =>
      {

        "user_id": userId,
        "relation": relation,
        "name": name,
        "percentage": percentage,
        "exclusion_reason": exclusionReason,

      };
}
