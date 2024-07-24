// import 'package:flutter/material.dart';
// import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
// import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
// import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/widgets/payment_summary_widget.dart';
// import 'package:super_app/widgets/cart_item_card_widget.dart';
//
// class OrderDetailsWidget extends StatelessWidget {
//   const OrderDetailsWidget({super.key, this.initialyExpanded});
//   final bool? initialyExpanded;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: AppTheme.whiteColor, borderRadius: AppTheme.boxRadius),
//       padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 2),
//       margin: EdgeInsets.only(bottom: context.screenAspectRatio * 5),
//       child: Theme(
//         data: ThemeData().copyWith(dividerColor: AppTheme.transparentColor),
//         child: ExpansionTile(
//           initiallyExpanded: initialyExpanded ?? false,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Wholesaler 1",
//                 style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
//               ),
//               Container(
//                 decoration: const BoxDecoration(borderRadius: AppTheme.boxRadius, color: AppTheme.lightGreenColor),
//                 padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 5, vertical: context.screenAspectRatio * 3.5),
//                 child: Text(
//                   "Order Confirmed",
//                   style: TextStyle(
//                       color: AppTheme.primaryGreenColor, fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500),
//                 ),
//               )
//             ],
//           ),
//           iconColor: AppTheme.greyHintColor,
//           collapsedIconColor: AppTheme.greyHintColor,
//           backgroundColor: Colors.transparent,
//           collapsedBackgroundColor: Colors.transparent,
//           children: <Widget>[
//             ListTile(
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       width: context.screenWidth,
//                       padding: EdgeInsets.all(context.screenAspectRatio * 7),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: AppTheme.greyHintColor,
//                           ),
//                           borderRadius: AppTheme.boxRadius),
//                       child: const Text(
//                         "8934875",
//                         style: TextStyle(color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight500),
//                       )),
//                   SizedBox(
//                     height: context.screenAspectRatio * 5,
//                   ),
//                   Container(
//                       width: context.screenWidth,
//                       padding: EdgeInsets.all(context.screenAspectRatio * 7),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: AppTheme.greyHintColor,
//                           ),
//                           borderRadius: AppTheme.boxRadius),
//                       child: const Text(
//                         "https://Wholesale.website.com/",
//                         style: TextStyle(color: AppTheme.primaryGreenColor, fontWeight: AppTheme.fontWeight500),
//                       )),
//                   SizedBox(
//                     height: context.screenAspectRatio * 5,
//                   ),
//                   Text(
//                     "Arrival date: May 21.2024",
//                     style:
//                         TextStyle(color: AppTheme.blackColor, fontWeight: AppTheme.fontWeight400, fontSize: AppTheme.fontSize14(context)),
//                   ),
//                   SizedBox(
//                     height: context.screenAspectRatio * 5,
//                   ),
//                   Text(
//                     "Items Ordered",
//                     style: TextStyle(fontWeight: AppTheme.fontWeight500, fontSize: AppTheme.fontSize20(context)),
//                   ),
//                   SizedBox(
//                     height: context.screenAspectRatio * 5,
//                   ),
//                   CartItemCardWidget(
//
//                     itemCount: 1,
//                   ),
//                   SizedBox(
//                     height: context.screenAspectRatio * 3,
//                   ),
//                   CartItemCardWidget(
//
//                     itemCount: 2,
//                   ),
//                   SizedBox(
//                     height: context.screenAspectRatio * 5,
//                   ),
//                   const PaymentSummaryWidget(
//                     hasPadding: false,
//                     basketItems: 100,
//                     shippingFees: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
