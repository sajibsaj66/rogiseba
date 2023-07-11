// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Models/AllDoctorModel.dart';
import 'package:rogisheba/Models/DoctorDetailsModel.dart';
import 'package:rogisheba/Models/DoctorRatingModel.dart';
import 'package:rogisheba/Models/GetDoctorByCategoryModel.dart';
import 'package:rogisheba/Providers/HospitalProvider.dart';
import 'package:rogisheba/Services/DoctorService.dart';

import '../Models/DoctorCategoryModel.dart';
import '../Utils/BottomBar.dart';

class DoctorProvider with ChangeNotifier {
  bool isLoading = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isRating = false;
  AllDoctorModel allDoctor = AllDoctorModel();
  AllDoctorModel specificDoctor = AllDoctorModel();
  DoctorDetailsModel doctorDetails = DoctorDetailsModel();
  DoctorRatingsModel doctorRatings = DoctorRatingsModel();
  DoctorCategoryModel doctorCategory = DoctorCategoryModel();
  GetDoctorByCategoryModel getDoctorByCategory = GetDoctorByCategoryModel();
  void getAllDoctor(BuildContext context) async {
    DoctorService doctorService = DoctorService();
    AllDoctorModel allDoctorModel = await doctorService.getAllDoctor(context);
    if (allDoctorModel.data![0].doctorId != null) {
      allDoctor = allDoctorModel;
      debugPrint(allDoctor.data![0].doctorName.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void getSpecificDoctor(BuildContext context) async {
    DoctorService doctorService = DoctorService();
    AllDoctorModel allDoctorModel =
        await doctorService.getSpecificDoctor(context);
    if (allDoctorModel.data![0].doctorId != null) {
      specificDoctor = allDoctorModel;
      debugPrint(specificDoctor.data![0].doctorName.toString());
      isLoading2 = false;
      notifyListeners();
    } else {
      isLoading2 = false;
      notifyListeners();
    }
  }

  void getDoctorDetails(String doctorID, BuildContext context) async {
    isLoading3 = true;
    DoctorService doctorService = DoctorService();
    DoctorDetailsModel doctorDetailsModel =
        await doctorService.getDoctorDetails(doctorID, context);
    if (doctorDetailsModel.doctorInfo![0].doctorId != null) {
      doctorDetails = doctorDetailsModel;
      debugPrint(doctorDetails.doctorInfo![0].doctorName.toString());
      isLoading3 = false;
      notifyListeners();
    }
  }

  void addDoctorRating(double ratings, BuildContext context) async {
    final provider = Provider.of<HospitalProvider>(context, listen: false);
    String doctorId = provider.doctorId.toString();
    String hospitalId = provider.hospitalId.toString();
    DoctorService doctorService = DoctorService();
    if (doctorId.isEmpty || hospitalId.isEmpty || ratings == 0.0) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Both Field needs to fill");
    } else {
      isRating = true;
      notifyListeners();
      DoctorRatingsModel doctorRatingsModel =
          await doctorService.addDoctorRating(
        doctorId,
        hospitalId,
        ratings,
        context,
      );
      if (doctorRatingsModel.data![0].doctorName != null) {
        doctorRatings = doctorRatingsModel;
        debugPrint(doctorRatings.data![0].doctorName.toString());
        isRating = false;
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarGreen(context, "Ratings Added Successfully");
        notifyListeners();
      }
    }
  }

  void getDoctorCategory(BuildContext context) async {
    DoctorService doctorService = DoctorService();
    DoctorCategoryModel doctorCategoryModel =
        await doctorService.getDoctorCategory(context);
    if (doctorCategoryModel.data![0].id != null) {
      doctorCategory = doctorCategoryModel;
      debugPrint(doctorCategory.data![0].name.toString());
      isLoading4 = false;
      notifyListeners();
    }
  }

  void getDoctorWithCategory(String category, BuildContext context) async {
    isLoading5 = true;
    DoctorService doctorService = DoctorService();
    GetDoctorByCategoryModel getDoctorByCategoryModel =
        await doctorService.getDoctorByCategory(category, context);
    if (getDoctorByCategoryModel.data![0].id != null) {
      getDoctorByCategory = getDoctorByCategoryModel;
      debugPrint(getDoctorByCategory.data![0].name.toString());
      isLoading5 = false;
      notifyListeners();
    }
  }
}
