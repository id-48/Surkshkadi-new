class ResPlans {
  bool? success;
  String? message;
  Plans? plans;

  ResPlans({this.success, this.message, this.plans});

  ResPlans.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    plans = json['Plans'] != null ? new Plans.fromJson(json['Plans']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.plans != null) {
      data['Plans'] = this.plans!.toJson();
    }
    return data;
  }
}

class Plans {
  List<Lifetime>? lifetime;
  List<Yearly>? yearly;

  Plans({this.lifetime, this.yearly});

  Plans.fromJson(Map<String, dynamic> json) {
    if (json['lifetime'] != null) {
      lifetime = <Lifetime>[];
      json['lifetime'].forEach((v) {
        lifetime!.add(new Lifetime.fromJson(v));
      });
    }
    if (json['yearly'] != null) {
      yearly = <Yearly>[];
      json['yearly'].forEach((v) {
        yearly!.add(new Yearly.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lifetime != null) {
      data['lifetime'] = this.lifetime!.map((v) => v.toJson()).toList();
    }
    if (this.yearly != null) {
      data['yearly'] = this.yearly!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lifetime {
  int? id;
  String? title;
  String? desc;
  String? price;
  String? offer;
  String? type;
  String? status;
  String? colour;
  String? offerPrice;
  String? duration;
  String? createdAt;
  String? planTyp;
  String? updatedAt;

  Lifetime(
      {this.id,
        this.title,
        this.desc,
        this.price,
        this.offer,
        this.type,
        this.status,
        this.colour,
        this.offerPrice,
        this.duration,
        this.createdAt,
        this.planTyp,
        this.updatedAt});

  Lifetime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    offer = json['offer'];
    type = json['type'];
    status = json['status'];
    colour = json['colour'];
    offerPrice = json['offer_price'];
    duration = json['duration'];
    createdAt = json['created_at'];
    planTyp = json['plan_typ'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['offer'] = this.offer;
    data['type'] = this.type;
    data['status'] = this.status;
    data['colour'] = this.colour;
    data['offer_price'] = this.offerPrice;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['plan_typ'] = this.planTyp;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Yearly {
  int? id;
  String? title;
  String? desc;
  String? price;
  String? offer;
  String? type;
  String? status;
  String? colour;
  String? offerPrice;
  String? duration;
  String? createdAt;
  String? planTyp;
  String? updatedAt;

  Yearly(
      {this.id,
        this.title,
        this.desc,
        this.price,
        this.offer,
        this.type,
        this.status,
        this.colour,
        this.offerPrice,
        this.duration,
        this.createdAt,
        this.planTyp,
        this.updatedAt});

  Yearly.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    offer = json['offer'];
    type = json['type'];
    status = json['status'];
    colour = json['colour'];
    offerPrice = json['offer_price'];
    duration = json['duration'];
    createdAt = json['created_at'];
    planTyp = json['plan_typ'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['offer'] = this.offer;
    data['type'] = this.type;
    data['status'] = this.status;
    data['colour'] = this.colour;
    data['offer_price'] = this.offerPrice;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['plan_typ'] = this.planTyp;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
