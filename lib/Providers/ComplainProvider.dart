// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rogisheba/Models/ComplainModel.dart';
import 'package:rogisheba/Services/ComplainService.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

class ComplainProvider with ChangeNotifier {
  bool isHide = false;
  bool isComplain = false;
  ComplainModel complain = ComplainModel();
  BottomBar bottomBar = BottomBar();
  void changeOption() {
    isHide = !isHide;
    notifyListeners();
  }

  void postComplain(
    String complaintName,
    String complaintMessage,
    BuildContext context,
  ) async {
    if (complaintName.isEmpty || complaintMessage.isEmpty) {
      bottomBar.showSnackBarRed(context, "Fields Needs to Fill");
    } else {
      isComplain = true;
      notifyListeners();
      ComplainService complainService = ComplainService();
      ComplainModel complainModel = await complainService.postComplain(
          complaintName, complaintMessage, context);
      if (complainModel.data!.complaintName != null) {
        bottomBar.showSnackBarGreen(context, "Complain sended successful");
        complain = complainModel;
        debugPrint(complain.data!.complaintName);
        isComplain = false;
        notifyListeners();
      }
    }
  }
}
