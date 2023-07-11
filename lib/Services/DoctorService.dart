// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rogisheba/Models/AllDoctorModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/DoctorByHospital.dart';
import '../Models/DoctorCategoryModel.dart';
import '../Models/DoctorDetailsModel.dart';
import '../Models/DoctorRatingModel.dart';
import '../Models/GetDoctorByCategoryModel.dart';
import '../Providers/AddDonatorProvider.dart';
import '../Utils/BottomBar.dart';

class DoctorService {
  Future<AllDoctorModel> getAllDoctor(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/get-doctors"),
    );
    if (response.statusCode == 200) {
      AllDoctorModel allDoctorModel =
          AllDoctorModel.fromJson(jsonDecode(response.body));
      return allDoctorModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      AllDoctorModel allDoctorModel2 = AllDoctorModel();
      return allDoctorModel2;
    }
  }

  Future<AllDoctorModel> getSpecificDoctor(BuildContext context) async {
    final provider = Provider.of<AddDonatorProvider>(context, listen: false);
    String div = provider.divisionID.toString();
    String dis = provider.districtID.toString();
    String thana = provider.thanaID.toString();
    debugPrint(div);
    debugPrint(dis);
    debugPrint(thana);
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-doctors?division_id=$div&district_id=$dis&thana_id=$thana"),
    );
    if (response.statusCode == 200) {
      AllDoctorModel allDoctorModel =
          AllDoctorModel.fromJson(jsonDecode(response.body));
      return allDoctorModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      AllDoctorModel allDoctorModel2 = AllDoctorModel();
      return allDoctorModel2;
    }
  }

  Future<DoctorDetailsModel> getDoctorDetails(
      String doctorID, BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/doctor-details/$doctorID"),
    );
    if (response.statusCode == 200) {
      DoctorDetailsModel doctorDetailsModel =
          DoctorDetailsModel.fromJson(jsonDecode(response.body));
      return doctorDetailsModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DoctorDetailsModel doctorDetailsModel = DoctorDetailsModel();
      return doctorDetailsModel;
    }
  }

  Future<DoctorByHospitalModel> getDoctorByHospital(
      String hospitalID, BuildContext context) async {
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-doctors-by-hospital?hospital_id=$hospitalID"),
    );
    if (response.statusCode == 200) {
      DoctorByHospitalModel doctorByHospitalModel =
          DoctorByHospitalModel.fromJson(jsonDecode(response.body));
      return doctorByHospitalModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DoctorByHospitalModel doctorByHospitalModel = DoctorByHospitalModel();
      return doctorByHospitalModel;
    }
  }

  Future<DoctorRatingsModel> addDoctorRating(
    String doctorId,
    String hospitalId,
    double rating,
    BuildContext context,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('user');
    var response = await http.post(
      Uri.parse(
          "https://rogisheba.com/api/add-doctor-rating?user_id=$id"),
      body: ({
        'doctor_id': doctorId,
        'hospital_id': hospitalId.toString(),
        'rating': rating.toString(),
      }),
    );
    if (response.statusCode == 200) {
      DoctorRatingsModel doctorRatingsModel =
          DoctorRatingsModel.fromJson(jsonDecode(response.body));
      return doctorRatingsModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DoctorRatingsModel doctorRatingsModel = DoctorRatingsModel();
      return doctorRatingsModel;
    }
  }

  Future<DoctorCategoryModel> getDoctorCategory(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/get-doctor-categories"),
    );
    if (response.statusCode == 200) {
      DoctorCategoryModel doctorCategoryModel =
          DoctorCategoryModel.fromJson(jsonDecode(response.body));
      return doctorCategoryModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DoctorCategoryModel doctorCategoryModel2 = DoctorCategoryModel();
      return doctorCategoryModel2;
    }
  }

  Future<GetDoctorByCategoryModel> getDoctorByCategory(
    String category,
    BuildContext context,
  ) async {
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-doctors?doctor_category=$category"),
    );
    if (response.statusCode == 200) {
      GetDoctorByCategoryModel getDoctorByCategoryModel =
          GetDoctorByCategoryModel.fromJson(jsonDecode(response.body));
      return getDoctorByCategoryModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      GetDoctorByCategoryModel getDoctorByCategoryModel2 =
          GetDoctorByCategoryModel();
      return getDoctorByCategoryModel2;
    }
  }
}
