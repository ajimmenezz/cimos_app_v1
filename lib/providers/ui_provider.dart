import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    // Notificamos a todos los widgets que cambio la clase
    notifyListeners();
  }
}
