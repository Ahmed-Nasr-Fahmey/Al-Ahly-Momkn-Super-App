import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/sign_up_screen.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/widgets/custome_btn.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import '../../../../../Ordering_Notifications/core/utils/app_theme.dart';
import '../../../../constants.dart';
import '../../../home/presentation/views/agent_home_view.dart';
import '../../../home/presentation/views/consumer_home_view.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';

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
          log("login success");
          log(BlocProvider.of<AuthCubit>(context).user.nid!.status.toString());
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
              settings:const RouteSettings(name: AgentHomeView.routeName),
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
              screen:  const ConsumerHomeView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
          else if(BlocProvider.of<AuthCubit>(context).user.nid!.status ==
              'Pending'){
            SnackBarMessage.showErrorSnackBar(message: "Pending For Approval", context: context);
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Login",style: TextStyle(color: AppTheme.primaryGreenColor,fontSize: AppTheme.fontSize28(context),fontWeight: AppTheme.fontWeight600),)),
                  SizedBox(
                    height: context.screenAspectRatio*10,
                  ),
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
                   SizedBox(
                    height: context.screenAspectRatio*5,
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
                   ],
              ),
            ),
            SizedBox(
              height: context.screenAspectRatio*10,
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
            SizedBox(
              height: context.screenAspectRatio*10,
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
                  "Don’t have an account? Signup",
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
