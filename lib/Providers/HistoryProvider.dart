// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/HistoryModel.dart';

import '../Services/HistoryService.dart';

class HistoryProvider with ChangeNotifier {
  bool isAppointment = true;
  bool isLoading = true;
  HistoryModel history = HistoryModel();

  void changeOption(bool val) {
    isAppointment = val;
    notifyListeners();
  }

  void getAllHistory(BuildContext context) async {
    isLoading = true;
    HistoryService historyService = HistoryService();
    HistoryModel historyModel = await historyService.getAllHistory(context);
    if (historyModel.appoinment!.isEmpty || historyModel.operation!.isEmpty) {
      history.appoinment = [];
      history.operation = [];
      isLoading = false;
      notifyListeners();
    } else {
      history = historyModel;
      debugPrint(history.appoinment![0].patientName);
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
