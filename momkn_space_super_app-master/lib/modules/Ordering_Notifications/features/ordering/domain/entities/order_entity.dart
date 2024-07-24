import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String orgId;
  final String userMobileNumber;
  final String username;
  final String orderAmount;
  final String paid;
  final String paidAmount;
  final String orderId;
  final String orderDate;
  final num itemsCount;
  final String remainingAmount;
  final String paymentReference;
  

  const OrderEntity({required this.orgId, required this.userMobileNumber, required this.username, required this.orderAmount, required this.paid, required this.paidAmount, required this.orderId, required this.orderDate, required this.itemsCount, required this.remainingAmount, required this.paymentReference});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}


