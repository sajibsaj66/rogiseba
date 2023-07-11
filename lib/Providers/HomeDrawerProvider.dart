// ignore_for_file: file_names

import 'package:flutter/material.dart';


// creating home drawer provider for manage drawer related state management.
class HomeDrawerProvider with ChangeNotifier {
  bool isLocation = false;

  void showLocation() {
    isLocation = !isLocation;
    debugPrint(isLocation.toString());
    notifyListeners();
  }
}
