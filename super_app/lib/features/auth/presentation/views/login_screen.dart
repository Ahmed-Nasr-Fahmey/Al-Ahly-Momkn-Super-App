import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_app/features/auth/presentation/manager/auth_state.dart';
import 'package:super_app/features/auth/presentation/views/sign_up_screen.dart';
import 'package:super_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:super_app/features/auth/presentation/views/widgets/custome_btn.dart';
import 'package:super_app/features/home/presentation/views/agent_home_view.dart';
import 'package:super_app/features/home/presentation/views/consumer_home_view.dart';
import '../../../../constants.dart';
import '../manager/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? usernameController = TextEditingController();
  TextEditingController? nationalIdController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  bool isChecked = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          setState(() {
            isLoading = false;
          });
          if (BlocProvider.of<AuthCubit>(context).user.nid!.status ==
                  'Accepted' &&
              BlocProvider.of<AuthCubit>(context)
                  .user
                  .permission!
                  .serviceAgent!) {
            // navigate to agent ui
            log('navigate to agent ui');
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: const RouteSettings(name: AgentHomeView.routeName),
              screen: const AgentHomeView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (BlocProvider.of<AuthCubit>(context).user.nid!.status ==
                  'Accepted' &&
              BlocProvider.of<AuthCubit>(context).user.permission!.consumer!) {
            // navigate to consumer ui
            log('navigate to consumer ui');
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: const RouteSettings(name: ConsumerHomeView.routeName),
              screen: const ConsumerHomeView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        } else if (state is LoginFaliureState) {
          setState(() {
            isLoading = false;
          });
          log('login faliure');
        } else if (state is LoginLoadingState) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login",
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email",
                      style: TextStyle(color: Constants.textFieldHintColor)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: usernameController,
                    text: "Email",
                    icon: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("National ID",
                      style: TextStyle(color: Constants.textFieldHintColor)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: nationalIdController,
                    text: "National ID",
                    icon: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(
                    height: 50,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text('Save password'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors
                                  .blue), // Customize text style if needed
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Constants.primaryGreen,
                      ),
                    )
                  : CustomButton(
                      text: "Log in",
                      func: () async {
                        await BlocProvider.of<AuthCubit>(context).login(
                            userEmail: usernameController!.text,
                            userPass: passwordController!.text,
                            userNID: nationalIdController!.text);
                        // PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        //     context,
                        //     settings: const RouteSettings(
                        //         name: LikedCategoryView.routeName),
                        //     screen: LikedCategoryView(
                        //       categoryModel: ConstLists.categoriesList[index],
                        //       cityCategoryModel: BlocProvider.of<UserCubit>(context)
                        //           .favorites
                        //           .where(
                        //             (element) =>
                        //         element.categoryName!.toLowerCase() ==
                        //             ConstLists.categoriesList[index].categoryName
                        //                 .toLowerCase(),
                        //       )
                        //           .toList(),
                        //     ),
                        //     withNavBar: false,
                        //     pageTransitionAnimation:
                        //     PageTransitionAnimation.cupertino,
                        //    );
                      }),
            ),
            GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: SignUpScreen.routeName),
                  screen: SignUpScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: const Center(
                child: Text(
                  "Don’t Know your login info? Check your Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.primaryGreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
