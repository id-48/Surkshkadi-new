
class ReqCity {
  String state;
  ReqCity(
      {
      required  this.state,
      });

  Map<String, dynamic> toJson() =>
      {
        "state": state,
      };
}
