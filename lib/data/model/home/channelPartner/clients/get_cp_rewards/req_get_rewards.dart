
class ReqGetRewards {

  int cpUserId;

  ReqGetRewards(
      {
        required  this.cpUserId,
      });

  Map<String, dynamic> toJson() =>
      {

        "cp_user_id": cpUserId,
      };
}
