import 'package:shared_preferences/shared_preferences.dart';


class CacheManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> initializeCache() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else {
      throw ArgumentError('Unsupported value type for SharedPreferences');
    }
  }


  static dynamic getData({required String key}) async {
    return _sharedPreferences.get(key);
  }


  static Future<bool> deleteData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearCash() async {
    return await _sharedPreferences.clear();
  }

}