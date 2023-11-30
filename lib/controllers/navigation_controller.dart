import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
