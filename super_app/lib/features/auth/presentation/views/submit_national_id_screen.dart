import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/constants.dart';
import 'package:super_app/core/models/national_id_model.dart';
import 'package:super_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:super_app/features/auth/presentation/views/widgets/input_text_field.dart';


class SubmitNationalIdScreen extends StatelessWidget {
  const SubmitNationalIdScreen({super.key});

  static const String routeName = "SubmitNationalIdPage";

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute
        .of(context)!
        .settings
        .arguments as NationalIdModel;

    TextEditingController firstNameController =
    TextEditingController(text: argument.firstName);
    TextEditingController lastNameController =
    TextEditingController(text: argument.lastName);
    TextEditingController addressController =
    TextEditingController(text: argument.address);
    TextEditingController nationalIdController =
    TextEditingController(text: argument.nationalId);
    TextEditingController birthdateController =
    TextEditingController(text: argument.birthday);
    TextEditingController genderController =
    TextEditingController(text: argument.gender);

    // UserTokenProvider userTokenProvider = Provider.of<UserTokenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your NID Data"),
        backgroundColor: Constants.primaryGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InputTextField(
                  inputController: firstNameController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  inputController: lastNameController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  inputController: addressController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  inputController: nationalIdController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  inputController: birthdateController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  inputController: genderController,
                  hintText: "",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  isPassword: false,
                  readOnly: false,
                  forNumbersOrCalenderOrGender: 0,
                  isArabicDirection: true),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: 200,
                onPressed: () async {
                  NationalIdModel natonalID = NationalIdModel(
                    image: argument.image,
                    nationalId: nationalIdController.text,
                    gender: genderController.text,
                    address: addressController.text,
                    birthday: birthdateController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    manuFactorId: "123456",
                    status: "Pending",
                  );
                  BlocProvider.of<AuthCubit>(context).user.nid = natonalID;
                  await BlocProvider.of<AuthCubit>(context).createNewUser();
                  showDialog(
                      // ignore: use_build_context_synchronously
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text(
                              'Your National ID has Submitted Successfully.!'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                color: Colors.deepOrangeAccent,
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}