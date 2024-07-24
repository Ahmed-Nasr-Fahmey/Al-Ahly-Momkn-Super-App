import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';

import '../../core/utils/cache_helper.dart';

class CachedNotifications{
  static List<NotificationEntity> data = [];
  static Future<void> loadCachedNotifications() async {
    final hasNotifications = await CacheHelper.containsKey('notifications_key');
    if (hasNotifications) {
      log("fetched");
      final notification = await CacheHelper.getCachedNotifications();
      data = notification;
    }
  }
}