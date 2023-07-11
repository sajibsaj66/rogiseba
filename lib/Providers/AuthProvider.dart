// ignore_for_file: file_names, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/LoginModel.dart';
import 'package:rogisheba/Models/RegisterModel.dart';
import 'package:rogisheba/Services/AuthServices.dart';
import 'package:rogisheba/Utils/BottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/HomePage/HomeRoot.dart';

// creating auth provider for manage authentication related state management.
class AuthProvider with ChangeNotifier {
  bool isLogin = true;
  bool isLoginDone = false;
  bool isNameGetting = true;
  int id = 0;
  LoginModel login = LoginModel();
  RegisterModel register = RegisterModel();
  AuthService authService = AuthService();
  BottomBar bottomBar = BottomBar();
  void checkLogin(bool val) {
    isLogin = val;
    notifyListeners();
  }

  /// This Is for Login Authenctication
  void getLogin(String phone, String pass, BuildContext context) async {
    if (phone.isNotEmpty && pass.isNotEmpty) {
      if ((phone[0] != '0' || phone[1] != '1') ||
          (phone[2] == '1' ||
              phone[2] == '2' ||
              phone[2] == '4' ||
              phone[2] == '0')) {
        bottomBar.showSnackBarRed(context, "Number Not Valid");
      } else {
        isLoginDone = true;
        notifyListeners();
        LoginModel loginModel =
            await authService.getLogin(phone, pass, context);
        if (loginModel.data == "Login successfully" &&
            loginModel.user != null) {
          login = loginModel;
          setName(login.user![0].name.toString(),
              login.user![0].phoneNumber.toString());
          bottomBar.showSnackBarGreen(context, loginModel.data.toString());
          setKeyValue(loginModel.user![0].userId as int);
          isLoginDone = false;
          notifyListeners();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const HomeRoot();
            },
          ), (route) => false);
        } else {
          setName("User", "Empty");
          bottomBar.showSnackBarRed(context, "Incorrect Email Or Password");
          isLoginDone = false;
          notifyListeners();
        }
      }
    } else {
      bottomBar.showSnackBarRed(context, "Both field needs to fill");
    }
  }

  /// This Is for Register Authenctication
  void getRegister(
    String name,
    String number,
    String referCode,
    String dateOfBirth,
    String pass,
    BuildContext context,
  ) async {
    if (name.isNotEmpty &&
        number.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        pass.isNotEmpty) {
      if ((number[0] != '0' || number[1] != '1') ||
          (number[2] == '1' ||
              number[2] == '2' ||
              number[2] == '4' ||
              number[2] == '0')) {
        bottomBar.showSnackBarRed(context, "Number Not Valid");
      } else {
        isLoginDone = true;
        notifyListeners();
        RegisterModel registerModel = await authService.getRegister(
          name,
          number,
          referCode,
          dateOfBirth,
          pass,
          context,
        );
        if (registerModel.user?[0].id == null) {
          setName("User", "Empty");
          bottomBar.showSnackBarRed(
            context,
            "This number already used. Try another number Or Invalid refer code",
          );
          isLoginDone = false;
          notifyListeners();
        } else {
          register = registerModel;
          setName(register.user![0].name.toString(),
              register.user![0].phoneNumber.toString());
          bottomBar.showSnackBarGreen(context, "Register successfully");
          setKeyValue(registerModel.user?[0].userId as int);
          isLoginDone = false;
          notifyListeners();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const HomeRoot();
            },
          ), (route) => false);
        }
      }
    } else {
      bottomBar.showSnackBarRed(context, "Both field needs to fill");
    }
  }

  void setKeyValue(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("user", userId);
    id = userId;
    notifyListeners();
  }

  void setName(String name, String number) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('number', number);
  }

  Future<List<String>> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    final String? number = prefs.getString('number');
    isNameGetting = false;
    notifyListeners();
    return [name!, number!];
  }
}
