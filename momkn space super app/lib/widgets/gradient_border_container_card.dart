import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class GradientBorderContainerCard extends StatelessWidget {
  const GradientBorderContainerCard({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      margin: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
      decoration: const BoxDecoration(
        borderRadius: AppTheme.boxRadius,
        gradient: LinearGradient(
          colors: [AppTheme.orangeColor, AppTheme.primaryGreenColor],
        ),
      ),
      padding: EdgeInsets.all(context.screenAspectRatio * 1),
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: AppTheme.boxRadius,
        ),
        padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 7, vertical: context.screenAspectRatio * 3),
        child: content,
      ),
    );
  }
}
