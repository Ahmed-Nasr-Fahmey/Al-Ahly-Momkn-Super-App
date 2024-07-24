// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/extentions/screen_size.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/utils/app_theme.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_button.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/main_layout.dart';
// import 'package:super_app_alahly_momkn/widgets/cart_item_card_widget.dart';
// import 'package:super_app_alahly_momkn/widgets/checkboxes_list.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/features/ordering/presentation/widgets/payment_summary_widget.dart';

// class CheckoutScreen extends StatelessWidget {
//   CheckoutScreen({super.key});
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
//             "Check out",
//             style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500),
//           ),
//         ),
//         Text(
//           "Shipping address",
//           style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
//         ),
//         Container(
//           decoration: const BoxDecoration(
//             borderRadius: AppTheme.boxRadius,
//             color: AppTheme.whiteColor,
//           ),
//           padding: EdgeInsets.all(context.screenAspectRatio * 5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Khaled Younis",
//                     style: TextStyle(fontSize: AppTheme.fontSize14(context)),
//                   ),
//                   Text(
//                     "Nasr city, Cairo, Egypt",
//                     style: TextStyle(fontSize: AppTheme.fontSize14(context)),
//                   ),
//                 ],
//               ),
//               TextButton(
//                   onPressed: () {
//                     //TODO add logic
//                   },
//                   child: Text(
//                     "Change",
//                     style: TextStyle(color: AppTheme.primaryGreenColor, fontSize: AppTheme.fontSize16(context)),
//                   ))
//             ],
//           ),
//         ),
//         Text(
//           'Select wholesaler',
//           style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
//         ),
//         Container(
//             decoration: const BoxDecoration(borderRadius: AppTheme.boxRadius, color: AppTheme.whiteColor),
//             padding: EdgeInsets.all(context.screenAspectRatio * 5),
//             child: CheckboxesListWidget()),
//         Text(
//           "Ragab Sons Item Ordered",
//           style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
//         ),
//         Container(
//           decoration: const BoxDecoration(
//             color: AppTheme.whiteColor,
//             borderRadius: AppTheme.boxRadius,
//           ),
//           padding: EdgeInsets.all(context.screenAspectRatio * 5),
//           child: Column(
//             children: [
//               CartItemCardWidget(
//                 itemCount: 5,
//               ),
//               const Divider(),
//               CartItemCardWidget(
//                 itemCount: 5,
//               ),
//             ],
//           ),
//         ),
//         const PaymentSummaryWidget(
//           hasPadding: true,
//           basketItems: 100,
//           shippingFees: 20,
//         ),
//         Text(
//           "(Estimated arrival date:May 21.2024)",
//           style: TextStyle(
//             fontWeight: AppTheme.fontWeight400,
//             fontSize: AppTheme.fontSize14(context),
//           ),
//         ),
//         CustomButton(
//             title: "Continue",
//             onPress: () {
//               //TODO add logic
//             },
//             buttonColor: AppTheme.primaryGreenColor,
//             borderRadius: AppTheme.boxRadius,
//             borderColor: AppTheme.transparentColor,
//             buttonWidth: double.infinity,
//             fontSize: AppTheme.fontSize18(context)),
//         SizedBox(
//           height: context.screenHeight * 0.025,
//         ),
//       ],
//     ));
//   }
// }
