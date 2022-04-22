import 'package:flutter/foundation.dart';

class MyData with ChangeNotifier {
  double _value = 0.5;

  double get value => _value;

  set value(double value) {
    _value = value;
    notifyListeners();
  }
}
