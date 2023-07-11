// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:rogisheba/Models/AllBloodGroupModel.dart';
import 'package:rogisheba/Models/AllDonatorModel.dart';
import 'package:rogisheba/Models/BloodDonationGroupModel.dart';
import 'package:rogisheba/Services/BloodService.dart';

class BloodProvider with ChangeNotifier {
  bool isLoading = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  BloodDonationGroupModel bloodDonationGroup = BloodDonationGroupModel();
  AllBloodGroupModel allBloodGroup = AllBloodGroupModel();
  AllDonatorModel allDonator = AllDonatorModel();
  void getAllDonationGroup(BuildContext context) async {
    BloodService bloodService = BloodService();
    BloodDonationGroupModel bloodDonationGroupModel =
        await bloodService.getAllDonationGroup(context);
    if (bloodDonationGroupModel.data![0].id != null) {
      bloodDonationGroup = bloodDonationGroupModel;
      debugPrint(bloodDonationGroup.data![0].bloodDonationGroupName.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void getAllBloodGroup(BuildContext context) async {
    BloodService bloodService = BloodService();
    AllBloodGroupModel allBloodGroupModel =
        await bloodService.getAllBloodGroup(context);
    if (allBloodGroupModel.data![0].id != null) {
      allBloodGroup = allBloodGroupModel;
      debugPrint(allBloodGroup.data![0].bloodGroupName.toString());
      isLoading2 = false;
      notifyListeners();
    }
  }

  void getAllDonator(
    BuildContext context,
  ) async {
    BloodService bloodService = BloodService();
    AllDonatorModel allDonatorModel = await bloodService.getAllDonator(context);
    if (allDonatorModel.data![0].id != null) {
      allDonator = allDonatorModel;
      debugPrint(allDonator.data![0].donatorName.toString());
      isLoading3 = false;
      notifyListeners();
    }
  }
}
