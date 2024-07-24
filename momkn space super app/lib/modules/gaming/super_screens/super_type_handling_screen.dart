import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/gaming/super_screens/loading_screen.dart';
import 'package:super_app/modules/gaming/super_screens/super_maza_screen.dart';
import 'package:super_app/modules/gaming/super_screens/super_photo_players_screen.dart';
import 'package:super_app/modules/gaming/super_screens/super_player_clubs_screen.dart';
import 'package:super_app/modules/gaming/super_screens/super_player_clues_screen.dart';
import 'package:super_app/modules/gaming/super_screens/super_random_questions_screen.dart';

class SuperTypeHandlingScreen extends StatefulWidget {
  const SuperTypeHandlingScreen({super.key});

  @override
  State<SuperTypeHandlingScreen> createState() =>
      _SuperTypeHandlingScreenState();
}

class _SuperTypeHandlingScreenState extends State<SuperTypeHandlingScreen> {
  bool isLoading = true;

  bool showClues = false;
  bool showMazyra = false;
  bool showMaza = false;
  bool showPhoto = false;
  bool showRandom = false;

  String errMsg = "";

  @override
  void initState() {
    super.initState();
    _checkForNewVersion();
  }

  Future<void> _checkForNewVersion() async {
    setState(() {
      isLoading = true;
    });
    try {
      // Fetch version and control values from GPControll collection
      DocumentSnapshot versionDoc = await FirebaseFirestore.instance
          .collection('GPControll')
          .doc('XgA333X4OmrDAcEARoAZ')
          .get();

      bool clues = versionDoc.get('clues');
      bool masyra = versionDoc.get('masyra');
      bool maza = versionDoc.get('maza');
      bool photo = versionDoc.get('photo');
      bool random = versionDoc.get('random');

      setState(() {
        showClues = clues;
        showMazyra = masyra;
        showMaza = maza;
        showPhoto = photo;
        showRandom = random;
      });
    } on FirebaseException catch (e) {
      log('Error fetching data: $e');
      setState(() {
        errMsg = "There is an unexpected error!";
      });
    } catch (e) {
      log('Error fetching data: $e');
      setState(() {
        errMsg = "There is an unexpected error!";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoadingScreen(
        isLoading: isLoading,
        child: Scaffold(
          backgroundColor: AppTheme.screenBackgroundColor,
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppTheme.primaryGreenColor,
                ))
              : errMsg.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: const BoxDecoration(
                              color: AppTheme.transparentColor),
                          child: Stack(children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF0A271D),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40))),
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
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:  EdgeInsets.only(left: context.screenAspectRatio*10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.arrow_back_ios_new,color: AppTheme.whiteColor,size: context.screenAspectRatio*16,),
                                ),
                              ),
                            )
                          ]),
                        ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: AppTheme.boxRadius,
                        //       border: Border.all(color: AppTheme.orangeColor)),
                        //   padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio*15,vertical: context.screenAspectRatio*10),
                        //   child: Text("Our Community Games",style: TextStyle(fontSize: AppTheme.fontSize18(context),color: AppTheme.orangeColor),),
                        // ),
                        // SizedBox(
                        //   height: context.screenAspectRatio * 10,
                        // ),
                        if (showClues)
                          CustomButton(
                              fun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SuperPlayerCluesScreen(),
                                    ));
                              },
                              txt: "من اللاعب؟"),
                        if (showMaza)
                          CustomButton(
                              fun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SuperMazaScreen(),
                                    ));
                              },
                              txt: "ماذا تعرف؟"),
                        if (showPhoto)
                          CustomButton(
                              fun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SuperPhotoPlayersScreen(),
                                    ));
                              },
                              txt: "مين فى الصورة؟"),
                        if (showMazyra)
                          CustomButton(
                              fun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SuperPlayerClubsScreen(),
                                    ));
                              },
                              txt: "مسيرة لاعبين"),
                        if (showRandom)
                          CustomButton(
                              fun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SuperRandomQuestionsScreen(),
                                    ));
                              },
                              txt: "اسئلة عشوائية"),
                      ],
                    )
                  : Center(
                      child: Text(
                        errMsg,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
        ),
      ),
    );
  }
}

class ScoreText extends StatelessWidget {
  const ScoreText({
    super.key,
    required this.userTotalScore,
  });

  final int userTotalScore;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Your last total score: ',
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: userTotalScore.toString(),
            style: const TextStyle(
              color: Colors.lightGreenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback fun;
  final String txt;
  const CustomButton({
    super.key,
    required this.fun,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: context.screenAspectRatio * 5,
            horizontal: context.screenAspectRatio * 10),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          color: AppTheme.primaryGreenColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // border: Border.all(color: AppTheme.orangeColor,width: 2)
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: AppTheme.fontSize18(context)),
        ),
      ),
    );
  }
}
