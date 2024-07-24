import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:super_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:super_app/features/auth/presentation/views/widgets/custome_btn.dart';

import '../../../../constants.dart';
import 'create_national_id_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static const String routeName = "RegisterScreen";

  TextEditingController? usernameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? mobileNumberController = TextEditingController();
  TextEditingController? nationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SignUp",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Text("User Name",
                style: TextStyle(color: Constants.textFieldHintColor)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: usernameController,
              text: "User Name",
              icon: const Icon(Icons.person_outline),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Mobile Number",
                style: TextStyle(color: Constants.textFieldHintColor)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: mobileNumberController,
              text: "Mobile Number",
              icon: const Icon(Icons.phone_android_rounded),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Email",
                style: TextStyle(color: Constants.textFieldHintColor)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: emailController,
              text: "Email",
              icon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Password",
                style: TextStyle(color: Constants.textFieldHintColor)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: passwordController,
              text: "Password",
              icon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Confirm Password",
                style: TextStyle(color: Constants.textFieldHintColor)),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              controller: confirmPasswordController,
              text: "Confirm Password",
              icon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(text: "Take National ID Picture", func: (){
              BlocProvider.of<AuthCubit>(context).user.userName = usernameController!.text;
              BlocProvider.of<AuthCubit>(context).user.userPassword = passwordController!.text;
              BlocProvider.of<AuthCubit>(context).user.mobileNumber = mobileNumberController!.text;
              BlocProvider.of<AuthCubit>(context).user.userEmail = emailController!.text;
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(
                    name: CreateNationalIdPage.routeName),
                screen: const CreateNationalIdPage(),
                withNavBar: false,
                pageTransitionAnimation:
                PageTransitionAnimation.cupertino,
              );
            }),
            const Center(child: Text("Don’t Know your login info? Check your Email",style: TextStyle(fontWeight: FontWeight.bold,color: Constants.primaryGreen),)),
          ],
        ),
      ),
    );
  }
}
