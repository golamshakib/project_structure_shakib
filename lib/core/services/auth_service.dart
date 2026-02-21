// ignore_for_file: file_names

import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_chatting_app/routes/app_routes.dart';

import '../../routes/app_routes.dart';

class AuthService {
  static const String _tokenKey = 'token';
  static const String _idKey = 'id';
  static const String _roleKey = 'role';


  // Singleton instance for SharedPreferences
  static late SharedPreferences _preferences;


  // Private variables to hold token and userId
  static String? _token;
  static String? _id;
  static String? _role;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    // Load token and userId from SharedPreferences into private variables
    _token = _preferences.getString(_tokenKey);
    _id = _preferences.getString(_idKey);
    _role = _preferences.getString(_roleKey);
  }

  // Check if a token exists in local storage
  static bool hasToken() {
    return _preferences.containsKey(_tokenKey);
  }

  // Save the token and user ID to local storage
  static Future<void> saveToken({String? token, String? id, String? role}) async {
    try {
      await _preferences.setString(_tokenKey, token!);
      await _preferences.setString(_idKey, id!);
      await _preferences.setString(_roleKey, role!);

      // Update private variables
      _token = token;
      _id = id;
      _role = role;
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  // Clear authentication data (for logout or clearing auth data)
  static Future<void> logoutUser() async {
    try {
      // Clear all data from SharedPreferences
      await _preferences.clear();

      // Reset private variables
      _token = null;
      _id = null;
      _role = null;
      // Redirect to the login screen
      await goToLogin();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  // Navigate to the login screen (e.g., after logout or token expiry)
  static Future<void> goToLogin() async {
    Get.offAllNamed(AppRoute.loginScreen);
  }

  // Getter for token
  static String? get token => _token;
  static String? get id => _id;
  static String? get role => _role;
}
