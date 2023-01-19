

class ReqSingleUAPayment {

  String? singleUserAssetsId;
  String? paymentAmount;
  String? transactionId;
  String? transactionStatus;

  ReqSingleUAPayment(
      {

        this.singleUserAssetsId,
        this.paymentAmount,
        this.transactionId,
        this.transactionStatus

      });

  Map<String, dynamic> toJson() =>
      {

        "single_user_asset_id": singleUserAssetsId,
        "payment_amount": paymentAmount,
        "transaction_id": transactionId,
        "transaction_status": transactionStatus

      };
}
