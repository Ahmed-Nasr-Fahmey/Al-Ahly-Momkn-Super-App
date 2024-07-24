
import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';

sealed class ServiceBookingHistoryState extends Equatable {
  const ServiceBookingHistoryState();

  @override
  List<Object> get props => [];
}

final class ServiceBookingHistoryInitial extends ServiceBookingHistoryState {}

class GetBookingsLoadingState extends ServiceBookingHistoryState {}

class GetBookingsErrorState extends ServiceBookingHistoryState {
  final String message;

  const GetBookingsErrorState({required this.message});
}

class GetBookingsSuccessState extends ServiceBookingHistoryState {
  final List<ServiceBookingHistoryModel> bookings;

  const GetBookingsSuccessState({required this.bookings});
}
