import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class ConnectionProvider extends ChangeNotifier {
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  ConnectionProvider() {
    _checkConnection(); // Check initially
    _listenConnectionChanges(); // Listen for changes
  }

  Future<void> _checkConnection() async {
    _isConnected = await _checkInternet();
    notifyListeners();
  }

  Future<bool> _checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _listenConnectionChanges() {
    Connectivity().onConnectivityChanged.listen((_) async {
      await _checkConnection();
    });
  }
}
