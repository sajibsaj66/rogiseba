// ignore_for_file: file_names

class HospitalDetailsModel {
  List<HospitalInfo>? hospitalInfo;
  List<HospitalOperations>? hospitalOperations;
  List<HospitalSectors>? hospitalSectors;

  HospitalDetailsModel(
      {this.hospitalInfo, this.hospitalOperations, this.hospitalSectors});

  HospitalDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['hospital_info'] != null) {
      hospitalInfo = <HospitalInfo>[];
      json['hospital_info'].forEach((v) {
        hospitalInfo!.add(HospitalInfo.fromJson(v));
      });
    }
    if (json['hospital_operations'] != null) {
      hospitalOperations = <HospitalOperations>[];
      json['hospital_operations'].forEach((v) {
        hospitalOperations!.add(HospitalOperations.fromJson(v));
      });
    }
    if (json['hospital_sectors'] != null) {
      hospitalSectors = <HospitalSectors>[];
      json['hospital_sectors'].forEach((v) {
        hospitalSectors!.add(HospitalSectors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hospitalInfo != null) {
      data['hospital_info'] =
          hospitalInfo!.map((v) => v.toJson()).toList();
    }
    if (hospitalOperations != null) {
      data['hospital_operations'] =
          hospitalOperations!.map((v) => v.toJson()).toList();
    }
    if (hospitalSectors != null) {
      data['hospital_sectors'] =
          hospitalSectors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HospitalInfo {
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

  HospitalInfo(
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

  HospitalInfo.fromJson(Map<String, dynamic> json) {
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

class HospitalOperations {
  int? id;
  int? hospitalId;
  int? hospitalOperationId;
  String? operationName;

  HospitalOperations(
      {this.id, this.hospitalId, this.hospitalOperationId, this.operationName});

  HospitalOperations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospital_id'];
    hospitalOperationId = json['hospital_operation_id'];
    operationName = json['operation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hospital_id'] = hospitalId;
    data['hospital_operation_id'] = hospitalOperationId;
    data['operation_name'] = operationName;
    return data;
  }
}

class HospitalSectors {
  int? id;
  int? hospitalId;
  int? hospitalSectorId;
  String? sectorName;

  HospitalSectors(
      {this.id, this.hospitalId, this.hospitalSectorId, this.sectorName});

  HospitalSectors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospital_id'];
    hospitalSectorId = json['hospital_sector_id'];
    sectorName = json['sector_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hospital_id'] = hospitalId;
    data['hospital_sector_id'] = hospitalSectorId;
    data['sector_name'] = sectorName;
    return data;
  }
}
