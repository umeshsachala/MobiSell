// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppPreferences {
//   static const String keyLoginUserDetails = "KEY_LOGIN_USER_DETAILS";
//
//   Future<UserData?> getUserDetails() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String loginDetails = prefs.getString(keyLoginUserDetails) ?? "";
//     try {
//       return UserData.fromJson(json.decode(loginDetails));
//     } catch (e) {
//       return null;
//     }
//   }
//
//   Future<bool> setUserDetails(String? value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(keyLoginUserDetails, value!);
//   }
//
//   Future<bool> removeUserDetails() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.remove(keyLoginUserDetails);
//   }
// }
