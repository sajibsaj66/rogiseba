// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/AllHospitalModel.dart';
import 'package:rogisheba/Models/DoctorByHospital.dart';
import 'package:rogisheba/Services/DoctorService.dart';
import 'package:rogisheba/Services/HospitalService.dart';

import '../Models/HospitalDetailsModel.dart';

class HospitalProvider with ChangeNotifier {
  bool isLoading = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isDoctor = false;
  bool isRating = false;
  String hint1 = "হাসপাতালের নাম বাছাই করুন";
  String hint2 = "ডাক্তারের নাম বাছাই করুন";
  int hospitalId = 0;
  int doctorId = 0;
  AllHospitalModel allHospital = AllHospitalModel();
  HospitalDetailsModel hospitalDetails = HospitalDetailsModel();
  DoctorByHospitalModel doctorByHospital = DoctorByHospitalModel();
  void getAllHospital(BuildContext context) async {
    HospitalService hospitalService = HospitalService();
    AllHospitalModel allHospitalModel =
        await hospitalService.getAllHospital(context);
    if (allHospitalModel.data![0].id != null) {
      allHospital = allHospitalModel;
      debugPrint(allHospital.data![0].hospitalName.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void getHospitalDetails(String hospitalID, BuildContext context) async {
    isLoading2 = true;
    HospitalService hospitalService = HospitalService();
    HospitalDetailsModel hospitalDetailsModel =
        await hospitalService.getHospitalDetails(
      hospitalID,
      context,
    );
    if (hospitalDetailsModel.hospitalInfo![0].hospitalId != null) {
      hospitalDetails = hospitalDetailsModel;
      debugPrint(hospitalDetails.hospitalInfo![0].hospitalName.toString());
      isLoading2 = false;
      notifyListeners();
    }
  }

  void getDoctorByHospital(BuildContext context) async {
    isLoading3 = true;
    hint2 = "ডাক্তারের নাম বাছাই করুন";
    isDoctor = false;
    DoctorService doctorService = DoctorService();
    DoctorByHospitalModel doctorByHospitalModel =
        await doctorService.getDoctorByHospital(
      hospitalId.toString(),
      context,
    );
    if (doctorByHospitalModel.data![0].doctorId != null) {
      doctorByHospital = doctorByHospitalModel;
      debugPrint(doctorByHospital.data![0].doctorName.toString());
      isLoading3 = false;
      notifyListeners();
    }
  }

  void setHospital(int val) {
    isRating = true;
    hospitalId = val;
    for (var element in allHospital.data!) {
      if (element.hospitalId == hospitalId) {
        hint1 = element.hospitalName!;
        notifyListeners();
      }
    }
    debugPrint(hospitalId.toString());
    notifyListeners();
  }

  void setDoctorByHospital(int val) {
    isDoctor = true;
    doctorId = val;
    for (var element in doctorByHospital.data!) {
      if (element.hospitalId == hospitalId) {
        hint2 = element.doctorName!;
        notifyListeners();
      } else {
        hint2 = "Doctor Not Availble";
        isDoctor = false;
        notifyListeners();
      }
    }
    debugPrint(doctorId.toString());
    notifyListeners();
  }
}
