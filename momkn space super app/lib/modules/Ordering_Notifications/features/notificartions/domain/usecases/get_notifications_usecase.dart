import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/repositories/notification_repository.dart';
class GetNotificationsUsecase {
  final NotificationRepository notificationRepository;

  GetNotificationsUsecase({required this.notificationRepository});
  Future<Either<Failure, List<NotificationEntity>>> call(String mobileNumber,String ip,String password) => notificationRepository.getNotifications(mobileNumber, ip, password);
}
