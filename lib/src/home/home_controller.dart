import 'package:flutter/material.dart';

class HomeController {
  var counter$ = ValueNotifier(0);

  int get counter => counter$.value;

  void increment() => counter$.value++;
}
