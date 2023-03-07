import 'dart:convert';

ResDashboard resDashboardFromJson(String str) =>
    ResDashboard.fromJson(json.decode(str));

String resDashboardToJson(ResDashboard data) => json.encode(data.toJson());

class ResDashboard {
  ResDashboard({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResDashboard.fromJson(Map<String, dynamic> json) => ResDashboard(
        status: json["status"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.banners,
    required this.video,
    required this.howItWorksVideo,

    required this.isSubscribed,
    required this.firstChatBotStatus,
    required this.paymentStatus,
    required this.kycStatus,
    required this.secondChatBotStatus,
    required this.beneficiaryStatus,
    required this.willDocumentStatus,
    required this.willReviewStatus,
    required this.assetDetailsStatus,

    required this.specialities,
    required this.plans,
    required this.testimonials,
    required this.faqs,
  });

  List<Banner> banners;
  String video;
  String howItWorksVideo;

  String isSubscribed;
  String firstChatBotStatus;
  String paymentStatus;
  String kycStatus;
  String secondChatBotStatus;
  String beneficiaryStatus;
  String willDocumentStatus;
  String willReviewStatus;
  String assetDetailsStatus;

  List<ResponseSpeciality> specialities;
  List<ResponsePlan> plans;
  List<Testimonial> testimonials;
  List<Faq> faqs;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),

        video: json["video"],
        howItWorksVideo: json["how_it_works_video"],

    isSubscribed: json["is_subscribed"].toString(),
    firstChatBotStatus: json["first_chat_bot_status"].toString(),
    paymentStatus: json["payment_status"].toString(),
    kycStatus: json["kyc_status"].toString(),
    secondChatBotStatus: json["second_chat_bot_status"].toString(),
    beneficiaryStatus: json["beneficiary_status"].toString(),
    willDocumentStatus: json["will_document_status"].toString(),
    willReviewStatus: json["will_review_status"].toString(),
    assetDetailsStatus: json["asset_details_status"].toString(),

        specialities: List<ResponseSpeciality>.from(
            json["specialities"].map((x) => ResponseSpeciality.fromJson(x))),
        plans: List<ResponsePlan>.from(
            json["plans"].map((x) => ResponsePlan.fromJson(x))),
        testimonials: List<Testimonial>.from(
            json["testimonials"].map((x) => Testimonial.fromJson(x))),
        faqs: List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "video": video,
        "how_it_works_video": howItWorksVideo,

    "is_subscribed": isSubscribed,
    "first_chat_bot_status": firstChatBotStatus,
    "payment_status": paymentStatus,
    "kyc_status": kycStatus,
    "second_chat_bot_status": secondChatBotStatus,
    "beneficiary_status": beneficiaryStatus,
    "will_document_status": willDocumentStatus,
    "will_review_status": willReviewStatus,
    "asset_details_status": assetDetailsStatus,

        "specialities": List<dynamic>.from(specialities.map((x) => x.toJson())),
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "testimonials": List<dynamic>.from(testimonials.map((x) => x.toJson())),
        "faqs": List<dynamic>.from(faqs.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    required this.bannerTitle,
    required this.bannerContent,
    required this.bannerImage,
  });

  String bannerTitle;
  String bannerContent;
  String bannerImage;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerTitle: json["banner_title"],
        bannerContent: json["banner_content"],
        bannerImage: json["banner_image"],
      );

  Map<String, dynamic> toJson() => {
        "banner_title": bannerTitle,
        "banner_content": bannerContent,
        "banner_image": bannerImage,
      };
}

class Faq {
  Faq({
    required this.question,
    required this.answer,
  });

  String question;
  String answer;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

class ResponsePlan {
  ResponsePlan({
    required this.type,
    required this.plans,
  });

  String type;
  List<PlanPlan> plans;

  factory ResponsePlan.fromJson(Map<String, dynamic> json) => ResponsePlan(
        type: json["type"],
        plans:
            List<PlanPlan>.from(json["plans"].map((x) => PlanPlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
      };
}

class PlanPlan {
  PlanPlan({
    required this.planId,
    required this.bgColor,
    required this.planTitle,
    required this.actualPrice,
    required this.offerPrice,
    required this.planType,
    required this.description,
    required this.planModules,
  });

  String planId;
  String bgColor;
  String planTitle;
  String actualPrice;
  String offerPrice;
  String planType;
  String description;
  List<PlanModule> planModules;

  factory PlanPlan.fromJson(Map<String, dynamic> json) => PlanPlan(
        planId: json["plan_id"],
        bgColor: json["bg_color"],
        planTitle: json["plan_title"],
        actualPrice: json["actual_price"].toString(),
        offerPrice: json["offer_price"].toString(),
        planType: json["plan_type"],
        description: json["description"],
        planModules: List<PlanModule>.from(
            json["plan_modules"].map((x) => PlanModule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plan_id": planId,
        "bg_color": bgColor,
        "plan_title": planTitle,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "plan_type": planType,
        "description": description,
        "plan_modules": List<dynamic>.from(planModules.map((x) => x.toJson())),
      };
}

class PlanModule {
  PlanModule({
    required this.planModuleId,
    required this.specialityCategory,
    required this.specialityName,
    required this.specialityStatus,
  });

  String planModuleId;
  String specialityCategory;
  String specialityName;
  String specialityStatus;

  factory PlanModule.fromJson(Map<String, dynamic> json) => PlanModule(
        planModuleId: json["plan_module_id"],
        specialityCategory: json["speciality_category"],
        specialityName: json["speciality_name"],
        specialityStatus: json["speciality_status"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "plan_module_id": planModuleId,
        "speciality_category": specialityCategory,
        "speciality_name": specialityName,
        "speciality_status": specialityStatus,
      };
}

class ResponseSpeciality {
  ResponseSpeciality({
    required this.categoryId,
    required this.category,
    required this.image,
    required this.boxColor,
    required this.specialities,
  });

  String categoryId;
  String category;
  String image;
  String boxColor;
  List<SpecialitySpeciality> specialities;

  factory ResponseSpeciality.fromJson(Map<String, dynamic> json) =>
      ResponseSpeciality(
        categoryId: json["category_id"],
        category: json["category"],
        image: json["image"],
        boxColor: json["box_color"],
        specialities: List<SpecialitySpeciality>.from(
            json["specialities"].map((x) => SpecialitySpeciality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category": category,
        "image": image,
        "box_color": boxColor,
        "specialities": List<dynamic>.from(specialities.map((x) => x.toJson())),
      };
}

class SpecialitySpeciality {
  SpecialitySpeciality(
      {required this.specilityId,
      required this.specilityTitle,
      this.checkValue = false});

  String specilityId;
  String specilityTitle;
  bool checkValue = false;

  factory SpecialitySpeciality.fromJson(Map<String, dynamic> json) =>
      SpecialitySpeciality(
        specilityId: json["specility_id"],
        specilityTitle: json["specility_title"],
      );

  Map<String, dynamic> toJson() => {
        "specility_id": specilityId,
        "specility_title": specilityTitle,
      };
}

class Testimonial {
  Testimonial({
    required this.title,
    required this.content,
    required this.image,
  });

  String title;
  String content;
  String image;

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        title: json["title"],
        content: json["content"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "image": image,
      };
}
