import 'dart:convert';

import 'package:super_app/modules/OCR_QR_AUTH/core/models/user_model.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/shared/cache_constants.dart';

class AppConstants {
  static UserModel? cachedCurrentUserObject;

  static Future<void> initAppConstants() async {
    final cachedUserJson = CacheHelper.get(cachedUserCacheKey);
    // log(cachedUserJson.toString());
    if (cachedUserJson != null) {
      cachedCurrentUserObject = UserModel.fromJson(jsonDecode(cachedUserJson));
    }
  }
  static void clearConstants() {
    cachedCurrentUserObject = null;
  }
}
