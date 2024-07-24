import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          Container(
            color: AppTheme.screenBackgroundColor,
          ),
           Center(
              child: CircularProgressIndicator(
            color: AppTheme.primaryGreenColor,
          ))
        ]
      ],
    );
  }
}
