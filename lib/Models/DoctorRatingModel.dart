// ignore_for_file: file_names

class DoctorRatingsModel {
  String? message;
  List<Data>? data;

  DoctorRatingsModel({this.message, this.data});

  DoctorRatingsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? doctorId;
  int? rating;
  String? name;
  String? phoneNumber;
  String? ownReferCode;
  String? referCode;
  String? dateOfBirth;
  String? password;
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

  Data(
      {this.id,
      this.userId,
      this.doctorId,
      this.rating,
      this.name,
      this.phoneNumber,
      this.ownReferCode,
      this.referCode,
      this.dateOfBirth,
      this.password,
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
      this.doctorContactNo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    rating = json['rating'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    ownReferCode = json['own_refer_code'];
    referCode = json['refer_code'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['doctor_id'] = doctorId;
    data['rating'] = rating;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['own_refer_code'] = ownReferCode;
    data['refer_code'] = referCode;
    data['date_of_birth'] = dateOfBirth;
    data['password'] = password;
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
    return data;
  }
}
