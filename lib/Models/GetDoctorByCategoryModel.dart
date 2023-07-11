// ignore_for_file: file_names

class GetDoctorByCategoryModel {
  List<Data>? data;

  GetDoctorByCategoryModel({this.data});

  GetDoctorByCategoryModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorId;
  String? doctorName;
  String? doctorPicUrl;
  String? doctorDegree;
  int? doctorTotalPatientCount;
  int? doctorDivisionId;
  int? doctorDistrictId;
  int? doctorThanaId;
  String? doctorInfo;
  String? doctorExperience;
  int? doctorFees;
  int? doctorCategory;
  String? doctorContactNo;
  int? id;
  String? name;
  String? divisionName;
  String? districtName;
  int? divisionRef;
  String? thanaName;
  int? districtRef;

  Data(
      {this.doctorId,
      this.doctorName,
      this.doctorPicUrl,
      this.doctorDegree,
      this.doctorTotalPatientCount,
      this.doctorDivisionId,
      this.doctorDistrictId,
      this.doctorThanaId,
      this.doctorInfo,
      this.doctorExperience,
      this.doctorFees,
      this.doctorCategory,
      this.doctorContactNo,
      this.id,
      this.name,
      this.divisionName,
      this.districtName,
      this.divisionRef,
      this.thanaName,
      this.districtRef});

  Data.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorPicUrl = json['doctor_pic_url'];
    doctorDegree = json['doctor_degree'];
    doctorTotalPatientCount = json['doctor_total_patient_count'];
    doctorDivisionId = json['doctor_division_id'];
    doctorDistrictId = json['doctor_district_id'];
    doctorThanaId = json['doctor_thana_id'];
    doctorInfo = json['doctor_info'];
    doctorExperience = json['doctor_experience'];
    doctorFees = json['doctor_fees'];
    doctorCategory = json['doctor_category'];
    doctorContactNo = json['doctor_contact_no'];
    id = json['id'];
    name = json['name'];
    divisionName = json['division_name'];
    districtName = json['district_name'];
    divisionRef = json['division_ref'];
    thanaName = json['thana_name'];
    districtRef = json['district_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['doctor_name'] = doctorName;
    data['doctor_pic_url'] = doctorPicUrl;
    data['doctor_degree'] = doctorDegree;
    data['doctor_total_patient_count'] = doctorTotalPatientCount;
    data['doctor_division_id'] = doctorDivisionId;
    data['doctor_district_id'] = doctorDistrictId;
    data['doctor_thana_id'] = doctorThanaId;
    data['doctor_info'] = doctorInfo;
    data['doctor_experience'] = doctorExperience;
    data['doctor_fees'] = doctorFees;
    data['doctor_category'] = doctorCategory;
    data['doctor_contact_no'] = doctorContactNo;
    data['id'] = id;
    data['name'] = name;
    data['division_name'] = divisionName;
    data['district_name'] = districtName;
    data['division_ref'] = divisionRef;
    data['thana_name'] = thanaName;
    data['district_ref'] = districtRef;
    return data;
  }
}
