// ignore_for_file: file_names

class AllHospitalModel {
  List<Data>? data;

  AllHospitalModel({this.data});

  AllHospitalModel.fromJson(Map<String, dynamic> json) {
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
  int? hospitalId;
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
  int? id;
  String? name;
  String? divisionName;
  String? districtName;
  int? divisionRef;

  Data(
      {this.hospitalId,
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
      this.id,
      this.name,
      this.divisionName,
      this.districtName,
      this.divisionRef});

  Data.fromJson(Map<String, dynamic> json) {
    hospitalId = json['hospital_id'];
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
    id = json['id'];
    name = json['name'];
    divisionName = json['division_name'];
    districtName = json['district_name'];
    divisionRef = json['division_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hospital_id'] = hospitalId;
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
    data['id'] = id;
    data['name'] = name;
    data['division_name'] = divisionName;
    data['district_name'] = districtName;
    data['division_ref'] = divisionRef;
    return data;
  }
}
