import 'package:flutter/material.dart';

class BleNotifier with ChangeNotifier {
  List<Container> _containers;
  bool _isValid;
//Advertiser
  List<Container> get container => _containers;
  bool get isValid => _isValid;

  set container(List<Container> shop) {
    _containers = shop;
    notifyListeners();
  }
  set isValid(bool index)
  {
    _isValid=index;
    notifyListeners();
  }

}