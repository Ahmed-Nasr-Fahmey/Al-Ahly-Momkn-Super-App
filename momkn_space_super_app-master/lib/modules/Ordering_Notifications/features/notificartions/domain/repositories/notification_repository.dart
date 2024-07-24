import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';
abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(String mobileNumber,String ip,String password);

}
