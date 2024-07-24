import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.orgId,
      required super.userMobileNumber,
      required super.username,
      required super.orderAmount,
      required super.paid,
      required super.paidAmount,
      required super.orderId,
      required super.orderDate,
      required super.itemsCount,
      required super.remainingAmount,
      required super.paymentReference});

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      orgId: jsonData[orgIdAPIKey],
      userMobileNumber: jsonData[userMobileOrderNumberAPIKey],
      username: jsonData[usernameAPIKey],
      orderAmount: jsonData[orderAmountAPIKey]["\$numberDecimal"],
      paid: jsonData[paidAPIKey],
      paidAmount: jsonData[paidAmountAPIKey]["\$numberDecimal"],
      orderId: jsonData[orderIdAPIKey],
      orderDate: jsonData[orderDateAPIKey],
      itemsCount: jsonData[itemsCountAPIKey],
      remainingAmount: jsonData[remainingAmountAPIKey]["\$numberDecimal"],
      paymentReference: jsonData[paymentReferenceAPIKey] ?? "",
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     orgIdAPIKey:,
  //     idAPIKey: id,
  //     titleAPIKey: title,
  //     bodyAPIKey: body,
  //     effectiveDataAPIKey: effectiveDate,
  //     userMobileNumberAPIKey: userMobileNumber,
  //     senderNameAPIKey: senderName,
  //   };
  // }
}
