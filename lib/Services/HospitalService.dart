// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rogisheba/Models/AllHospitalModel.dart';

import '../Models/HospitalDetailsModel.dart';
import '../Utils/BottomBar.dart';

class HospitalService {
  Future<AllHospitalModel> getAllHospital(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/get-hospitals"),
    );
    if (response.statusCode == 200) {
      AllHospitalModel allHospitalModel =
          AllHospitalModel.fromJson(jsonDecode(response.body));
      return allHospitalModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      AllHospitalModel allHospitalModel2 = AllHospitalModel();
      return allHospitalModel2;
    }
  }

  Future<HospitalDetailsModel> getHospitalDetails(
    String hospitalID,
    BuildContext context,
  ) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://rogisheba.com/api/hospital-details/$hospitalID'),
    );
    if (response.statusCode == 200) {
      HospitalDetailsModel hospitalDetailsModel =
          HospitalDetailsModel.fromJson(jsonDecode(response.body));
      return hospitalDetailsModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      HospitalDetailsModel hospitalDetailsModel2 = HospitalDetailsModel();
      return hospitalDetailsModel2;
    }
  }
}
