// ignore_for_file: file_names

class HistoryModel {
  List<Appoinment>? appoinment;
  List<Operation>? operation;

  HistoryModel({this.appoinment, this.operation});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['appoinment'] != null) {
      appoinment = <Appoinment>[];
      json['appoinment'].forEach((v) {
        appoinment!.add(Appoinment.fromJson(v));
      });
    }
    if (json['operation'] != null) {
      operation = <Operation>[];
      json['operation'].forEach((v) {
        operation!.add(Operation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appoinment != null) {
      data['appoinment'] = appoinment!.map((v) => v.toJson()).toList();
    }
    if (operation != null) {
      data['operation'] = operation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appoinment {
  int? id;
  int? hospitalId;
  int? doctorId;
  String? patientName;
  String? patientNumber;
  int? patientId;
  String? appointmentDate;
  String? appointmentTime;
  int? serialId;
  int? patientArrival;
  String? patientArrivalDate;
  int? patientTest;
  String? patientTestDate;
  int? patientTestFee;
  String? name;
  String? phoneNumber;
  String? ownReferCode;
  String? referCode;
  String? dateOfBirth;
  String? password;
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

  Appoinment(
      {this.id,
      this.hospitalId,
      this.doctorId,
      this.patientName,
      this.patientNumber,
      this.patientId,
      this.appointmentDate,
      this.appointmentTime,
      this.serialId,
      this.patientArrival,
      this.patientArrivalDate,
      this.patientTest,
      this.patientTestDate,
      this.patientTestFee,
      this.name,
      this.phoneNumber,
      this.ownReferCode,
      this.referCode,
      this.dateOfBirth,
      this.password,
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

  Appoinment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospital_id'];
    doctorId = json['doctor_id'];
    patientName = json['patient_name'];
    patientNumber = json['patient_number'];
    patientId = json['patient_id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    serialId = json['serial_id'];
    patientArrival = json['patient_arrival'];
    patientArrivalDate = json['patient_arrival_date'];
    patientTest = json['patient_test'];
    patientTestDate = json['patient_test_date'];
    patientTestFee = json['patient_test_fee'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    ownReferCode = json['own_refer_code'];
    referCode = json['refer_code'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
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
    data['patient_name'] = patientName;
    data['patient_number'] = patientNumber;
    data['patient_id'] = patientId;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    data['serial_id'] = serialId;
    data['patient_arrival'] = patientArrival;
    data['patient_arrival_date'] = patientArrivalDate;
    data['patient_test'] = patientTest;
    data['patient_test_date'] = patientTestDate;
    data['patient_test_fee'] = patientTestFee;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['own_refer_code'] = ownReferCode;
    data['refer_code'] = referCode;
    data['date_of_birth'] = dateOfBirth;
    data['password'] = password;
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

class Operation {
  int? id;
  int? hospitalId;
  int? doctorId;
  String? patientName;
  String? patientNumber;
  int? patientId;
  String? operationDate;
  String? operationTime;
  int? testStatus;
  String? name;
  String? phoneNumber;
  String? ownReferCode;
  String? referCode;
  String? dateOfBirth;
  String? password;
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

  Operation(
      {this.id,
      this.hospitalId,
      this.doctorId,
      this.patientName,
      this.patientNumber,
      this.patientId,
      this.operationDate,
      this.operationTime,
      this.testStatus,
      this.name,
      this.phoneNumber,
      this.ownReferCode,
      this.referCode,
      this.dateOfBirth,
      this.password,
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

  Operation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospital_id'];
    doctorId = json['doctor_id'];
    patientName = json['patient_name'];
    patientNumber = json['patient_number'];
    patientId = json['patient_id'];
    operationDate = json['operation_date'];
    operationTime = json['operation_time'];
    testStatus = json['test_status'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    ownReferCode = json['own_refer_code'];
    referCode = json['refer_code'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
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
    data['patient_name'] = patientName;
    data['patient_number'] = patientNumber;
    data['patient_id'] = patientId;
    data['operation_date'] = operationDate;
    data['operation_time'] = operationTime;
    data['test_status'] = testStatus;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['own_refer_code'] = ownReferCode;
    data['refer_code'] = referCode;
    data['date_of_birth'] = dateOfBirth;
    data['password'] = password;
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
