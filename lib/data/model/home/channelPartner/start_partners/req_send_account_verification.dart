class ReqSendAccountVerification {


  String? userId;


  ReqSendAccountVerification(
      {

        this.userId,


      });

  Map<String, dynamic> toJson() =>
      {

        "user_id": userId,



      };
}
