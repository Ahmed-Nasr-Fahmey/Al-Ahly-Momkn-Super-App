


import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/core/network/api_caller.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications(String mobileNumber, String ip, String password);
}

class NotificationRemoteDataSourceImplWithDio extends NotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNotifications(String mobileNumber, String ip, String password) async {
    final jsonRes = await ApiCaller.postHTTP('https://kyc-75cv.onrender.com/System/Notification', {"mobileNumber":"01227773835",
      "ip":"3.3.3",
      "password":"1234"});
    List<NotificationModel> notifications = [];
    // log(jsonRes.data.toString());
    for (var element in jsonRes.data) {
      notifications.add(NotificationModel.fromJson(element));
    }
    log(notifications.length.toString());
    final hasCachedNotifications = await CacheHelper.containsKey("notifications_key");
    if(hasCachedNotifications){
      final cached =await  CacheHelper.getCachedNotifications();
      bool foundDifference=false;
      for(var elemnt in notifications){
        for(var cachedN in cached){
          if(elemnt.id !=cachedN.id ||
              elemnt.effectiveDate !=cachedN.effectiveDate ||elemnt.senderName !=cachedN.senderName &&
              elemnt.amount !=cachedN.amount ||
              elemnt.body !=cachedN.body ||
              elemnt.title !=cachedN.title ||
              elemnt.userMobileNumber !=cachedN.userMobileNumber
          ){
            foundDifference=true;
          }
        }
      }
      if(foundDifference){
        log("difference founded");
        await CacheHelper.cacheNotifications(notifications);

      }
    }
    return notifications;
  }
}
