import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/widgets/order_details_item_widget.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderWithInvoiceEntity orderWithInvoice;

  const OrderDetailsScreen({super.key, required this.orderWithInvoice});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomAppBar(title:Text(
            "Invoice Details",
            style:
            TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
          ) ,showBackCursor: true,)
          // Center(
          //   child: Text(
          //     "Invoice Details",
          //     style:
          //         TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
          //   ),
          // ),
          ,
          SizedBox(
            height: context.screenHeight * 0.025,
            width: context.screenWidth,
          ),
          OrderDetailsItem(title: "Payment Reference", content: orderWithInvoice.invoice.paymentReference),
          OrderDetailsItem(title: "Payment Method", content: orderWithInvoice.invoice.paymentOption),
          OrderDetailsItem(title: "Total Price", content: orderWithInvoice.invoice.invoiceAmount.toString()),
          OrderDetailsItem(title: "Invoice Date", content: orderWithInvoice.invoice.invoiceDate.substring(0, 10)),
          OrderDetailsItem(title: "Orginaization ID", content: orderWithInvoice.invoice.orgId),
          OrderDetailsItem(title: "Username", content: orderWithInvoice.invoice.username),
          OrderDetailsItem(title: "Order Date", content: orderWithInvoice.order.orderDate.substring(0, 10)),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          Center(
            child: CustomButton(
              title: "Back",
              onPress: () {
Navigator.of(context).pop();              },
              borderRadius: const BorderRadius.all( Radius.circular(100)),
              borderColor: AppTheme.transparentColor,
              buttonWidth: context.screenWidth * 0.3,
              fontSize: AppTheme.fontSize22(context),
              buttonColor: null,
              buttonHeight: context.screenWidth * 0.3 * 0.4,
              gradientColors: const [AppTheme.primaryGreenColor, AppTheme.orangeColor],
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const Center(child: PoweredByAhlyMomknWidget()),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
