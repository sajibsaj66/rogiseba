// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rogisheba/Models/ComplainModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/BottomBar.dart';

class ComplainService {
  BottomBar bottomBar = BottomBar();
  Future<ComplainModel> postComplain(String complaintName,
      String complaintMessage, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userID = prefs.getInt('user');

    var response = await http.post(
      Uri.parse(
          "https://rogisheba.com/api/add-complain?user_id=$userID"),
      body: ({
        'complaint_name': complaintName,
        'complaint_message': complaintMessage,
      }),
    );
    if (response.statusCode == 200) {
      ComplainModel complainModel =
          ComplainModel.fromJson(jsonDecode(response.body));
      return complainModel;
    } else {
      bottomBar.showSnackBarRed(context, "Complain Sending Failed");
      ComplainModel complainModel2 = ComplainModel();
      return complainModel2;
    }
  }
}
