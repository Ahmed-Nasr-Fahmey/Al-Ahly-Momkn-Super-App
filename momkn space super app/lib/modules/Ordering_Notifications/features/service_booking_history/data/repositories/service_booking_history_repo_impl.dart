import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/data/datasources/service_booking_history_remote_datasource.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/repositories/service_booking_history_repo.dart';
class ServiceBookingHistoryRepositoryImpl extends ServiceBookingHistoryRepository {
  final ServiceBookingHistoryRemoteDataSource serviceBookingHistoryRemoteDataSource;

  ServiceBookingHistoryRepositoryImpl({required this.serviceBookingHistoryRemoteDataSource});




  @override
  Future<Either<Failure, List<ServiceBookingHistoryModel>>> getBookings()async {
    try {
      final val = await serviceBookingHistoryRemoteDataSource.getBookings();
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting Bookings History'));
    }
  }
}
