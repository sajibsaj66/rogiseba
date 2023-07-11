// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rogisheba/Models/LoginModel.dart';
import 'package:rogisheba/Models/RegisterModel.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

class AuthService {
  BottomBar bottomBar = BottomBar();

  /// This Is for Login Authenctication
  Future<LoginModel> getLogin(
      String number, String pass, BuildContext context) async {
    var response = await http.post(
      Uri.parse("https://rogisheba.com/api/login"),
      body: ({
        'phone_number': number,
        'password': pass,
      }),
    );
    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    } else {
      bottomBar.showSnackBarRed(context, "Login Failed");
      LoginModel loginModel2 = LoginModel();
      return loginModel2;
    }
  }

  /// This Is for Register Authenctication
  Future<RegisterModel> getRegister(
    String name,
    String number,
    String referCode,
    String dateOfBirth,
    String pass,
    BuildContext context,
  ) async {
    var response = await http.post(
      Uri.parse("https://rogisheba.com/api/user-registration"),
      body: ({
        'name': name,
        'phone_number': number,
        'refer_code': referCode,
        'date_of_birth': dateOfBirth,
        'password': pass,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data["data"] == "This number already used. Try another number") {
        RegisterModel registerModel = RegisterModel();
        return registerModel;
      } else {
        RegisterModel registerModel =
            RegisterModel.fromJson(jsonDecode(response.body));
        return registerModel;
      }
    } else {
      bottomBar.showSnackBarRed(context, "Registration Failed");
      RegisterModel registerModel2 = RegisterModel();
      return registerModel2;
    }
  }
}
