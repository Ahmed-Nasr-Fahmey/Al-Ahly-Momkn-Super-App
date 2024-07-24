import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class ProfileAttributeWidget extends StatelessWidget {
  const ProfileAttributeWidget({
    super.key,
    required this.title,
    required this.value,
    required this.iconData,
  });
  final String title;
  final String value;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppTheme.fontSize18(context),
                fontWeight: AppTheme.fontWeight500,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: AppTheme.fontSize16(context), color: AppTheme.primaryGreenColor),
            ),
          ],
        ),
        Icon(
          iconData,
          size: context.screenAspectRatio * 14,
        ),
      ],
    );
  }
}
