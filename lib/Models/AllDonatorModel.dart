// ignore_for_file: file_names

class AllDonatorModel {
  List<Data>? data;

  AllDonatorModel({this.data});

  AllDonatorModel.fromJson(Map<String, dynamic> json) {
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
  String? donatorName;
  String? donatorMobileNumber;
  int? bloodGroupId;
  int? bloodDonationGroupId;
  int? divisionId;
  int? districtId;
  int? thanaId;
  String? bloodGroupName;
  String? bloodDonationGroupName;
  String? divisionName;
  String? districtName;
  int? divisionRef;
  String? thanaName;
  int? districtRef;

  Data(
      {this.id,
      this.donatorName,
      this.donatorMobileNumber,
      this.bloodGroupId,
      this.bloodDonationGroupId,
      this.divisionId,
      this.districtId,
      this.thanaId,
      this.bloodGroupName,
      this.bloodDonationGroupName,
      this.divisionName,
      this.districtName,
      this.divisionRef,
      this.thanaName,
      this.districtRef});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donatorName = json['donator_name'];
    donatorMobileNumber = json['donator_mobile_number'];
    bloodGroupId = json['blood_group_id'];
    bloodDonationGroupId = json['blood_donation_group_id'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    thanaId = json['thana_id'];
    bloodGroupName = json['blood_group_name'];
    bloodDonationGroupName = json['blood_donation_group_name'];
    divisionName = json['division_name'];
    districtName = json['district_name'];
    divisionRef = json['division_ref'];
    thanaName = json['thana_name'];
    districtRef = json['district_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['donator_name'] = donatorName;
    data['donator_mobile_number'] = donatorMobileNumber;
    data['blood_group_id'] = bloodGroupId;
    data['blood_donation_group_id'] = bloodDonationGroupId;
    data['division_id'] = divisionId;
    data['district_id'] = districtId;
    data['thana_id'] = thanaId;
    data['blood_group_name'] = bloodGroupName;
    data['blood_donation_group_name'] = bloodDonationGroupName;
    data['division_name'] = divisionName;
    data['district_name'] = districtName;
    data['division_ref'] = divisionRef;
    data['thana_name'] = thanaName;
    data['district_ref'] = districtRef;
    return data;
  }
}
