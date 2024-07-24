import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';

abstract class OrderingRepository {
  Future<Either<Failure, List<OrderWithInvoiceEntity>>> getOrdersWithInvoices();
  Future<Either<Failure, OrderEntity>> createOrder();
  Future<Either<Failure, InvoiceEntity>> createInvoice();
}
