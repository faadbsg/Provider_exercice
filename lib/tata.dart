import 'package:flutter/cupertino.dart';

class Tata extends ChangeNotifier {
  String tataValue = '';

  void setValue(String val) {
    if (tataValue != val) {
      tataValue = val;
      notifyListeners();
    }
  }

  String get tataValReturn => tataValue;
}
