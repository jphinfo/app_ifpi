import 'package:flutter/widgets.dart';

class ChangeThemeWidget extends ChangeNotifier {
  static ChangeThemeWidget instanceTheme = ChangeThemeWidget();

  bool _isAppTheme = false;

  void changeTheme() {
    _isAppTheme = !_isAppTheme;
    notifyListeners();
  }

  get isAppHomeTheme => _isAppTheme;
}
