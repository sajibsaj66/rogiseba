// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rogisheba/Models/HealthTipsModel.dart';

import '../Utils/BottomBar.dart';

class HealthTipsService {
  Future<HealthTipsModel> getTips(BuildContext context) async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/health_tips"),
    );
    if (response.statusCode == 200) {
      HealthTipsModel healthTipsModel =
          HealthTipsModel.fromJson(jsonDecode(response.body));
      return healthTipsModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      HealthTipsModel healthTipsModel2 = HealthTipsModel();
      return healthTipsModel2;
    }
  }
}
