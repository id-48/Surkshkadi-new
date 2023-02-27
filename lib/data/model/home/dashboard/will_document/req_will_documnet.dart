class ReqWillDocument {
  String userId;
  String documentStatus;

  ReqWillDocument({
    required this.userId,
    required this.documentStatus,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "document_status": documentStatus,
      };
}
