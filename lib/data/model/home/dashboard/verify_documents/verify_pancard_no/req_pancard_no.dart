import 'dart:convert';

ReqPancardNo reqPancardNoFromJson(String str) => ReqPancardNo.fromJson(json.decode(str));

String reqPancardNoToJson(ReqPancardNo data) => json.encode(data.toJson());

class ReqPancardNo {
  ReqPancardNo({
    required this.pan,
  });

  String pan;

  factory ReqPancardNo.fromJson(Map<String, dynamic> json) => ReqPancardNo(
    pan: json["pan"],
  );

  Map<String, dynamic> toJson() => {
    "pan": pan,
  };
}
