// ignore_for_file: file_names

class HealthTipsModel {
  List<Data>? data;

  HealthTipsModel({this.data});

  HealthTipsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? healthTipsId;
  String? healthTipsHeading;
  String? healthTipsAuthor;
  int? healthTipsCatId;
  String? healthTipsImageUrl;
  String? healthTipsDes;

  Data(
      {this.healthTipsId,
      this.healthTipsHeading,
      this.healthTipsAuthor,
      this.healthTipsCatId,
      this.healthTipsImageUrl,
      this.healthTipsDes});

  Data.fromJson(Map<String, dynamic> json) {
    healthTipsId = json['health_tips_id'];
    healthTipsHeading = json['health_tips_heading'];
    healthTipsAuthor = json['health_tips_author'];
    healthTipsCatId = json['health_tips_cat_id'];
    healthTipsImageUrl = json['health_tips_image_url'];
    healthTipsDes = json['health_tips_des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['health_tips_id'] = healthTipsId;
    data['health_tips_heading'] = healthTipsHeading;
    data['health_tips_author'] = healthTipsAuthor;
    data['health_tips_cat_id'] = healthTipsCatId;
    data['health_tips_image_url'] = healthTipsImageUrl;
    data['health_tips_des'] = healthTipsDes;
    return data;
  }
}
