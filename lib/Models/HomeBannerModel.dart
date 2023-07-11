// ignore_for_file: file_names

class HomeBannerModel {
  List<Data>? data;

  HomeBannerModel({this.data});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
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
  int? bannerId;
  String? bannerImageUrl;
  int? divisionId;
  int? districtId;
  int? thanaId;
  int? id;
  String? divisionName;
  String? districtName;
  int? divisionRef;
  String? thanaName;
  int? districtRef;

  Data(
      {this.bannerId,
      this.bannerImageUrl,
      this.divisionId,
      this.districtId,
      this.thanaId,
      this.id,
      this.divisionName,
      this.districtName,
      this.divisionRef,
      this.thanaName,
      this.districtRef});

  Data.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerImageUrl = json['banner_image_url'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    thanaId = json['thana_id'];
    id = json['id'];
    divisionName = json['division_name'];
    districtName = json['district_name'];
    divisionRef = json['division_ref'];
    thanaName = json['thana_name'];
    districtRef = json['district_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['banner_image_url'] = bannerImageUrl;
    data['division_id'] = divisionId;
    data['district_id'] = districtId;
    data['thana_id'] = thanaId;
    data['id'] = id;
    data['division_name'] = divisionName;
    data['district_name'] = districtName;
    data['division_ref'] = divisionRef;
    data['thana_name'] = thanaName;
    data['district_ref'] = districtRef;
    return data;
  }
}
