import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/data/datasources/notfication_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/data/repositories/notification_repository_impl.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/usecases/get_notifications_usecase.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});

    on<GetNotificationsEvent>(
      (event, emit) async {
        emit(GetNotificationstLoadingState());
        GetNotificationsUsecase getNotificationsUsecase = GetNotificationsUsecase(
            notificationRepository: NotficiationRepositoryImpl(notificationRemoteDataSource: NotificationRemoteDataSourceImplWithDio()));
        final either = await getNotificationsUsecase.call(event.mobileNumber, event.ip, event.password);
        either.fold((l) {
          emit(GetNotificationsErrorState(message: l.message));
        }, (r) {
          log("fel blocccc");
          emit(GetNotificationsSuccessState(notifications: r));
        });
      },
    );
  }
}
