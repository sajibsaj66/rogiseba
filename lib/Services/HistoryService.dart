// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/HistoryModel.dart';
import '../Utils/BottomBar.dart';

class HistoryService {
  Future<HistoryModel> getAllHistory(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userID = prefs.getInt('user');
    var response = await http.get(
      Uri.parse(
          "https://rogisheba.com/api/get-history?user_id=$userID"),
    );
    if (response.statusCode == 200) {
      HistoryModel historyModel =
          HistoryModel.fromJson(jsonDecode(response.body));
      return historyModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      HistoryModel historyModel2 = HistoryModel();
      return historyModel2;
    }
  }
}
