// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/AllBloodGroupModel.dart';
import 'package:rogisheba/Models/BloodDonationGroupModel.dart';
import 'package:http/http.dart' as http;

import '../Models/AllDonatorModel.dart';
import '../Utils/BottomBar.dart';

class BloodService {
  Future<BloodDonationGroupModel> getAllDonationGroup(
      BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/blood-donation-group"),
    );
    if (response.statusCode == 200) {
      BloodDonationGroupModel bloodDonationGroupModel =
          BloodDonationGroupModel.fromJson(jsonDecode(response.body));
      return bloodDonationGroupModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      BloodDonationGroupModel bloodDonationGroupModel2 =
          BloodDonationGroupModel();
      return bloodDonationGroupModel2;
    }
  }

  Future<AllBloodGroupModel> getAllBloodGroup(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/blood-group"),
    );
    if (response.statusCode == 200) {
      AllBloodGroupModel allBloodGroupModel =
          AllBloodGroupModel.fromJson(jsonDecode(response.body));
      return allBloodGroupModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      AllBloodGroupModel allBloodGroupModel2 = AllBloodGroupModel();
      return allBloodGroupModel2;
    }
  }

  Future<AllDonatorModel> getAllDonator(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/get-donator"),
    );
    if (response.statusCode == 200) {
      AllDonatorModel allDonatorModel =
          AllDonatorModel.fromJson(jsonDecode(response.body));
      return allDonatorModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      AllDonatorModel allDonatorModel2 = AllDonatorModel();
      return allDonatorModel2;
    }
  }
}
