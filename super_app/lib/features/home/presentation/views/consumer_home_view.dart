import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/constants.dart';
import 'package:super_app/features/auth/presentation/manager/auth_cubit.dart';

class ConsumerHomeView extends StatelessWidget {
  const ConsumerHomeView({super.key});
  static const String routeName = 'ConsumerHomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF0A271D),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/ahly_momkn_bg_home.svg",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 30,
                          right: MediaQuery.of(context).size.width * 0.36,
                          child: Image.asset(
                            "assets/logo.png",
                            height:
                                MediaQuery.of(context).size.aspectRatio * 140,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.145),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.aspectRatio * 2,
                          horizontal: MediaQuery.of(context).size.width * 0.3),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 120,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: BarcodeWidget(
                                      data: jsonEncode({
                                        "_id":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .userID,
                                        "userName":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .userName,
                                        "nationalId":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .nid!
                                                .nationalId,
                                        "location":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .nid!
                                                .address,
                                        "birthDate":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .nid!
                                                .birthday,
                                        "gender":
                                            BlocProvider.of<AuthCubit>(context)
                                                .user
                                                .nid!
                                                .gender
                                      }),
                                      barcode: Barcode.qrCode(),
                                      color: Constants.primaryGreen,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/qr_code.svg",
                              height:
                                  MediaQuery.of(context).size.aspectRatio * 50,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.aspectRatio,
                            ),
                            const Text(
                              "My QR",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Bills",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.aspectRatio * 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BillWidget(billTitle: "First Bill"),
                        BillWidget(billTitle: "Second Bill"),
                        BillWidget(billTitle: "Third Bill"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.aspectRatio * 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Services Booking List",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Constants.primaryGreen),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.aspectRatio * 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServicesBookingWidget(
                            serviceTitle: "Service 1",
                            icon: Icons.shield,
                            backgroundColor: Constants.primaryGreen),
                        ServicesBookingWidget(
                            serviceTitle: "Service 2",
                            icon: Icons.lightbulb,
                            backgroundColor: Colors.orange),
                        ServicesBookingWidget(
                            serviceTitle: "Service 3",
                            icon: Icons.shield,
                            backgroundColor: Colors.yellow),
                        ServicesBookingWidget(
                            serviceTitle: "Service 4",
                            icon: Icons.lightbulb,
                            backgroundColor: Colors.red),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.aspectRatio * 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Order Now",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Constants.primaryGreen),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.aspectRatio * 30,
                    ),
                    const Column(
                      children: [
                        OrderNowWidget(
                            serviceTitle: "Service 1",
                            icon: Icons.shield,
                            backgroundColor: Constants.primaryGreen),
                        OrderNowWidget(
                            serviceTitle: "Service 2",
                            icon: Icons.lightbulb,
                            backgroundColor: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BillWidget extends StatelessWidget {
  const BillWidget({super.key, required this.billTitle});
  final String billTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.grey,
            border: Border.all(color: Colors.orange),
          ),
          padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 15),
        ),
        Text(
          billTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class ServicesBookingWidget extends StatelessWidget {
  const ServicesBookingWidget(
      {super.key,
      required this.serviceTitle,
      required this.icon,
      required this.backgroundColor});
  final String serviceTitle;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: backgroundColor,
            ),
            padding:
                EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 10),
            child: Icon(
              icon,
              color: Colors.white,
            )),
        Text(
          serviceTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class OrderNowWidget extends StatelessWidget {
  const OrderNowWidget(
      {super.key,
      required this.serviceTitle,
      required this.icon,
      required this.backgroundColor});
  final String serviceTitle;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: backgroundColor,
          ),
          padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 15),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.aspectRatio * 5),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.aspectRatio * 5,
        ),
        Text(
          serviceTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
