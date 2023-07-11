// ignore_for_file: file_names

class DistrictModel {
  List<Data>? data;

  DistrictModel({this.data});

  DistrictModel.fromJson(Map<String, dynamic> json) {
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
  String? districtName;
  int? divisionRef;

  Data({this.id, this.districtName, this.divisionRef});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtName = json['district_name'];
    divisionRef = json['division_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['district_name'] = districtName;
    data['division_ref'] = divisionRef;
    return data;
  }
}
