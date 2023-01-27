

class ReqStoreWillReviewDetails {


  String userId;
  int termsConditionsStatus;
  String? issueDetails;
  String videoFile;


  ReqStoreWillReviewDetails(
      {
      required  this.userId,
        required  this.termsConditionsStatus,
        this.issueDetails,
        required  this.videoFile,

      });
  Map<String, dynamic> toJson() =>
      {
        "user_id": userId,
        "terms_conditions_status": termsConditionsStatus,
        "issue_details": issueDetails,
        "video_file": videoFile

      };
}
