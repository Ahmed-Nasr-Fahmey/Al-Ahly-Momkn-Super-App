import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/repositories/service_booking_history_repo.dart';

import '../../../../core/errors/failures.dart';
class GeteBookingsUsecase {
  final ServiceBookingHistoryRepository serviceBookingHistoryRepository;

  GeteBookingsUsecase({required this.serviceBookingHistoryRepository});
  Future<Either<Failure, List<ServiceBookingHistoryModel>>> call() => serviceBookingHistoryRepository.getBookings();
}
