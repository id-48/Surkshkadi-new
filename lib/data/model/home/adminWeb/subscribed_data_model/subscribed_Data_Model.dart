class SubscribedDataModel {
  String? _name;
  String? _email;
  String? _individual;
  String? _city;
  String? _state;
  String? _kyc;
  String? _willQuestions;
  String? _walletQuestions;
  String? _excution;

  SubscribedDataModel(
      {String? name,
        String? email,
        String? individual,
        String? city,
        String? state,
        String? kyc,
        String? willQuestions,
        String? walletQuestions,
        String? excution}) {
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (individual != null) {
      this._individual = individual;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (kyc != null) {
      this._kyc = kyc;
    }
    if (willQuestions != null) {
      this._willQuestions = willQuestions;
    }
    if (walletQuestions != null) {
      this._walletQuestions = walletQuestions;
    }
    if (excution != null) {
      this._excution = excution;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get individual => _individual;
  set individual(String? individual) => _individual = individual;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get kyc => _kyc;
  set kyc(String? kyc) => _kyc = kyc;
  String? get willQuestions => _willQuestions;
  set willQuestions(String? willQuestions) => _willQuestions = willQuestions;
  String? get walletQuestions => _walletQuestions;
  set walletQuestions(String? walletQuestions) =>
      _walletQuestions = walletQuestions;
  String? get excution => _excution;
  set excution(String? excution) => _excution = excution;

  SubscribedDataModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _individual = json['individual'];
    _city = json['city'];
    _state = json['state'];
    _kyc = json['kyc'];
    _willQuestions = json['willQuestions'];
    _walletQuestions = json['walletQuestions'];
    _excution = json['excution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['individual'] = this._individual;
    data['city'] = this._city;
    data['state'] = this._state;
    data['kyc'] = this._kyc;
    data['willQuestions'] = this._willQuestions;
    data['walletQuestions'] = this._walletQuestions;
    data['excution'] = this._excution;
    return data;
  }
}
