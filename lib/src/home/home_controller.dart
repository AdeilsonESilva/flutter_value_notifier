import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  var counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
