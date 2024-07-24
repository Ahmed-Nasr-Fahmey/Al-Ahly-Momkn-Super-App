import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/widgets/custome_btn.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';

import '../../../../../Ordering_Notifications/core/utils/app_theme.dart';
import '../../../../constants.dart';
import '../manager/auth_cubit.dart';
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
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(color: AppTheme.transparentColor),
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF0A271D),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
                height: context.screenHeight * 0.2,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/ahly_momkn_bg_home.svg",
                      width: context.screenWidth,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      child: Image.asset(
                        "assets/logo.png",
                        height: context.screenAspectRatio * 50,
                        fit: BoxFit.fill,
                      ),
                    ),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: context.screenAspectRatio * 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.whiteColor,
                              size: context.screenAspectRatio * 15,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ]),
          ),

          Center(child: Text("Signup",style: TextStyle(color: AppTheme.primaryGreenColor,fontSize: AppTheme.fontSize28(context),fontWeight: AppTheme.fontWeight600),)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: context.screenAspectRatio*5,
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
                SizedBox(
                  height: context.screenAspectRatio*5,
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
                SizedBox(
                  height: context.screenAspectRatio*5,
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
                SizedBox(
                  height: context.screenAspectRatio*5,
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
                SizedBox(
                  height: context.screenAspectRatio*5,
                ),
              Center(
                child: CustomButton(text: "Take National ID Picture", func: (){
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

              ),
                SizedBox(
                  height: context.screenAspectRatio*5,
                ),

            ],),
          ) ],
      ),
    );
  }
}
