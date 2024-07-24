import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/datasources/ordering_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/repositories/ordering_repository.dart';

class OrderingRepositoryImpl extends OrderingRepository {
  final OrderingRemoteDataSource orderingRemoteDataSource;

  OrderingRepositoryImpl({required this.orderingRemoteDataSource});

  @override
  Future<Either<Failure, InvoiceEntity>> createInvoice() async {
    try {
      final val = await orderingRemoteDataSource.createInvoice();
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Creating Invoice'));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> createOrder() async {
    try {
      final val = await orderingRemoteDataSource.createOrder();
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Creating Order'));
    }
  }

  @override
  Future<Either<Failure, List<OrderWithInvoiceEntity>>> getOrdersWithInvoices() async {
    try {
      final val = await orderingRemoteDataSource.getOrdersWithInvoices();
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting Orders With Invoices'));
    }
  }
}
