part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationsEvent extends NotificationEvent {
  final String mobileNumber;
  final String ip;
  final String password;

  const GetNotificationsEvent({required this.mobileNumber, required this.ip, required this.password});
}
