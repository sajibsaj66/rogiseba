// ignore_for_file: file_names

class DoctorByHospitalModel {
  List<Data>? data;

  DoctorByHospitalModel({this.data});

  DoctorByHospitalModel.fromJson(Map<String, dynamic> json) {
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
  int? hospitalId;
  int? doctorId;
  String? hospitalName;
  String? hospitalPicUrl;
  int? hospitalTotalPatientCount;
  int? hospitalBedCount;
  int? hospitalDoctorCount;
  int? hospitalDivisionId;
  int? hospitalDistrictsId;
  int? hospitalThanasId;
  String? hospitalInfo;
  String? hospitalEmail;
  String? hospitalLt;
  String? hospitalLong;
  int? hospitalCategory;
  String? hospitalContactNo;
  String? hospitalAmbulanceNo;
  String? adminName;
  String? adminPhoneNumber;
  String? adminPassword;
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
      this.hospitalId,
      this.doctorId,
      this.hospitalName,
      this.hospitalPicUrl,
      this.hospitalTotalPatientCount,
      this.hospitalBedCount,
      this.hospitalDoctorCount,
      this.hospitalDivisionId,
      this.hospitalDistrictsId,
      this.hospitalThanasId,
      this.hospitalInfo,
      this.hospitalEmail,
      this.hospitalLt,
      this.hospitalLong,
      this.hospitalCategory,
      this.hospitalContactNo,
      this.hospitalAmbulanceNo,
      this.adminName,
      this.adminPhoneNumber,
      this.adminPassword,
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
    hospitalId = json['hospital_id'];
    doctorId = json['doctor_id'];
    hospitalName = json['hospital_name'];
    hospitalPicUrl = json['hospital_pic_url'];
    hospitalTotalPatientCount = json['hospital_total_patient_count'];
    hospitalBedCount = json['hospital_bed_count'];
    hospitalDoctorCount = json['hospital_doctor_count'];
    hospitalDivisionId = json['hospital_division_id'];
    hospitalDistrictsId = json['hospital_districts_id'];
    hospitalThanasId = json['hospital_thanas_id'];
    hospitalInfo = json['hospital_info'];
    hospitalEmail = json['hospital_email'];
    hospitalLt = json['hospital_lt'];
    hospitalLong = json['hospital_long'];
    hospitalCategory = json['hospital_category'];
    hospitalContactNo = json['hospital_contact_no'];
    hospitalAmbulanceNo = json['hospital_ambulance_no'];
    adminName = json['admin_name'];
    adminPhoneNumber = json['admin_phone_number'];
    adminPassword = json['admin_password'];
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
    data['hospital_id'] = hospitalId;
    data['doctor_id'] = doctorId;
    data['hospital_name'] = hospitalName;
    data['hospital_pic_url'] = hospitalPicUrl;
    data['hospital_total_patient_count'] = hospitalTotalPatientCount;
    data['hospital_bed_count'] = hospitalBedCount;
    data['hospital_doctor_count'] = hospitalDoctorCount;
    data['hospital_division_id'] = hospitalDivisionId;
    data['hospital_districts_id'] = hospitalDistrictsId;
    data['hospital_thanas_id'] = hospitalThanasId;
    data['hospital_info'] = hospitalInfo;
    data['hospital_email'] = hospitalEmail;
    data['hospital_lt'] = hospitalLt;
    data['hospital_long'] = hospitalLong;
    data['hospital_category'] = hospitalCategory;
    data['hospital_contact_no'] = hospitalContactNo;
    data['hospital_ambulance_no'] = hospitalAmbulanceNo;
    data['admin_name'] = adminName;
    data['admin_phone_number'] = adminPhoneNumber;
    data['admin_password'] = adminPassword;
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
