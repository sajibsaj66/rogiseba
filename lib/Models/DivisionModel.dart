// ignore_for_file: file_names

class DivisionModel {
  List<Data>? data;

  DivisionModel({this.data});

  DivisionModel.fromJson(Map<String, dynamic> json) {
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
  String? divisionName;

  Data({this.id, this.divisionName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionName = json['division_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['division_name'] = divisionName;
    return data;
  }
}
