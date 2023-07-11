// ignore_for_file: file_names

class BloodDonationGroupModel {
  List<Data>? data;

  BloodDonationGroupModel({this.data});

  BloodDonationGroupModel.fromJson(Map<String, dynamic> json) {
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
  String? bloodDonationGroupName;

  Data({this.id, this.bloodDonationGroupName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodDonationGroupName = json['blood_donation_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blood_donation_group_name'] = bloodDonationGroupName;
    return data;
  }
}
