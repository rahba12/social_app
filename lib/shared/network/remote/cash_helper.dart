import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences ;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required bool value,
  }) async =>
      await sharedPreferences.setBool(key, value);

  //عملت method واحده قدرت اهندل ان اجيب اي نوع جايلي
  static dynamic getData({
    required String key,
  }) =>
      sharedPreferences.get(key);

  // عملت method واحده قدرت اهندل ان اسيف اي نوع جايلي
  static Future<bool> saveData({
    required String key,
    @required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
