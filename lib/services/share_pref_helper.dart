import 'package:shared_preferences/shared_preferences.dart';

import '../feature/auth/model/auth_model.dart';

//* Initialize Shared Preferences
late SharedPreferences prefs;

class SharePrefHelper {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userName = 'userName';

  //* Write data login
  static Future<AuthModel> loginState({
    required String userName,
    required String password,
    required bool isLoggedIn,
  }) async {
    final user = AuthModel(
      userName: userName,
      password: password,
      isLogin: isLoggedIn,
    );
    prefs.setString(_userName, user.userName);
    prefs.setBool(_isLoggedInKey, user.isLogin);
    return user;
  }

  //* Get boolean data login
  static bool checkLogin() {
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  //* Get username user
  static String getUser() {
    return prefs.getString(_userName) ?? '';
  }

  //* Delete data login
  static Future<bool> logoutState() async {
    return prefs.remove(_isLoggedInKey);
  }
}
