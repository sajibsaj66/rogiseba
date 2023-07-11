// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/DistrictModel.dart';
import '../Models/DivisionModel.dart';
import '../Models/ThanaModel.dart';
import '../Utils/BottomBar.dart';

class LocationService {
  Future<DivisionModel> getDivision(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/get-divisions"),
    );
    if (response.statusCode == 200) {
      DivisionModel divisionModel =
          DivisionModel.fromJson(jsonDecode(response.body));
      return divisionModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DivisionModel divisionModel2 = DivisionModel();
      return divisionModel2;
    }
  }

  Future<DistrictModel> getDistrict(BuildContext context, int divID) async {
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-districts?division_id=$divID"),
    );
    if (response.statusCode == 200) {
      DistrictModel districtModel =
          DistrictModel.fromJson(jsonDecode(response.body));
      return districtModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      DistrictModel districtModel2 = DistrictModel();
      return districtModel2;
    }
  }

  Future<ThanaModel> getThana(BuildContext context, int disID) async {
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-thanas?districts_id=$disID"),
    );
    if (response.statusCode == 200) {
      ThanaModel thanaModel = ThanaModel.fromJson(jsonDecode(response.body));
      return thanaModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      ThanaModel thanaModel2 = ThanaModel();
      return thanaModel2;
    }
  }
}
