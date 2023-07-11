// ignore_for_file: file_names

class AllBloodGroupModel {
  List<Data>? data;

  AllBloodGroupModel({this.data});

  AllBloodGroupModel.fromJson(Map<String, dynamic> json) {
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
  String? bloodGroupName;

  Data({this.id, this.bloodGroupName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodGroupName = json['blood_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blood_group_name'] = bloodGroupName;
    return data;
  }
}
