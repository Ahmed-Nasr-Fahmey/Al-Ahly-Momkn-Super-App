import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';
import 'package:super_app/widgets/gradient_border_container_card.dart';

import '../screens/booking_details_screen.dart';

class BookingHistoryItem extends StatelessWidget {
  const BookingHistoryItem({super.key, required this.booking});
  final ServiceBookingHistoryModel booking;

  @override
  Widget build(BuildContext context) {
    return GradientBorderContainerCard(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.screenWidth * 0.4,
              child: Text(
                "Service Name: ${booking.service!.name!.toString()}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookingDetailsScreen(
                    booking: booking,
                  ),
                ));
              },
              child: Text(
                "Show Details",
                style: TextStyle(
                    fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize14(context), color: AppTheme.primaryGreenColor),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Fees: ${booking.service!.fees!.toString()}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context)),
            ),
            Text(
              "State: ${booking.service!.state!.toString()}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context), color: AppTheme.blackColor),
            )
          ],
        ),
      ],
    ));
  }
}
