
import 'package:equatable/equatable.dart';

sealed class ServiceBookingHistoryEvent extends Equatable {
  const ServiceBookingHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetBookingsEvent extends ServiceBookingHistoryEvent {
  const GetBookingsEvent();
}

