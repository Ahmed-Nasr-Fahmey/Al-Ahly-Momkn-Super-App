import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sku_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/viewmodels/cart_viewmodel.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/main_layout.dart';

class SKUDetailsScreen extends StatelessWidget {
  const SKUDetailsScreen({super.key, required this.SKU});
  final SKUEntity SKU;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          showBackCursor: true,
        ),
        Center(
          child: Text(
            SKU.skuName,
            style: TextStyle(
                fontSize: AppTheme.fontSize26(context),
                fontWeight: AppTheme.fontWeight500,
                color: AppTheme.primaryGreenColor),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.01,
        ),
        Text(
          'Details',
          style: TextStyle(
              fontSize: AppTheme.fontSize22(context),
              fontWeight: AppTheme.fontWeight400,
              color: AppTheme.orangeColor),
        ),
        SizedBox(
          height: context.screenHeight * 0.01,
        ),
        Container(
          child: Text(
            SKU.skuDescription,
            style: TextStyle(
                fontSize: AppTheme.fontSize20(context),
                fontWeight: AppTheme.fontWeight500),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.03,
        ),
        Text(
          'Price',
          style: TextStyle(
              fontSize: AppTheme.fontSize22(context),
              fontWeight: AppTheme.fontWeight400,
              color: AppTheme.orangeColor),
        ),
        SizedBox(
          height: context.screenHeight * 0.01,
        ),
        Container(
          child: Text(
            "${SKU.skuPrice.toString()} \$",
            style: TextStyle(
                fontSize: AppTheme.fontSize20(context),
                fontWeight: AppTheme.fontWeight500),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.05,
        ),
        Center(child: CustomButton(title: "Add To Cart", onPress: (){
          CartViewModel.addItemToCart(SKU);
          SnackBarMessage.showSuccessSnackBar(message: "Added To Cart", context: context);
        }, buttonColor: AppTheme.primaryGreenColor, borderRadius: AppTheme.boxRadius, borderColor: AppTheme.primaryGreenColor, buttonWidth: context.screenWidth*0.8, fontSize: AppTheme.fontSize20(context),fontColor: AppTheme.whiteColor,))
      ],
    ));
  }
}
