import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/repositories/ordering_repository.dart';
class GetOrdersWithInvoicesUsecase {
  final OrderingRepository orderingRepository;

  GetOrdersWithInvoicesUsecase({required this.orderingRepository});
  Future<Either<Failure, List<OrderWithInvoiceEntity>>> call() => orderingRepository.getOrdersWithInvoices();
}
