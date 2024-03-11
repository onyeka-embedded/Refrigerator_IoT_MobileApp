import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  bool _switchValue = false;
  String _textFieldValue = '';

  bool get switchValue => _switchValue;
  String get textFieldValue => _textFieldValue;

  void toggleSwitch() {
    _switchValue = !_switchValue;
    notifyListeners();
  }

  void setTextFieldValue(String value) {
    _textFieldValue = value;
    notifyListeners(); // Notify listeners that the state has changed
  }
}
