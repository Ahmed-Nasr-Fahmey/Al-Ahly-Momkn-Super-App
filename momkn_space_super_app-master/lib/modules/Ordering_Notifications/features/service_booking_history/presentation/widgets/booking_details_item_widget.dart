import 'package:flutter/cupertino.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: AppTheme.fontSize18(context), color: AppTheme.greyHintColor, fontWeight: AppTheme.fontWeight700),
        ),
        Text(
          content,
          style: TextStyle(fontSize: AppTheme.fontSize18(context), color: AppTheme.blackColor, fontWeight: AppTheme.fontWeight700),
        ),
        SizedBox(
          height: context.screenAspectRatio * 3,
        ),
        Container(
          width: double.infinity, // Adjust width as needed
          height: 3, // Divider height
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryGreenColor, AppTheme.orangeColor], // Gradient colors
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
