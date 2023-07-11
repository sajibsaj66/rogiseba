// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use, depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rogisheba/Models/GeneralInfoModel.dart';
import 'package:rogisheba/Utils/BottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:async/async.dart';
import 'package:path/path.dart';

import '../Models/HomeBannerModel.dart';
import '../Models/ProfileModel.dart';

class ProfileServices {
  Future<ProfileModel> getProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userID = prefs.getInt('user');
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/user_info?user_id=$userID"),
    );
    if (response.statusCode == 200) {
      ProfileModel profileModel =
          ProfileModel.fromJson(jsonDecode(response.body));
      return profileModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Data Load Failed");
      ProfileModel profileModel2 = ProfileModel();
      return profileModel2;
    }
  }

  Future<GeneralInfoModel> getGeneralInfo() async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/general_info"),
    );
    if (response.statusCode == 200) {
      GeneralInfoModel generalInfoModel =
          GeneralInfoModel.fromJson(jsonDecode(response.body));
      return generalInfoModel;
    } else {
      GeneralInfoModel generalInfoModel2 = GeneralInfoModel();
      return generalInfoModel2;
    }
  }

  Future<int> setProfile(
    File image,
    String age,
    int bloodGroupiD,
    String gender,
    String point,
    String email,
    BuildContext context,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userID = prefs.getInt('user');

    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    // stream.cast();

    var length = await image.length();

    var uri =
        Uri.parse('https://rogisheba.com/api/user_info?user_id=$userID');

    var request = http.MultipartRequest('POST', uri);

    request.fields['age'] = age;
    request.fields['blood_group_id'] = bloodGroupiD.toString();
    request.fields['gender'] = gender;
    request.fields['point'] = point;
    request.fields['email'] = email;
    var multiport = http.MultipartFile(
      'profile_image',
      stream,
      length,
      filename: basename(image.path),
    );
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarGreen(context, "Profile Set Successful");
      return 200;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Profile Set Failed");
      return 400;
    }
  }

  Future<HomeBannerModel> getBanner() async {
    var response = await http.get(
      Uri.parse("https://rogisheba.com/api/banner-top"),
    );
    if (response.statusCode == 200) {
      HomeBannerModel homeBannerModel =
          HomeBannerModel.fromJson(jsonDecode(response.body));
      return homeBannerModel;
    } else {
      HomeBannerModel homeBannerModel2 = HomeBannerModel();
      return homeBannerModel2;
    }
  }
}
