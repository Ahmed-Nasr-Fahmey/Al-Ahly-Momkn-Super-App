
import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel( {required super.id, required super.title, required super.body, required super.amount, required super.effectiveDate, required super.userMobileNumber, required super.senderName});

 

  factory NotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationModel(amount:jsonData["amount"]??0,id: jsonData["id"]??0, title: jsonData["title"]??"null", body: jsonData["body"]??"null", effectiveDate: jsonData["effectiveDate"]??"null", userMobileNumber: jsonData["userMobileNumber"]??"null", senderName: jsonData["senderName"]??"null");
  }
  Map<String, dynamic> toJson() {
    return {
      idAPIKey:id,
      titleAPIKey:title,
      bodyAPIKey:body,
      "effectiveDate":effectiveDate,
      userMobileNumberAPIKey:userMobileNumber,
      senderNameAPIKey:senderName,
      "amount":amount
    };
  }
}

