

class ReqPlanChatSubPayment {

  String? subscriptionId;
  String? paymentAmount;
  String? transactionId;
  String? transactionStatus;

  ReqPlanChatSubPayment(
      {

        this.subscriptionId,
        this.paymentAmount,
        this.transactionId,
        this.transactionStatus

      });

  Map<String, dynamic> toJson() =>
      {

        "subscription_id": subscriptionId,
        "payment_amount": paymentAmount,
        "transaction_id": transactionId,
        "transaction_status": transactionStatus

      };
}
