import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:color ?? AppTheme.whiteColor,
      ),
    );
  }
}
