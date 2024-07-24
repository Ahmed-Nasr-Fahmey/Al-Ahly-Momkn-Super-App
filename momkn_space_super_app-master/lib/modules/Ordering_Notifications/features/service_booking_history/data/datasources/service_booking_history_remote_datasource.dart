import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';
import 'package:super_app/shared/app_constants.dart';

import '../../../../core/network/api_caller.dart';

abstract class ServiceBookingHistoryRemoteDataSource {
  Future<List<ServiceBookingHistoryModel>> getBookings();
}

class ServiceBookingHistoryRemoteDataSourceImplWithDio
    extends ServiceBookingHistoryRemoteDataSource {
  @override
  Future<List<ServiceBookingHistoryModel>> getBookings() async {
    try {
      final jsonRes = await ApiCaller.getHTTP(
        'https://superapp-production.up.railway.app/getBookingByMobile',
        {"mobileNumber": AppConstants.cachedCurrentUserObject!.mobileNumber},
      );
      List<ServiceBookingHistoryModel> bookings = [];
      for (var element in jsonRes.data["booking"]) {
        log(element.toString());
        final res = await ApiCaller.postHTTP(
          'https://superapp-production.up.railway.app/serviceWithId',
          {"_id": element["serviceId"]},
        );

          bookings.add(ServiceBookingHistoryModel.fromJson(res.data));
      }
      return bookings;
    } catch (e) {
      log("${e.toString()} error in getBookings in remote datasource");
      rethrow;
    }
  }
}
