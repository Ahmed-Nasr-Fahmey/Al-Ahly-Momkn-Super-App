// import 'dart:core';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/extentions/screen_size.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/utils/app_theme.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/custom_button.dart';
// import 'package:super_app_alahly_momkn/modules/Ordering_Notifications/core/widgets/main_layout.dart';

// class QRReaderScreen extends StatefulWidget {
//   const QRReaderScreen({super.key});

//   @override
//   State<QRReaderScreen> createState() => _QRReaderScreenState();
// }

// class _QRReaderScreenState extends State<QRReaderScreen> {
//   File? _image;

//   final picker = ImagePicker();

//   Future getImage(ImageSource source) async {
//     final pickedFile = await picker.pickImage(source: source);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//         body: Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CustomAppBar(
//           showBackCursor: false,
//           title: Text(
//             "QR Scanner",
//             style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
//           ),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.05,
//         ),
//         Text(
//           "Scan The Consumer QR Code",
//           style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
//         ),
//         SizedBox(
//           height: context.screenHeight * 0.05,
//         ),
//         Container(
//             decoration: const BoxDecoration(
//               borderRadius: AppTheme.boxRadius,
//               color: Color(0xFFDDDDDD),
//             ),
//             padding: EdgeInsets.all(context.screenAspectRatio * 10),
//             height: context.screenHeight * 0.5,
//             width: context.screenWidth * 0.8,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _image == null
//                     ? Icon(
//                         Icons.qr_code_scanner_sharp,
//                         size: context.screenAspectRatio * 120,
//                         color: AppTheme.whiteColor,
//                       )
//                     : Image.file(
//                         _image!,
//                         fit: BoxFit.cover,
//                         height: context.screenHeight * 0.3,
//                       ),
//                 SizedBox(
//                   height: context.screenHeight * 0.05,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () async {
//                         await getImage(ImageSource.camera);
//                       },
//                       child: Text(
//                         "Camera",
//                         style: TextStyle(
//                             fontSize: AppTheme.fontSize16(context), color: AppTheme.whiteColor, fontWeight: AppTheme.fontWeight600),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         await getImage(ImageSource.gallery);
//                       },
//                       child: Text(
//                         "Gallery",
//                         style: TextStyle(
//                             fontSize: AppTheme.fontSize16(context), color: AppTheme.whiteColor, fontWeight: AppTheme.fontWeight600),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             )),
//         SizedBox(
//           height: context.screenHeight * 0.05,
//         ),
//         CustomButton(
//             title: "Scan",
//             onPress: () {},
//             buttonColor: AppTheme.primaryGreenColor,
//             borderRadius: AppTheme.boxRadius,
//             borderColor: AppTheme.transparentColor,
//             buttonWidth: context.screenWidth * 0.9,
//             fontSize: AppTheme.fontSize18(context)),
//         SizedBox(
//           height: context.screenHeight * 0.01,
//         ),
//         CustomButton(
//             title: "Skip",
//             onPress: () {},
//             buttonColor: AppTheme.transparentColor,
//             borderRadius: AppTheme.boxRadius,
//             borderColor: AppTheme.transparentColor,
//             buttonWidth: context.screenWidth * 0.9,
//             fontColor: AppTheme.greyHintColor,
//             fontSize: AppTheme.fontSize18(context)),
//       ],
//     ));
//   }
// }
