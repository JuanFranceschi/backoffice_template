import 'package:flutter/material.dart';

class SideMenuManager extends ChangeNotifier {
  bool _settings = false;
  bool get settings => _settings;

  Menus? _secondaryMenu;
  Menus? get secondaryMenu => _secondaryMenu;

  onTapSettings() {
    _settings = !_settings;

    if (!_settings) _secondaryMenu = null;

    notifyListeners();
  }

  onAddSecondaryMenu(Menus secondaryWidget) {
    _secondaryMenu = secondaryWidget;
    notifyListeners();
  }
}

class Menus {
  final int position;
  final Widget menu;

  Menus(this.position, this.menu);
}
