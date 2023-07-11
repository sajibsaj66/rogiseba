// ignore_for_file: unused_import, file_names, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Models/GeneralInfoModel.dart';
import 'package:rogisheba/Models/ProfileModel.dart';
import 'package:rogisheba/Providers/AddDonatorProvider.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';
import 'package:rogisheba/Services/ProfileServices.dart';

import '../Models/HomeBannerModel.dart';
import '../Pages/HomePage/HomeRoot.dart';

class ProfileProvider with ChangeNotifier {
  bool isProfile = true;
  bool isGeneral = true;
  bool isBanner = true;
  bool isGender = false;
  bool isSet = false;
  List<String> userData = [];
  List<String> gender = ["Male", "Female"];
  String genderText = "লিঙ্গ নির্বাচন করুন";
  ProfileModel profile = ProfileModel();
  GeneralInfoModel generalInfo = GeneralInfoModel();
  HomeBannerModel homeBanner = HomeBannerModel();
  void getProfile(BuildContext context) async {
    isProfile = true;
    ProfileServices profileServices = ProfileServices();
    ProfileModel profileModel = await profileServices.getProfile(context);
    if (profileModel.user!.isNotEmpty) {
      profile = profileModel;
      isProfile = false;
      final provider = Provider.of<AuthProvider>(context, listen: false);
      userData = await provider.getName();
    } else {
      final provider = Provider.of<AuthProvider>(context, listen: false);
      userData = await provider.getName();
      profile.user = [];
      isProfile = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void setProfile(
    File image,
    String age,
    String point,
    String email,
    BuildContext context,
  ) async {
    isSet = true;
    notifyListeners();
    ProfileServices profileServices = ProfileServices();
    final provider = Provider.of<AddDonatorProvider>(context, listen: false);
    int bloodID = provider.bloodGroupID;
    int code = await profileServices.setProfile(
      image,
      age,
      bloodID,
      genderText,
      point,
      email,
      context,
    );
    if (code == 200) {
      isSet = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const HomeRoot();
        },
      ), (route) => false);
    }
    notifyListeners();
  }

  void getGeneralInfo() async {
    ProfileServices profileServices = ProfileServices();
    GeneralInfoModel generalInfoModel = await profileServices.getGeneralInfo();
    if (generalInfoModel.data![0].aboutUs!.isNotEmpty) {
      generalInfo = generalInfoModel;
      debugPrint(generalInfo.data![0].id.toString());
      isGeneral = false;
      notifyListeners();
    }
  }

  void setGender(int val) {
    isGender = true;
    genderText = gender[val];
    notifyListeners();
  }

  void getHomeBanner() async {
    ProfileServices profileServices = ProfileServices();
    HomeBannerModel homeBannerModel = await profileServices.getBanner();
    if (homeBannerModel.data![0].bannerId != null) {
      homeBanner = homeBannerModel;
      debugPrint(homeBanner.data![0].bannerId.toString());
      isBanner = false;
      notifyListeners();
    }
  }
}
