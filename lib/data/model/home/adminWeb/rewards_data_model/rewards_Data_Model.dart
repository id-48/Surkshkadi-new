class RewardsDataModel {
  String? _name;
  String? _planSelected;
  String? _startDate;
  String? _endDate;
  String? _amountPaid;
  String? _rewardReceived;

  RewardsDataModel(
      {String? name,
        String? planSelected,
        String? startDate,
        String? endDate,
        String? amountPaid,
        String? rewardReceived}) {
    if (name != null) {
      this._name = name;
    }
    if (planSelected != null) {
      this._planSelected = planSelected;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
    if (amountPaid != null) {
      this._amountPaid = amountPaid;
    }
    if (rewardReceived != null) {
      this._rewardReceived = rewardReceived;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get planSelected => _planSelected;
  set planSelected(String? planSelected) => _planSelected = planSelected;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get amountPaid => _amountPaid;
  set amountPaid(String? amountPaid) => _amountPaid = amountPaid;
  String? get rewardReceived => _rewardReceived;
  set rewardReceived(String? rewardReceived) =>
      _rewardReceived = rewardReceived;

  RewardsDataModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _planSelected = json['planSelected'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _amountPaid = json['amountPaid'];
    _rewardReceived = json['rewardReceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['planSelected'] = this._planSelected;
    data['startDate'] = this._startDate;
    data['endDate'] = this._endDate;
    data['amountPaid'] = this._amountPaid;
    data['rewardReceived'] = this._rewardReceived;
    return data;
  }
}
