// import 'dart:core';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:super_app_alahly_momkn/core/extentions/screen_size.dart';
// import 'package:super_app_alahly_momkn/core/utils/app_theme.dart';
// import 'package:super_app_alahly_momkn/core/widgets/custom_app_bar.dart';
// import 'package:super_app_alahly_momkn/core/widgets/custom_button.dart';
// import 'package:super_app_alahly_momkn/core/widgets/main_layout.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:super_app_alahly_momkn/widgets/cart_item_card_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/invoice_details_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/order_details_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/payment_summary_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/wholesaler_item_widget.dart';

// class InvoicesScreen extends StatelessWidget {
//   InvoicesScreen({super.key});
//   List invoices = [
//     1,
//     2,
//     3,
//     2,
//     3,
//     2,
//     3,
//     2,
//     3,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomAppBar(
//           showBackCursor: true,
//           title: Text(
//             "Invoices",
//             style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500),
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//         CartItemCardWidget(
//           itemCount: 5,
//         ),
//         InvoiceDetailsWidget()
//       ],
//     ));
//   }
// }
