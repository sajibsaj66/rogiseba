// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/AddDonatorModel.dart';
import 'package:rogisheba/Services/AddDonatorService.dart';
import 'package:rogisheba/Services/LocationService.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

import '../Models/AllBloodGroupModel.dart';
import '../Models/BloodDonationGroupModel.dart';
import '../Models/DistrictModel.dart';
import '../Models/DivisionModel.dart';
import '../Models/ThanaModel.dart';
import '../Services/BloodService.dart';

class AddDonatorProvider with ChangeNotifier {
  bool isLoading = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isBlood = false;
  bool isOrg = false;
  bool isDivision = false;
  bool isDistrict = false;
  bool isThana = false;
  bool isDonator = false;
  String hint1 = "ব্লাড গ্রুপ বেছে নিন";
  String hint2 = "সংগঠন বেছে নিন";
  String hint3 = "বিভাগ বেছে নিন";
  String hint4 = "জেলা বেছে নিন";
  String hint5 = "থানা বেছে নিন";
  int bloodGroupID = 0;
  int bloodDonationID = 0;
  int divisionID = 0;
  int districtID = 0;
  int thanaID = 0;
  AllBloodGroupModel allBloodGroup = AllBloodGroupModel();
  BloodDonationGroupModel bloodDonationGroup = BloodDonationGroupModel();
  DivisionModel divisions = DivisionModel();
  DistrictModel districts = DistrictModel();
  ThanaModel thanas = ThanaModel();
  AddDonatorModel addDonator = AddDonatorModel();
  void getAllBloodGroup(BuildContext context) async {
    BloodService bloodService = BloodService();
    AllBloodGroupModel allBloodGroupModel =
        await bloodService.getAllBloodGroup(context);
    if (allBloodGroupModel.data![0].id != null) {
      allBloodGroup = allBloodGroupModel;
      debugPrint(allBloodGroup.data![0].bloodGroupName.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void getAllDonationGroup(BuildContext context) async {
    BloodService bloodService = BloodService();
    BloodDonationGroupModel bloodDonationGroupModel =
        await bloodService.getAllDonationGroup(context);
    if (bloodDonationGroupModel.data![0].id != null) {
      bloodDonationGroup = bloodDonationGroupModel;
      debugPrint(bloodDonationGroup.data![0].bloodDonationGroupName.toString());
      isLoading2 = false;
      notifyListeners();
    }
  }

  void getAllDivision(BuildContext context) async {
    LocationService locationService = LocationService();
    DivisionModel divisionModel = await locationService.getDivision(context);
    if (divisionModel.data![0].id != null) {
      divisions = divisionModel;
      debugPrint(divisions.data![0].divisionName.toString());
      isLoading3 = false;
      notifyListeners();
    }
  }

  void getAllDistrict(BuildContext context) async {
    LocationService locationService = LocationService();
    DistrictModel districtModel =
        await locationService.getDistrict(context, divisionID);
    if (districtModel.data![0].id != null) {
      districts = districtModel;
      debugPrint(districts.data![0].districtName.toString());
      isLoading4 = false;
      notifyListeners();
    }
  }

  void getThana(BuildContext context) async {
    LocationService locationService = LocationService();
    ThanaModel thanaModel = await locationService.getThana(context, districtID);
    if (thanaModel.data![0].id != null) {
      thanas = thanaModel;
      debugPrint(thanas.data![0].thanaName.toString());
      isLoading5 = false;
      notifyListeners();
    }
  }

  void addingDonator(
    String name,
    String phone,
    BuildContext context,
  ) async {
    AddDonatorService addDonatorService = AddDonatorService();
    if (name.isEmpty ||
        phone.isEmpty ||
        bloodGroupID == 0 ||
        bloodDonationID == 0 ||
        divisionID == 0 ||
        districtID == 0 ||
        thanaID == 0) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Every fields needs to fill");
    } else {
      isDonator = true;
      notifyListeners();
      AddDonatorModel addDonatorModel = await addDonatorService.addDonator(
        name,
        phone,
        bloodGroupID,
        bloodDonationID,
        divisionID,
        districtID,
        thanaID,
        context,
      );
      if (addDonatorModel.data!.id != null) {
        addDonator = addDonatorModel;
        debugPrint(addDonator.data!.donatorName);
        isDonator = false;
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarGreen(context, "Donor added successfully");
        notifyListeners();
      }
    }
  }

  void setBloodGroup(int val) {
    isBlood = true;
    bloodGroupID = val;
    hint1 = allBloodGroup.data![val - 1].bloodGroupName!;
    notifyListeners();
  }

  void setBloodOrg(int val) {
    isOrg = true;
    bloodDonationID = val;
    hint2 = bloodDonationGroup.data![val - 1].bloodDonationGroupName!;
    notifyListeners();
  }

  void setDivision(int val) {
    isDivision = true;
    divisionID = val;
    for (var element in divisions.data!) {
      if (element.id == divisionID) {
        hint3 = element.divisionName!;
      }
    }
    debugPrint(divisionID.toString());
    notifyListeners();
  }

  void setDistrict(int val) {
    isDistrict = true;
    districtID = val;
    for (var element in districts.data!) {
      if (element.id == districtID) {
        hint4 = element.districtName!;
      }
    }
    notifyListeners();
  }

  void setThana(int val) {
    isThana = true;
    thanaID = val;
    for (var element in thanas.data!) {
      if (element.id == thanaID) {
        hint5 = element.thanaName!;
      }
    }
    notifyListeners();
  }
}
