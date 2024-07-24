import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/screens/orders_history_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/widgets/add_credit_card_item_widget.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

class AddPaymentCardScreen extends StatelessWidget {
  const AddPaymentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(
              "إضافة معلومات كارت الدفع",
              style:
                  TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
            ),
          ),
          Center(
            child: Image.asset("assets/credit_card_thumbnail.png"),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
            width: context.screenWidth,
          ),
          AddCreditCardItem(title: "الإسم", content: "سلوي كمال عبدالفتاح"),
          AddCreditCardItem(title: "رقم الكارت", content: "4000 1234 5678 9010"),
          AddCreditCardItem(title: "تاريخ الإنتهاء", content: "4/29"),
          AddCreditCardItem(title: "رقم cvv", content: "777"),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: "إلغـــــــــــاء",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrdersHistoryScreen()));
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  borderColor: AppTheme.transparentColor,
                  buttonWidth: context.screenWidth * 0.3,
                  fontSize: AppTheme.fontSize22(context),
                  buttonColor: null,
                  buttonHeight: context.screenWidth * 0.3 * 0.4,
                  gradientColors: const [AppTheme.yellowColor, AppTheme.orangeColor],
                ),
                CustomButton(
                  title: "إضافـــــة",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrdersHistoryScreen()));
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  borderColor: AppTheme.transparentColor,
                  buttonWidth: context.screenWidth * 0.3,
                  fontSize: AppTheme.fontSize22(context),
                  buttonColor: null,
                  buttonHeight: context.screenWidth * 0.3 * 0.4,
                  gradientColors: const [AppTheme.primaryGreenColor, AppTheme.lightGreenColor],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const Center(child: PoweredByAhlyMomknWidget()),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
        ],
      ),
    );
  }
}

