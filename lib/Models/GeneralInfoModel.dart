// ignore_for_file: file_names

class GeneralInfoModel {
  List<Data>? data;

  GeneralInfoModel({this.data});

  GeneralInfoModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? aboutUs;
  String? termsInfo;
  String? privacyInfo;
  String? hotlineInfo;

  Data(
      {this.id,
      this.aboutUs,
      this.termsInfo,
      this.privacyInfo,
      this.hotlineInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aboutUs = json['about_us'];
    termsInfo = json['terms_info'];
    privacyInfo = json['privacy_info'];
    hotlineInfo = json['hotline_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['about_us'] = aboutUs;
    data['terms_info'] = termsInfo;
    data['privacy_info'] = privacyInfo;
    data['hotline_info'] = hotlineInfo;
    return data;
  }
}
