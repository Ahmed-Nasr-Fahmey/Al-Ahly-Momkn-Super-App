import 'package:flutter/cupertino.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class InvoiceDetailsWidget extends StatelessWidget {
  const InvoiceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteColor,
      padding: EdgeInsets.all(context.screenAspectRatio * 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Product Name",
              style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wholesaler name",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "data",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Text(
            "Description: lorem ipsom lorem ipsom lorem ipsom lorem ipsom lorem ipsom lorem ipsom lorem ipsom lorem ipsom ",
            style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "QTY:",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "20",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price:",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "10 L.E",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax:",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "70 L.E",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal:",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "70",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount: (Optional)",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "20%",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
              Text(
                "70 L.E",
                style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
