import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerProvider with ChangeNotifier {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    notifyListeners();
  }

  void closeDrawer() {
    zoomDrawerController.close?.call();
    notifyListeners();
  }
}
