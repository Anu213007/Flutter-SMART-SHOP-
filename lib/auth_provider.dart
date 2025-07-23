import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _username;

  bool get isLoggedIn => _isLoggedIn;
  String? get username => _username;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _username = prefs.getString('username');
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedPassword = prefs.getString(username);

    if (storedPassword == password) {
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);
      _isLoggedIn = true;
      _username = username;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('username');
    _isLoggedIn = false;
    _username = null;
    notifyListeners();
  }

  Future<bool> register(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // For simplicity, store username and password directly. In a real app, hash passwords.
    // Also, check if username already exists.
    if (prefs.containsKey(username)) {
      return false; // Username already exists
    }
    await prefs.setString(username, password);
    return true;
  }
}