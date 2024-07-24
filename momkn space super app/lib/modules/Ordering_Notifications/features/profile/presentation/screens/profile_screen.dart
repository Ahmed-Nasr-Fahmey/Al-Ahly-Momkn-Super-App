import 'package:flutter/material.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/splash_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/string_extensions.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/CachedNotifications.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/screens/orders_history_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/features/profile/presentation/widgets/profile_attribute_widget.dart';
import 'package:super_app/shared/app_constants.dart';

import '../../../service_booking_history/presentation/screens/booking_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(
            showBackCursor: true,
            title: Text(
              "Personal Profile",
              style: TextStyle(
                fontSize: AppTheme.fontSize22(context),
                fontWeight: AppTheme.fontWeight500,
              ),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          ProfileAttributeWidget(
              iconData: Icons.person, title: 'Username', value: AppConstants.cachedCurrentUserObject!.userName.toString().capitalize()),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ProfileAttributeWidget(iconData: Icons.email, title: 'Email', value: AppConstants.cachedCurrentUserObject!.userEmail!),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ProfileAttributeWidget(iconData: Icons.phone, title: 'Phone Number', value: AppConstants.cachedCurrentUserObject!.mobileNumber!),

          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),

          CustomButton(
            title: 'Invoices History',
            onPress: () async {
             Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const OrdersHistoryScreen()));
            },
            buttonColor: AppTheme.primaryGreenColor,
            borderRadius: AppTheme.boxRadius,
            borderColor: AppTheme.primaryGreenColor,
            buttonWidth: context.screenWidth * 0.7,
            fontSize: AppTheme.fontSize16(context),
            fontColor: AppTheme.whiteColor,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomButton(
            title: 'Services Bookings History',
            onPress: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const BookingsHistoryScreen()));
            },
            buttonColor: AppTheme.primaryGreenColor,
            borderRadius: AppTheme.boxRadius,
            borderColor: AppTheme.primaryGreenColor,
            buttonWidth: context.screenWidth * 0.7,
            fontSize: AppTheme.fontSize16(context),
            fontColor: AppTheme.whiteColor,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomButton(
            title: 'Log Out',
            onPress: () async {
              CachedNotifications.data=[];
              await CacheHelper.clear();
              AppConstants.clearConstants();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ));
            },
            buttonColor: AppTheme.transparentColor,
            borderRadius: AppTheme.boxRadius,
            borderColor: AppTheme.primaryGreenColor,
            buttonWidth: context.screenWidth * 0.7,
            fontSize: AppTheme.fontSize16(context),
            fontColor: AppTheme.primaryGreenColor,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),

          SizedBox(
            height: context.screenHeight * 0.02,
          ),
        ],
      ),
    );
  }
}

