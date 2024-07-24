import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/home/presentation/views/consumer_home_view.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/string_extensions.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_button.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/bloc/bloc/ordering_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/viewmodels/cart_viewmodel.dart';
import 'package:super_app/widgets/gradient_border_container_card.dart';
import 'package:super_app/widgets/powered_by_ahly_momkn_widget.dart';

import '../widgets/payment_summary_widget.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  _PaymentOptionsWidgetState createState() => _PaymentOptionsWidgetState();
}

class _PaymentOptionsWidgetState extends State<PaymentMethodsScreen> {
  String _selectedOption = 'visa';

  List<String> _options = ['visa', 'mastercard', 'ahly momkn', 'cash']; // List of options

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(
            showBackCursor: true,
          ),
          Text(
            "Choose Payment Method",
            style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize24(context), color: AppTheme.primaryGreenColor),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _options.map((option) {
              Widget paymentCard;
              if (option == 'visa') {
                paymentCard = InkWell(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                  child: GradientBorderContainerCard(
                    content: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/visa.png',
                            ),
                            Text(
                              "Expiry",
                              style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.06,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "xxxx xxxx xxxx xxxx",
                                style: TextStyle(color: AppTheme.greyHintColor, fontSize: AppTheme.fontSize22(context)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "29/4",
                                    style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Primary",
                                    style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: option,
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (option == 'mastercard') {
                paymentCard = InkWell(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                  child: GradientBorderContainerCard(
                    content: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/mastercard.png',
                            ),
                            Text(
                              "Expiry",
                              style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.06,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "xxxx xxxx xxxx xxxx",
                                style: TextStyle(color: AppTheme.greyHintColor, fontSize: AppTheme.fontSize22(context)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "29/4",
                                    style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Primary",
                                    style: TextStyle(fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize16(context)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: option,
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (option == 'ahly momkn') {
                paymentCard = InkWell(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                  child: GradientBorderContainerCard(
                    content: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/momkn.png',
                        ),
                        Radio<String>(
                          value: option,
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                paymentCard = InkWell(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                  child: GradientBorderContainerCard(
                    content: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option.capitalize(),
                          style: TextStyle(fontSize: AppTheme.fontSize20(context), fontWeight: AppTheme.fontWeight600),
                        ),
                        Radio<String>(
                          value: option,
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              return paymentCard;
            }).toList(),
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),

          Divider(),

          // Container(
          //   width: context.screenWidth,
          //   margin:
          //   EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 5),
          //   decoration: const BoxDecoration(
          //       borderRadius: AppTheme.boxRadius,
          //       color: AppTheme.whiteColor,
          //       boxShadow: [
          //         BoxShadow(
          //           color: AppTheme.greyHintColor, // Shadow color with opacity
          //           spreadRadius: 1, // Spread radius
          //           blurRadius: 7, // Blur radius
          //           offset: Offset(1, 1), // Offset in X and Y directions
          //         ),
          //       ]),
          //   padding: EdgeInsets.symmetric(
          //       horizontal: context.screenAspectRatio * 8,
          //       vertical: context.screenAspectRatio * 2),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       // Expanded(
          //       //     child: TextField(
          //       //       controller: couponCodeTextController,
          //       //       decoration: const InputDecoration(
          //       //           border: InputBorder.none,
          //       //           hintText: "Promocode",
          //       //           hintStyle: TextStyle(
          //       //               color: AppTheme.primaryGreenColor,
          //       //               fontWeight: AppTheme.fontWeight500)),
          //       //     )),
          //       // InkWell(
          //       //   child: Container(
          //       //       decoration: const BoxDecoration(
          //       //           borderRadius: AppTheme.boxRadius,
          //       //           color: AppTheme.primaryGreenColor),
          //       //       padding: EdgeInsets.all(context.screenAspectRatio * 5),
          //       //       child: const Text(
          //       //         "Submit",
          //       //         style: TextStyle(
          //       //             color: AppTheme.whiteColor,
          //       //             fontWeight: AppTheme.fontWeight600),
          //       //       )),
          //       //   onTap: () {},
          //       // ),
          //     ],
          //   ),
          // ),
          //

           PaymentSummaryWidget(
            hasPadding: true,
            basketItems: CartViewModel.getTotalPrice(),
            shippingFees: 20,
          ),
          BlocConsumer<OrderingBloc, OrderingState>(
            builder: (context, state) {
              if (state is CreateOrderLoadingState) {
                return const CustomCircularProgressIndicator(
                  color: AppTheme.primaryGreenColor,
                );
              }
              return CustomButton(
                title: "Checkout",
                onPress: () {
                  context.read<OrderingBloc>().add(const CreateOrderEvent());
                },
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                borderColor: AppTheme.transparentColor,
                buttonWidth: context.screenWidth * 0.3,
                fontSize: AppTheme.fontSize20(context),
                buttonColor: null,
                buttonHeight: context.screenWidth * 0.3 * 0.4,
                gradientColors: const [AppTheme.primaryGreenColor, AppTheme.lightGreenColor],
              );
            },
            listener: (context, state) {
              if (state is CreateOrderErrorState) {
                SnackBarMessage.showErrorSnackBar(message: state.message, context: context);
              } else if (state is CreateOrderSuccessState) {
                SnackBarMessage.showSuccessSnackBar(message: "Order Placed Succesffuly", context: context);
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_)=>ConsumerHomeView()), (route) => false);
              }
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
          const PoweredByAhlyMomknWidget(),
          SizedBox(
            height: context.screenHeight * 0.025,
          ),
        ],
      ),
    );
  }
}
