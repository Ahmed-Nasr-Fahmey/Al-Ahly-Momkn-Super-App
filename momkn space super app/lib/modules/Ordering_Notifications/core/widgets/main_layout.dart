import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {super.key, required this.body, this.bottomNavBar, this.floatingActionButtonLocation, this.floatingActionButton, this.singleChild});
  final Widget body;
  final Widget? bottomNavBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final bool? singleChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
      backgroundColor: AppTheme.whiteColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  context.screenWidth * 0.05, context.screenWidth * 0.04, context.screenWidth * 0.05, context.screenHeight * 0.03 * 0),
              child: (singleChild != null && singleChild == false) ? body : SingleChildScrollView(child: body)),
        ),
      ),
    );
  }
}
