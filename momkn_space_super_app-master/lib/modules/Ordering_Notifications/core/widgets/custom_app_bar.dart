import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final bool? showBackCursor;
  final Widget? trailingWidget;

  const CustomAppBar(
      {super.key, this.title, this.showBackCursor, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: (showBackCursor != null && showBackCursor == true)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppTheme.orangeColor,
                  size: context.screenAspectRatio * 15,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : const SizedBox(),
      ),
      Align(alignment: Alignment.center, child: title),
      Align(
        alignment: Alignment.centerRight,
        child: trailingWidget ?? const SizedBox(),
      )
    ]);
  }
}
