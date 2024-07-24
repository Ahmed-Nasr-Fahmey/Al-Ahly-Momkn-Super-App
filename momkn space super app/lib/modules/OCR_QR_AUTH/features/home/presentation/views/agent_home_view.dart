import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/home/presentation/views/qr_result_view.dart';

import '../../../../../../shared/app_constants.dart';
import '../../../../../Ordering_Notifications/core/utils/cache_helper.dart';
import '../../../../constants.dart';
import '../../../auth/presentation/views/splash_screen.dart';

class AgentHomeView extends StatefulWidget {
  const AgentHomeView({super.key});
  static const String routeName = 'AgentHomeView';

  @override
  // ignore: library_private_types_in_public_api
  _AgentHomeViewState createState() => _AgentHomeViewState();
}

class _AgentHomeViewState extends State<AgentHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scanning QR code'),
          leading: IconButton(onPressed: ()async{
            await CacheHelper.clear();
            AppConstants.clearConstants();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ));
          },icon: Icon(Icons.logout),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Scan The Consumer QR Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Center the camera on the code',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 120),
              const Text(
                'let\'s Scan it',
                style: TextStyle(color: Constants.primaryGreen, fontSize: 30),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: scanQr,
                  style: ElevatedButton.styleFrom(
                    // primary: Constants.primaryGreen, // background color
                    backgroundColor: Constants.primaryGreen,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // adjust the value to your preference
                    ),
                  ),
                  child: const Text(
                    "Scan",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: const RouteSettings(name: QrResultView.routeName),
            screen: QrResultView(
              data: jsonDecode(value),
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        });
      });
    } catch (e) {
      setState(() {});
    }
  }
}
