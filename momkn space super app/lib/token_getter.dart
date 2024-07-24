import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';

import 'modules/Ordering_Notifications/core/network/api_caller.dart';

class TokenGetter{
  static String myToken ="";
  static DateTime tokenTimestamp = DateTime.now();

  static Future<void>getToken()async{
    final hasCachedToken = await CacheHelper.containsKey("_token");
    if(hasCachedToken){
      log("found cached token");
      await getCachedToken();
      if(!isTokenValid(DateTime.now(),tokenTimestamp)){
        log("not valid token");
        final res = await ApiCaller.postHTTP("https://erp-backend-supply.onrender.com/user/login", {
          "user_Mobile_Number":"3",
          "user_Password":"0"
        });
        myToken = res.data["accessToken"];
        tokenTimestamp = DateTime.now();
        cacheToken(myToken);
      }else{
        log("valid token");

      }
    }
    else{
      log("didn't found cached token");

      final res = await ApiCaller.postHTTP("https://erp-backend-supply.onrender.com/user/login", {
        "user_Mobile_Number":"3",
        "user_Password":"0"
      });
      myToken = res.data["accessToken"];
      tokenTimestamp = DateTime.now();
      cacheToken(myToken);
    }
  }

  static Future<void>cacheToken(String token)async{
    await CacheHelper.put("_token", token);
    await CacheHelper.put("_tokenTimestamp", DateTime.now().toString());
    log("token cached");

  }
  static Future<void>getCachedToken()async{
     myToken = await CacheHelper.get("_token");
     log("token retrieved ${myToken}");

     tokenTimestamp = DateTime.parse(await CacheHelper.get("_tokenTimestamp"));
     log("timestamp retrieved ${tokenTimestamp.toString()}");

  }

  static bool isTokenValid(DateTime date1, DateTime date2) {
    Duration difference = date1.difference(date2).abs();
    return difference <= Duration(hours: 23);
  }
}