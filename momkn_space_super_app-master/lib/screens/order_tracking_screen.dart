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
// import 'package:super_app_alahly_momkn/widgets/order_details_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/payment_summary_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/wholesaler_item_widget.dart';

// class OrderTrackingScreen extends StatelessWidget {
//   OrderTrackingScreen({super.key});
//   final couponCodeTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomAppBar(
//           showBackCursor: true,
//           title: Text(
//             "Tracking Order",
//             style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500),
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//         Text(
//           "Order details #B45C987",
//           style: TextStyle(
//             fontSize: AppTheme.fontSize18(context),
//             fontWeight: AppTheme.fontWeight500,
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//         OrderDetailsWidget(
//           initialyExpanded: true,
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//         CustomButton(
//             title: "Back To Home Page",
//             onPress: () {
//               //TODO add logic
//             },
//             buttonColor: AppTheme.whiteColor,
//             borderRadius: AppTheme.boxRadius,
//             borderColor: AppTheme.primaryGreenColor,
//             buttonWidth: double.infinity,
//             fontColor: AppTheme.primaryGreenColor,
//             fontSize: AppTheme.fontSize18(context)),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//       ],
//     ));
//   }
// }
