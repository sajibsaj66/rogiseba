// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class DoctorDetailsModel {
  List<DoctorInfo>? doctorInfo;
  var doctorRating;
  List<DoctorTime>? doctorTime;
  List<DoctorOffDay>? doctorOffDay;
  List<DoctorSectors>? doctorSectors;

  DoctorDetailsModel(
      {this.doctorInfo,
      this.doctorRating,
      this.doctorTime,
      this.doctorOffDay,
      this.doctorSectors});

  DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor_info'] != null) {
      doctorInfo = <DoctorInfo>[];
      json['doctor_info'].forEach((v) {
        doctorInfo!.add(DoctorInfo.fromJson(v));
      });
    }
    doctorRating = json['doctor_rating'];
    if (json['doctor_time'] != null) {
      doctorTime = <DoctorTime>[];
      json['doctor_time'].forEach((v) {
        doctorTime!.add(DoctorTime.fromJson(v));
      });
    }
    if (json['doctor_off_day'] != null) {
      doctorOffDay = <DoctorOffDay>[];
      json['doctor_off_day'].forEach((v) {
        doctorOffDay!.add(DoctorOffDay.fromJson(v));
      });
    }
    if (json['doctor_sectors'] != null) {
      doctorSectors = <DoctorSectors>[];
      json['doctor_sectors'].forEach((v) {
        doctorSectors!.add(DoctorSectors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorInfo != null) {
      data['doctor_info'] = doctorInfo!.map((v) => v.toJson()).toList();
    }
    data['doctor_rating'] = doctorRating;
    if (doctorTime != null) {
      data['doctor_time'] = doctorTime!.map((v) => v.toJson()).toList();
    }
    if (doctorOffDay != null) {
      data['doctor_off_day'] = doctorOffDay!.map((v) => v.toJson()).toList();
    }
    if (doctorSectors != null) {
      data['doctor_sectors'] = doctorSectors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorInfo {
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

  DoctorInfo(
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

  DoctorInfo.fromJson(Map<String, dynamic> json) {
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

class DoctorTime {
  int? id;
  int? doctorId;
  int? hostipalId;
  String? time;
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

  DoctorTime(
      {this.id,
      this.doctorId,
      this.hostipalId,
      this.time,
      this.hospitalId,
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
      this.adminPassword});

  DoctorTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    hostipalId = json['hostipal_id'];
    time = json['time'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['hostipal_id'] = hostipalId;
    data['time'] = time;
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
    return data;
  }
}

class DoctorOffDay {
  int? id;
  int? doctorId;
  String? doctorOffDay;

  DoctorOffDay({this.id, this.doctorId, this.doctorOffDay});

  DoctorOffDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    doctorOffDay = json['doctor_off_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['doctor_off_day'] = doctorOffDay;
    return data;
  }
}

class DoctorSectors {
  int? id;
  int? doctorId;
  int? doctorSectorId;
  String? sectorName;

  DoctorSectors({this.id, this.doctorId, this.doctorSectorId, this.sectorName});

  DoctorSectors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    doctorSectorId = json['doctor_sector_id'];
    sectorName = json['sector_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['doctor_sector_id'] = doctorSectorId;
    data['sector_name'] = sectorName;
    return data;
  }
}
