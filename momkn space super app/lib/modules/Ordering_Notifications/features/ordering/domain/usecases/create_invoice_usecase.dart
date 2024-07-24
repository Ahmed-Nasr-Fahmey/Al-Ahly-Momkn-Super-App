import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/repositories/ordering_repository.dart';
class CreateInvoiceUsecase {
  final OrderingRepository orderingRepository;

  CreateInvoiceUsecase({required this.orderingRepository});
  Future<Either<Failure, InvoiceEntity>> call() => orderingRepository.createInvoice();
}
