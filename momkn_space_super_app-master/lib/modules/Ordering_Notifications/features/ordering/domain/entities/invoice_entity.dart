import 'package:equatable/equatable.dart';

class InvoiceEntity extends Equatable {
  final String paymentOption;
  final String orgId;
  final String orderId;
  final String username;
  final String paymentReference;
  final String invoiceDate;
  final num invoiceAmount;

  const InvoiceEntity(
      {required this.paymentOption,
      required this.orgId,
      required this.orderId,
      required this.username,
      required this.paymentReference,
      required this.invoiceDate,
      required this.invoiceAmount});

  @override
  List<Object?> get props => throw UnimplementedError();
}


