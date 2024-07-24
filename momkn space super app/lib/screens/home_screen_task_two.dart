// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications_profile/core/extentions/screen_size.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications_profile/core/utils/app_theme.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/main_layout.dart';
// import 'package:super_app_alahly_momkn/screens/qr_reader_screen.dart';
// import 'package:super_app_alahly_momkn/screens/qr_result_scren.dart';

// class HomeScreenTaskTwo extends StatelessWidget {
//   const HomeScreenTaskTwo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.screenBackgroundColor,
//       body: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                         height: MediaQuery.of(context).size.height * 0.25,
//                   decoration: BoxDecoration(color: AppTheme.transparentColor),
//                   child: Stack(children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xFF0A271D),
//                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
//                       height: context.screenHeight * 0.2,
//                       child: Stack(
//                         children: [
//                           SvgPicture.asset(
//                             "assets/ahly_momkn_bg_home.svg",
//                             width: context.screenWidth,
//                             fit: BoxFit.fill,
//                           ),
//                           Align(
//                             child: Image.asset(
//                               "assets/ahly_momkn_logo.png",
//                               height: context.screenAspectRatio * 50,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Align(
//                               alignment: Alignment.centerRight,
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: context.screenAspectRatio * 15),
//                                 child: Icon(
//                                   Icons.notifications_outlined,
//                                   color: AppTheme.whiteColor,
//                                   size: context.screenAspectRatio * 15,
//                                 ),
//                               )),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: context.screenHeight * 0.165,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Container(
//                           margin: EdgeInsets.only(left: context.screenWidth * 0.145),
//                           decoration: BoxDecoration(color: AppTheme.whiteColor, borderRadius: AppTheme.boxRadius),
//                           padding: EdgeInsets.symmetric(vertical: context.screenAspectRatio * 2, horizontal: context.screenWidth * 0.3),
//                           child: Column(
//                             children: [
//                               SvgPicture.asset(
//                                 "assets/qr_code.svg",
//                                 height: context.screenAspectRatio * 15,
//                               ),
//                               SizedBox(
//                                 height: context.screenAspectRatio,
//                               ),
//                               Text(
//                                 "My QR",
//                                 style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: context.screenWidth * 0.05,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Bills",
//                         style: TextStyle(fontSize: AppTheme.fontSize18(context), fontWeight: AppTheme.fontWeight600),
//                       ),
//                       SizedBox(
//                         height: context.screenAspectRatio * 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BillWidget(billTitle: "First Bill"),
//                           BillWidget(billTitle: "Second Bill"),
//                           BillWidget(billTitle: "Third Bill"),
//                         ],
//                       ),
//                       SizedBox(
//                         height: context.screenAspectRatio * 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Services Booking List",
//                             style: TextStyle(fontSize: AppTheme.fontSize18(context), fontWeight: AppTheme.fontWeight600),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: Text(
//                               "View all",
//                               style: TextStyle(
//                                   fontSize: AppTheme.fontSize14(context),
//                                   fontWeight: AppTheme.fontWeight600,
//                                   color: AppTheme.primaryGreenColor),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: context.screenAspectRatio * 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ServicesBookingWidget(serviceTitle: "Service 1", icon: Icons.shield, backgroundColor: AppTheme.primaryGreenColor),
//                           ServicesBookingWidget(serviceTitle: "Service 2", icon: Icons.lightbulb, backgroundColor: AppTheme.orangeColor),
//                           ServicesBookingWidget(serviceTitle: "Service 3", icon: Icons.shield, backgroundColor: AppTheme.yellowColor),
//                           ServicesBookingWidget(serviceTitle: "Service 4", icon: Icons.lightbulb, backgroundColor: Colors.red),
//                         ],
//                       ),
//                       SizedBox(
//                         height: context.screenAspectRatio * 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Order Now",
//                             style: TextStyle(fontSize: AppTheme.fontSize18(context), fontWeight: AppTheme.fontWeight600),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: Text(
//                               "View all",
//                               style: TextStyle(
//                                   fontSize: AppTheme.fontSize14(context),
//                                   fontWeight: AppTheme.fontWeight600,
//                                   color: AppTheme.primaryGreenColor),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: context.screenAspectRatio * 10,
//                       ),
//                       Column(
//                         children: [
//                           OrderNowWidget(serviceTitle: "Service 1", icon: Icons.shield, backgroundColor: AppTheme.primaryGreenColor),
//                           OrderNowWidget(serviceTitle: "Service 2", icon: Icons.lightbulb, backgroundColor: AppTheme.orangeColor),
//                         ],
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(builder: (_) => QRReaderScreen()));
//                           },
//                           child: Text("Scanner")),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(builder: (_) => QRResultScreen()));
//                           },
//                           child: Text("Result")),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class BillWidget extends StatelessWidget {
//   const BillWidget({super.key, required this.billTitle});
//   final String billTitle;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(200),
//             color: AppTheme.lightGreyColor,
//             border: Border.all(color: AppTheme.orangeColor),
//           ),
//           padding: EdgeInsets.all(context.screenAspectRatio * 15),
//         ),
//         Text(
//           billTitle,
//           style: TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500),
//         )
//       ],
//     );
//   }
// }

// class ServicesBookingWidget extends StatelessWidget {
//   const ServicesBookingWidget({super.key, required this.serviceTitle, required this.icon, required this.backgroundColor});
//   final String serviceTitle;
//   final IconData icon;
//   final Color backgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: backgroundColor,
//             ),
//             padding: EdgeInsets.all(context.screenAspectRatio * 10),
//             child: Icon(
//               icon,
//               color: AppTheme.whiteColor,
//             )),
//         Text(
//           serviceTitle,
//           style: TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500),
//         )
//       ],
//     );
//   }
// }

// class OrderNowWidget extends StatelessWidget {
//   const OrderNowWidget({super.key, required this.serviceTitle, required this.icon, required this.backgroundColor});
//   final String serviceTitle;
//   final IconData icon;
//   final Color backgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: backgroundColor,
//           ),
//           padding: EdgeInsets.all(context.screenAspectRatio * 15),
//           margin: EdgeInsets.only(bottom: context.screenAspectRatio * 5),
//         ),
//         SizedBox(
//           width: context.screenAspectRatio * 5,
//         ),
//         Text(
//           serviceTitle,
//           style: TextStyle(fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight500),
//         )
//       ],
//     );
//   }
// }
