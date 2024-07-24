import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
class PaymentSummaryWidget extends StatelessWidget {
  const PaymentSummaryWidget({super.key, required this.basketItems, required this.shippingFees, required this.hasPadding});
  final double basketItems;
  final double shippingFees;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(color: AppTheme.whiteColor, borderRadius: AppTheme.boxRadius),
          padding: hasPadding == true ? EdgeInsets.all(context.screenAspectRatio * 8) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                  ),
                  Text(
                    "${basketItems.toStringAsFixed(2)} \$",
                    style: TextStyle(
                        fontSize: AppTheme.fontSize16(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight600),
                  )
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery",
                    style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                  ),
                  Text(
                    "${shippingFees.toStringAsFixed(2)} \$",
                    style: TextStyle(
                        fontSize: AppTheme.fontSize16(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight600),
                  )
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20% Tax",
                    style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                  ),
                  Text(
                    "${((basketItems) *0.2).toStringAsFixed(2)} \$",
                    style: TextStyle(
                        fontSize: AppTheme.fontSize16(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight600),
                  )
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 10),
                child: const Divider(
                  color: AppTheme.orangeColor,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                  ),
                  Text(
                    "${((basketItems) + (shippingFees) +((basketItems) *0.2)).toStringAsFixed(2) } \$",
                    style: TextStyle(
                        fontSize: AppTheme.fontSize16(context), color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight600),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.screenAspectRatio * 5,
        ),
      ],
    );
  }
}
