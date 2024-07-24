import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class CatalogCategoryCardWidget extends StatelessWidget {
  const CatalogCategoryCardWidget({super.key, required this.title, required this.imgUrl});
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: AppTheme.boxRadius,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppTheme.fontSize16(context),
                fontWeight: AppTheme.fontWeight700,
                color: AppTheme.primaryGreenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
