// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/HealthTipsModel.dart';
import 'package:rogisheba/Services/HealthTipsService.dart';

class HealthTipsProvider with ChangeNotifier {
  bool isHealth = true;
  HealthTipsModel healthTips = HealthTipsModel();
  void getTips(BuildContext context) async {
    HealthTipsService healthTipsService = HealthTipsService();
    HealthTipsModel healthTipsModel = await healthTipsService.getTips(context);
    if (healthTipsModel.data![0].healthTipsId != null) {
      healthTips = healthTipsModel;
      debugPrint(healthTips.data![0].healthTipsAuthor);
      isHealth = false;
      notifyListeners();
    }
  }
}
