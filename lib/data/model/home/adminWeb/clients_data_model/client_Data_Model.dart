class ClientDataModel {
  String? _name;
  String? _date;
  String? _email;
  bool? _status;

  ClientDataModel({String? name, String? date, String? email, bool? status}) {
    if (name != null) {
      this._name = name;
    }
    if (date != null) {
      this._date = date;
    }
    if (email != null) {
      this._email = email;
    }
    if (status != null) {
      this._status = status;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get email => _email;
  set email(String? email) => _email = email;
  bool? get status => _status;
  set status(bool? status) => _status = status;

  ClientDataModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _date = json['date'];
    _email = json['email'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['date'] = this._date;
    data['email'] = this._email;
    data['status'] = this._status;
    return data;
  }
}
