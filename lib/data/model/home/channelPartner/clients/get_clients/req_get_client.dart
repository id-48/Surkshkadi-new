
class ReqGetClient {


  int cpUserId;
  ReqGetClient(
      {
        required  this.cpUserId,
      });

  Map<String, dynamic> toJson() =>
      {

        "cp_user_id": cpUserId,
      };
}
