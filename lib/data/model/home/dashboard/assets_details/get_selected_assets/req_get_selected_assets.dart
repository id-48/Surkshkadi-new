
class ReqGetSelectedAssets {


  int userId;
  ReqGetSelectedAssets(
      {
        required  this.userId,
      });

  Map<String, dynamic> toJson() =>
      {

        "user_id": userId,
      };
}
