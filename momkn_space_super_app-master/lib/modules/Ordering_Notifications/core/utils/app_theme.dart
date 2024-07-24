import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';

class AppTheme {
  //Colors
  static const Color primaryGreenColor = Color(0xff05885C);
  static const Color whiteColor = Color(0xffffffff);
  static const Color screenBackgroundColor = Color.fromARGB(255, 241, 241, 241);
  static const Color blackColor = Color(0xff2E3032);
  static const Color greyHintColor = Color(0xFF858585);
  static const Color transparentColor = Color.fromARGB(0, 0, 0, 0);
  static const Color mustardColor = Color(0xFFDDA500);
  static const Color lightMustardColor = Color(0xFFF0E7C6);
  static const Color lightGreenColor = Color(0xFF9CE3A6);
  static const Color orangeColor = Color(0xFFEE8026);
    static const Color lightGreyColor = Color(0xFFF8F8F8);


  static const Color yellowColor = Colors.yellow;

  //Font Sizes
  static double fontSize8(BuildContext context) => 8 * context.screenAspectRatio * 0.5;
  static double fontSize10(BuildContext context) => 10 * context.screenAspectRatio * 0.5;
  static double fontSize12(BuildContext context) => 12 * context.screenAspectRatio * 0.5;
  static double fontSize14(BuildContext context) => 14 * context.screenAspectRatio * 0.5;
  static double fontSize16(BuildContext context) => 16 * context.screenAspectRatio * 0.5;
  static double fontSize18(BuildContext context) => 18 * context.screenAspectRatio * 0.5;
  static double fontSize20(BuildContext context) => 20 * context.screenAspectRatio * 0.5;
  static double fontSize22(BuildContext context) => 22 * context.screenAspectRatio * 0.5;
  static double fontSize24(BuildContext context) => 24 * context.screenAspectRatio * 0.5;
  static double fontSize26(BuildContext context) => 26 * context.screenAspectRatio * 0.5;

  static double fontSize28(BuildContext context) => 28 * context.screenAspectRatio * 0.5;

  static double fontSize40(BuildContext context) => 40 * context.screenAspectRatio * 0.5;
  static double fontSize60(BuildContext context) => 60 * context.screenAspectRatio * 0.5;
  static double fontSize80(BuildContext context) => 80 * context.screenAspectRatio * 0.5;

  //Font Weights
  static const FontWeight fontWeight400 = FontWeight.w400;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeight600 = FontWeight.w600;
  static const FontWeight fontWeight700 = FontWeight.w700;

  //Others
  static const BorderRadius boxRadius = BorderRadius.all(Radius.circular(12));
}
