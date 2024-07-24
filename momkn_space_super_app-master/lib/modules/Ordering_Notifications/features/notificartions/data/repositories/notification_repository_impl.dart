import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/data/datasources/notfication_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/repositories/notification_repository.dart';
class NotficiationRepositoryImpl extends NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotficiationRepositoryImpl({required this.notificationRemoteDataSource});

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(String mobileNumber, String ip, String password) async{
    try {
        final val = await notificationRemoteDataSource.getNotifications(mobileNumber, ip, password);
        return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting Notifications'));
    }
  }

 
}
