import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/domain/entities/notification_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/presentation/screens/notification_details_screen.dart';
class NotificationWidget extends StatelessWidget {
  final NotificationEntity notificationEntity;

  const NotificationWidget({super.key, required this.notificationEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => NotificationDetailsScreen(notificationEntity: notificationEntity)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: context.screenAspectRatio * 5),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: AppTheme.boxRadius,
          border: Border.all(
            color: AppTheme.orangeColor,
          ),
        ),
        padding: EdgeInsets.all(context.screenAspectRatio * 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notificationEntity.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AppTheme.fontSize18(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight500),
            ),
            Text(
              notificationEntity.effectiveDate!="null"? notificationEntity.effectiveDate.substring(0,10):"Date",
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontSize: AppTheme.fontSize14(context), color: AppTheme.greyHintColor, fontWeight: AppTheme.fontWeight600),
            ),
          ],
        ),
      ),
    );
  }
}
