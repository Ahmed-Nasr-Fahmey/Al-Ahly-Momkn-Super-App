// ignore_for_file: deprecated_member_use

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/screens/payment_methods_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/viewmodels/cart_viewmodel.dart';
import 'package:super_app/widgets/cart_item_card_widget.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final couponCodeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: Text(
            "My Cart",
            style: TextStyle(
                fontSize: AppTheme.fontSize24(context),
                fontWeight: AppTheme.fontWeight700,
                color: AppTheme.primaryGreenColor),
          ),
          trailingWidget: SvgPicture.asset(
            "assets/cart_icon.svg",
            height: context.screenAspectRatio * 15,
            color: AppTheme.orangeColor,
          ),
          showBackCursor: true,
        ),
        SizedBox(
          height: context.screenHeight * 0.025,
        ),
        if(CartViewModel.cartItems.isEmpty)Text("No Products Yet..",style: TextStyle(fontSize: AppTheme.fontSize24(context),color: AppTheme.primaryGreenColor,fontWeight: AppTheme.fontWeight500),),
        ListView.builder(
          shrinkWrap: true,
          itemCount: CartViewModel.cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final item = CartViewModel.cartItems[index];
            return CartItemCardWidget(
              item: item,
            );
          },
        ),
        // ListView(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        //     CartItemCardWidget(
        //       itemCount: 4,
        //     ),
        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //           horizontal: context.screenAspectRatio * 10),
        //       child: const Divider(
        //         color: AppTheme.orangeColor,
        //       ),
        //     ),
        //     CartItemCardWidget(
        //       itemCount: 4,
        //     ),
        //   ],
        // ),
        SizedBox(height: context.screenAspectRatio*20,),
        CustomButton(
          title: "Continue To Payment",
          onPress: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaymentMethodsScreen()));
          },
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderColor: AppTheme.transparentColor,
          buttonWidth: context.screenWidth * 0.6,
          fontSize: AppTheme.fontSize20(context),
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
    ));
  }
}
