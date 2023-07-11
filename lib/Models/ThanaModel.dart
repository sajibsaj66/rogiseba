// ignore_for_file: file_names

class ThanaModel {
  List<Data>? data;

  ThanaModel({this.data});

  ThanaModel.fromJson(Map<String, dynamic> json) {
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
  String? thanaName;
  int? districtRef;

  Data({this.id, this.thanaName, this.districtRef});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thanaName = json['thana_name'];
    districtRef = json['district_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thana_name'] = thanaName;
    data['district_ref'] = districtRef;
    return data;
  }
}
