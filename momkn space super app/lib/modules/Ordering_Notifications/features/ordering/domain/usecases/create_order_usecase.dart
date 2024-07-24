import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/repositories/ordering_repository.dart';
class CreateOrderUsecase {
  final OrderingRepository orderingRepository;

  CreateOrderUsecase({required this.orderingRepository});
  Future<Either<Failure, OrderEntity>> call() => orderingRepository.createOrder();
}
