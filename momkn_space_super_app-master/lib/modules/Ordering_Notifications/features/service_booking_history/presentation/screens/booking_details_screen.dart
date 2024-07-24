import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/domain/entities/service_booking_history_entity.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

import '../widgets/booking_details_item_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  final ServiceBookingHistoryModel booking;

  const BookingDetailsScreen({super.key, required this.booking});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomAppBar(title:Text(
            "Booking Details",
            style:
            TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
          ) ,showBackCursor: true,)
         ,
          SizedBox(
            height: context.screenHeight * 0.025,
            width: context.screenWidth,
          ),
          BookingDetailsItem(title: "Name", content: booking.service!.name!),
          BookingDetailsItem(title: "Description", content: booking.service!.description!),
          BookingDetailsItem(title: "State", content: booking.service!.state!),
          BookingDetailsItem(title: "Type", content: booking.service!.type!),
          BookingDetailsItem(title: "Fees", content: booking.service!.fees!.toString()),


          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          Center(
            child: CustomButton(
              title: "Back",
              onPress: () {
Navigator.of(context).pop();              },
              borderRadius: const BorderRadius.all( Radius.circular(100)),
              borderColor: AppTheme.transparentColor,
              buttonWidth: context.screenWidth * 0.3,
              fontSize: AppTheme.fontSize22(context),
              buttonColor: null,
              buttonHeight: context.screenWidth * 0.3 * 0.4,
              gradientColors: const [AppTheme.primaryGreenColor, AppTheme.orangeColor],
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const Center(child: PoweredByAhlyMomknWidget()),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
