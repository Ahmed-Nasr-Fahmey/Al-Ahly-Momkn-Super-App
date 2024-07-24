import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/presentation/bloc/bloc/service_booking_history_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/presentation/bloc/bloc/service_booking_history_event.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

import '../bloc/bloc/service_booking_history_state.dart';
import '../widgets/booking_history_item_widget.dart';

class BookingsHistoryScreen extends StatelessWidget {
  const BookingsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ServiceBookingHistoryBloc>().add(const GetBookingsEvent());
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(showBackCursor: true,),
          Text(
            "Service Bookings History",
            style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          BlocConsumer<ServiceBookingHistoryBloc, ServiceBookingHistoryState>(
            builder: (context, state) {
              if (state is GetBookingsLoadingState) {
                return const CustomCircularProgressIndicator(
                  color: AppTheme.primaryGreenColor,
                );
              } else if (state is GetBookingsSuccessState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.bookings.length,
                  itemBuilder: (context, index) {
                    final booking = state.bookings[index];
                    return BookingHistoryItem(
                      booking: booking,
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
            listener: (context, state) {
              if (state is GetBookingsErrorState) {
                SnackBarMessage.showErrorSnackBar(message: state.message, context: context);
              }
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          CustomButton(
            title: "Back",
            onPress: () {
Navigator.of(context).pop();            },
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderColor: AppTheme.transparentColor,
            buttonWidth: context.screenWidth * 0.3,
            fontSize: AppTheme.fontSize22(context),
            buttonColor: null,
            buttonHeight: context.screenWidth * 0.3 * 0.4,
            gradientColors: const [AppTheme.primaryGreenColor, AppTheme.orangeColor],
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const PoweredByAhlyMomknWidget(),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
