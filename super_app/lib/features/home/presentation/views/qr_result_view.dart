// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/constants.dart';
import 'package:super_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:super_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class QrResultView extends StatefulWidget {
  const QrResultView({super.key, required this.data});
  static const String routeName = 'AgentHomeView';

  final Map<String, dynamic> data;

  @override
  // ignore: library_private_types_in_public_api
  _QrResultViewState createState() => _QrResultViewState();
}

class _QrResultViewState extends State<QrResultView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Row(
              children: [
                Text("Name",
                    style: TextStyle(color: Constants.textFieldHintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: null,
              text: widget.data['userName'],
              icon: null,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("National ID",
                    style: TextStyle(color: Constants.textFieldHintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: null,
              text: widget.data['nationalId'],
              icon: null,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("Location",
                    style: TextStyle(color: Constants.textFieldHintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: null,
              text: widget.data['location'],
              icon: null,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("Birth Date",
                    style: TextStyle(color: Constants.textFieldHintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: null,
              text: widget.data['birthDate'],
              icon: null,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("Gender",
                    style: TextStyle(color: Constants.textFieldHintColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: null,
              text: widget.data['gender'],
              icon: null,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await BlocProvider.of<AuthCubit>(context)
                      .scanQrCode(consumerId: widget.data['_id']);
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // primary: Constants.primaryGreen, // background color
                  backgroundColor: Constants.primaryGreen,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // adjust the value to your preference
                  ),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
