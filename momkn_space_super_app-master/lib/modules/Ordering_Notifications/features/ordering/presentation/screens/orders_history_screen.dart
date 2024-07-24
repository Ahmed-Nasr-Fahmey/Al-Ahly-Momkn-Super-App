import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/bloc/bloc/ordering_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/widgets/order_history_item_widget.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderingBloc>().add(const GetOrdersWithInvoicesEvent());
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(showBackCursor: true,),
          Text(
            "Invoices History",
            style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize26(context), color: AppTheme.primaryGreenColor),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          BlocConsumer<OrderingBloc, OrderingState>(
            builder: (context, state) {
              if (state is GetOrdersWithInvoicesLoadingState) {
                return const CustomCircularProgressIndicator(
                  color: AppTheme.primaryGreenColor,
                );
              } else if (state is GetOrdersWithInvoicesSuccessState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.ordersWithInvoices.length,
                  itemBuilder: (context, index) {
                    final orderWithInvoice = state.ordersWithInvoices[index];
                    return OrderHistoryItem(
                      orderWithInvoice: orderWithInvoice,
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
            listener: (context, state) {
              if (state is GetOrdersWithInvoicesErrorState) {
                SnackBarMessage.showErrorSnackBar(message: state.message, context: context);
              }
            },
          ),
          // ListView(
          //   children: [
          //     OrderHistoryItem(),
          //     OrderHistoryItem(),
          //     OrderHistoryItem(),
          //     OrderHistoryItem(),
          //     OrderHistoryItem(),
          //     OrderHistoryItem(),
          //   ],
          // ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          CustomButton(
            title: "Back",
            onPress: () {
Navigator.of(context).pop();            },
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderColor: AppTheme.transparentColor,
            buttonWidth: context.screenWidth * 0.3,
            fontSize: AppTheme.fontSize22(context),
            buttonColor: null,
            buttonHeight: context.screenWidth * 0.3 * 0.4,
            gradientColors: const [AppTheme.primaryGreenColor, AppTheme.orangeColor],
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
