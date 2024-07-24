import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/screens/order_details_screen.dart';
import 'package:super_app/widgets/gradient_border_container_card.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({super.key, required this.orderWithInvoice});
  final OrderWithInvoiceEntity orderWithInvoice;

  @override
  Widget build(BuildContext context) {
    return GradientBorderContainerCard(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.screenWidth * 0.4,
              child: Text(
                "Order ID: ${orderWithInvoice.invoice.orderId}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(
                    orderWithInvoice: orderWithInvoice,
                  ),
                ));
              },
              child: Text(
                "Show Details",
                style: TextStyle(
                    fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize14(context), color: AppTheme.primaryGreenColor),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date: ${orderWithInvoice.invoice.invoiceDate.substring(0, 10)}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context)),
            ),
            Text(
              "Total: ${orderWithInvoice.invoice.invoiceAmount.toStringAsFixed(2)}\$",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize16(context), color: AppTheme.blackColor),
            )
          ],
        ),
      ],
    ));
  }
}
