import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color _primaryColor = const Color.fromRGBO(59, 99, 117, 1);
  Color _secondaryColor = Color.fromRGBO(38, 94, 163, 1);
  Color _accentColor = Color.fromRGBO(173, 171, 176, 1);

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;
  Color get accentColor => _accentColor;

  void setPrimaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  void setSecondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }

  void setAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
  }
}
