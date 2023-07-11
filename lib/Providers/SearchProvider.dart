// ignore_for_file: file_names


// Starting of search provider. its for managing state of search page.
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  bool isDoctor = true;

  void changeOption(bool val) {
    isDoctor = val;
    notifyListeners();
  }
}
