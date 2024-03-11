import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  String _data = '';
  late String _control;
  String _state = '';
  late String _temp;

  String get data => _data;
  String get control => _control;
  String get state => _state;
  String get temp => _temp;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://ny3.blynk.cloud/external/api/get?token=P16rXBdoQLeisMWxVtZhk1T47Ox12L6g&v1'));

    if (response.statusCode == 200) {
      _data = response.body;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> controlFidge(String value) async {
    final response = await http.get(Uri.parse(
        'https://ny3.blynk.cloud/external/api/update?token=P16rXBdoQLeisMWxVtZhk1T47Ox12L6g&v0=$value'));

    if (response.statusCode == 200) {
      _control = response.body;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> isConnected() async {
    final response = await http.get(Uri.parse(
        'https://ny3.blynk.cloud/external/api/isHardwareConnected?token=P16rXBdoQLeisMWxVtZhk1T47Ox12L6g'));

    if (response.statusCode == 200) {
      _state = response.body;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> setTemp(String temp) async {
    final response = await http.get(Uri.parse(
        'https://ny3.blynk.cloud/external/api/update?token=P16rXBdoQLeisMWxVtZhk1T47Ox12L6g&v2=$temp'));

    if (response.statusCode == 200) {
      _temp = response.body;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
