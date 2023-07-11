// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/AddDonatorModel.dart';
import '../Utils/BottomBar.dart';

class AddDonatorService {
  Future<AddDonatorModel> addDonator(
    String name,
    String number,
    int bloodgroupId,
    int bloodDonationGroupId,
    int divisionID,
    int districtID,
    int thanadID,
    BuildContext context,
  ) async {
    var response = await http.post(
      Uri.parse("https://rogisheba.com/api/add-donator"),
      body: ({
        'donator_name': name,
        'donator_mobile_number': number.toString(),
        'blood_group_id': bloodgroupId.toString(),
        'blood_donation_group_id': bloodDonationGroupId.toString(),
        'division_id': divisionID.toString(),
        'district_id': districtID.toString(),
        'thana_id': thanadID.toString(),
      }),
    );
    if (response.statusCode == 200) {
      AddDonatorModel addDonatorModel =
          AddDonatorModel.fromJson(jsonDecode(response.body));
      return addDonatorModel;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Donator Added Failed");
      AddDonatorModel addDonatorModel2 = AddDonatorModel();
      return addDonatorModel2;
    }
  }
}
