import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/widgets/gradient_border_container_card.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

class WholesalersScreenScreen extends StatelessWidget {
  const WholesalersScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "البائعين",
            style: TextStyle(
                fontWeight: AppTheme.fontWeight700,
                fontSize: AppTheme.fontSize26(context),
                color: AppTheme.primaryGreenColor),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GradientBorderContainerCard(
                  content: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.screenAspectRatio * 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "أبو الوفا",
                        style: TextStyle(
                            fontSize: AppTheme.fontSize22(context),
                            fontWeight: AppTheme.fontWeight700),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "4.7",
                            style: TextStyle(
                                fontSize: AppTheme.fontSize16(context),
                                fontWeight: AppTheme.fontWeight600),
                          ),
                          const Icon(
                            Icons.star,
                            color: AppTheme.orangeColor,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "الحد الأدنى لكمية الشراء: 50 قطعة",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "مدة التسليم : يومين",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "السعر: 280\$",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "طرق الدفع :",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Cash",
                          style: TextStyle(
                              fontSize: AppTheme.fontSize22(context),
                              fontWeight: AppTheme.fontWeight600),
                        ),
                        Image.asset('assets/momkn.png'),
                        Image.asset('assets/mastercard.png'),
                        Image.asset('assets/visa.png'),
                      ],
                    ),
                  ],
                ),
              )),
              GradientBorderContainerCard(
                  content: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.screenAspectRatio * 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "أبو الوفا",
                        style: TextStyle(
                            fontSize: AppTheme.fontSize22(context),
                            fontWeight: AppTheme.fontWeight700),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "4.7",
                            style: TextStyle(
                                fontSize: AppTheme.fontSize16(context),
                                fontWeight: AppTheme.fontWeight600),
                          ),
                          const Icon(
                            Icons.star,
                            color: AppTheme.orangeColor,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "الحد الأدنى لكمية الشراء: 50 قطعة",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "مدة التسليم : يومين",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "السعر: 280\$",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Text(
                      "طرق الدفع :",
                      style: TextStyle(
                          fontSize: AppTheme.fontSize16(context),
                          fontWeight: AppTheme.fontWeight600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Cash",
                          style: TextStyle(
                              fontSize: AppTheme.fontSize22(context),
                              fontWeight: AppTheme.fontWeight600),
                        ),
                        Image.asset('assets/momkn.png'),
                        Image.asset('assets/mastercard.png'),
                        Image.asset('assets/visa.png'),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          CustomButton(
            title: "عُــــد",
            onPress: () {},
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderColor: AppTheme.transparentColor,
            buttonWidth: context.screenWidth * 0.3,
            fontSize: AppTheme.fontSize22(context),
            buttonColor: null,
            buttonHeight: context.screenWidth * 0.3 * 0.4,
            gradientColors: const [
              AppTheme.primaryGreenColor,
              AppTheme.orangeColor
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const PoweredByAhlyMomknWidget(),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
