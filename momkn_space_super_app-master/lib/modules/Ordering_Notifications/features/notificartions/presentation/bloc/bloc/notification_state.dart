part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class GetNotificationstLoadingState extends NotificationState {}

class GetNotificationsErrorState extends NotificationState {
  final String message;

  const GetNotificationsErrorState({required this.message});
}

class GetNotificationsSuccessState extends NotificationState {
  final List<NotificationEntity> notifications;

  const GetNotificationsSuccessState({required this.notifications});
}
