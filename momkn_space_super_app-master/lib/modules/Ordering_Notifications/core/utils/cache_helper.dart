import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/notificartions/data/models/notification_model.dart';
import '../../features/products/data/models/catalog_model.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static dynamic get(String key) {
    return _prefs.get(key);
  }

  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  static Future<bool> put(String key, dynamic value) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else {
      final jsonString = json.encode(value);
      return await _prefs.setString(key, jsonString);
    }
  }

  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  static Future<void> cacheNotifications(List<NotificationModel> notifications) async {
    final jsonList = notifications.map((notification) => notification.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await CacheHelper.put('notifications_key', jsonString);
  }

  static Future<List<NotificationModel>> getCachedNotifications() async {
    final jsonString = CacheHelper.get('notifications_key');
    if (jsonString != null) {
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData.map((json) => NotificationModel.fromJson(json)).toList();
    }
    return [];
  }

  static Future<void> cacheCatalogs(List<CatalogModel> catalogs) async {
    final jsonList = catalogs.map((catalog) => catalog.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await CacheHelper.put('catalogs_key', jsonString);
  }

   static Future<List<CatalogModel>> getCachedCatalogs() async {
    final jsonString = CacheHelper.get('catalogs_key');
    if (jsonString != null) {
      final List<dynamic> jsonData = json.decode(jsonString);
      final cats = jsonData.map((json) => CatalogModel.fromJson(json)).toList();
      return cats;
    }
    return [];
  }
}
