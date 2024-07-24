import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationEntity notificationEntity;

  const NotificationDetailsScreen({super.key, required this.notificationEntity});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomAppBar(
          showBackCursor: true,
        ),
        SizedBox(
          height: context.screenHeight * 0.015,
        ),
        Container(
          child: Text(
            notificationEntity.senderName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight500),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.010,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                notificationEntity.title,
                style: TextStyle(
                    fontSize: AppTheme.fontSize22(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight500),
              ),
            ),
            Container(
              child: Text(
                notificationEntity.effectiveDate.substring(0,10),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: AppTheme.fontSize16(context), color: AppTheme.greyHintColor, fontWeight: AppTheme.fontWeight600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.screenAspectRatio * 10,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: AppTheme.boxRadius, border: Border.all(color: AppTheme.orangeColor)),
          padding: EdgeInsets.all(context.screenAspectRatio * 5),
          width: context.screenWidth * 0.9,
          child: Text(
            notificationEntity.body,
            style: TextStyle(fontSize: AppTheme.fontSize18(context), color: AppTheme.blackColor, fontWeight: AppTheme.fontWeight500),
          ),
        ),
      ],
    ));
  }
}
