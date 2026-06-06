import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPrefService? _instance;
  static SharedPreferences? _prefs;

  SharedPrefService._internal();

  static Future<SharedPrefService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefService._internal();
      _prefs = await SharedPreferences.getInstance();
    }

    return _instance!;
  }

  Future<void> set({required String key, required dynamic value}) async {
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    }
  }

  String? getString({required String key}) {
    return _prefs!.getString(key);
  }

  bool? getBool({required String key}) {
    return _prefs!.getBool(key);
  }

  int? getInt({required String key}) {
    return _prefs!.getInt(key);
  }

  double? getDouble({required String key}) {
    return _prefs!.getDouble(key);
  }

  List<String>? getList({required String key}) {
    return _prefs!.getStringList(key);
  }

  Future<bool> remove({required String key}) async {
    return await _prefs!.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
