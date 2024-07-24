// import 'dart:core';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/extentions/screen_size.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/utils/app_theme.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_button.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/main_layout.dart';

// class QRResultScreen extends StatelessWidget {
//   const QRResultScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//         body: Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomAppBar(
//           showBackCursor: false,
//           title: Text(
//             "QR Result",
//             style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.05,
//         ),
//         QRResultItem(title: "Full Name", value: "Dalia Ahmed Mostafa Shoeab", valueFieldWidth: context.screenWidth * 0.9),
//         SizedBox(
//           height: context.screenHeight * 0.0125,
//         ),
//         QRResultItem(title: "National ID", value: "32200234004421", valueFieldWidth: context.screenWidth * 0.9),
//         SizedBox(
//           height: context.screenHeight * 0.0125,
//         ),
//         QRResultItem(title: "Location", value: "15 Helioplies st. Cairo", valueFieldWidth: context.screenWidth * 0.9),
//         SizedBox(
//           height: context.screenHeight * 0.0125,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             QRResultItem(title: "Birth date", value: "06/05/2002", valueFieldWidth: context.screenWidth * 0.35),
//             QRResultItem(title: "Gender", value: "Female", valueFieldWidth: context.screenWidth * 0.35),
//           ],
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.05,
//         ),
//         CustomButton(
//             title: "Confirm Info",
//             onPress: () {},
//             buttonColor: AppTheme.primaryGreenColor,
//             borderRadius: AppTheme.boxRadius,
//             borderColor: AppTheme.transparentColor,
//             buttonWidth: context.screenWidth * 0.9,
//             fontSize: AppTheme.fontSize18(context))
//       ],
//     ));
//   }
// }

// class QRResultItem extends StatelessWidget {
//   const QRResultItem({super.key, required this.title, required this.value, required this.valueFieldWidth});
//   final String title;
//   final String value;
//   final double valueFieldWidth;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontWeight: AppTheme.fontWeight500,
//             fontSize: AppTheme.fontSize16(context),
//             color: AppTheme.greyHintColor,
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.0125,
//         ),
//         Container(
//           decoration: BoxDecoration(
//               borderRadius: AppTheme.boxRadius, color: AppTheme.lightGreyColor, border: Border.all(color: AppTheme.greyHintColor)),
//           padding: EdgeInsets.all(context.screenAspectRatio * 5),
//           width: valueFieldWidth,
//           child: Text(
//             value,
//             style: TextStyle(
//               fontWeight: AppTheme.fontWeight500,
//               fontSize: AppTheme.fontSize18(context),
//               color: AppTheme.blackColor,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
