import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';

import '../../../../core/errors/failures.dart';
abstract class ServiceBookingHistoryRepository {
  Future<Either<Failure, List<ServiceBookingHistoryModel>>> getBookings();
}
