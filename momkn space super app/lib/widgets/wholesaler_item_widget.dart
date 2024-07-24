// import 'package:flutter/material.dart';
// import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
// import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
// import 'package:super_app/widgets/cart_item_card_widget.dart';
//
// class WholesalerCardWidget extends StatelessWidget {
//   const WholesalerCardWidget({super.key, this.initialyExpanded});
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
//           title: Text(
//             "Wholesaler 1",
//             style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight500),
//           ),
//           iconColor: AppTheme.greyHintColor,
//           collapsedIconColor: AppTheme.greyHintColor,
//           backgroundColor: Colors.transparent,
//           collapsedBackgroundColor: Colors.transparent,
//           children: <Widget>[
//             ListTile(
//               title: CartItemCardWidget(
//                 itemCount: 1,
//               ),
//             ),
//             ListTile(
//               title: CartItemCardWidget(
//                 itemCount: 2,
//               ),
//             ),
//             ListTile(
//                 title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Subtotal",
//                   style: TextStyle(color: AppTheme.greyHintColor, fontSize: AppTheme.fontSize16(context)),
//                 ),
//                 Text(
//                   "100 L.E",
//                   style: TextStyle(fontSize: AppTheme.fontSize16(context)),
//                 )
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
