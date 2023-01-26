
class ReqGetSubscribedClient {

  int cpUserId;
  
  ReqGetSubscribedClient(
      {
        required  this.cpUserId,
      });

  Map<String, dynamic> toJson() =>
      {

        "cp_user_id": cpUserId,
      };
}
