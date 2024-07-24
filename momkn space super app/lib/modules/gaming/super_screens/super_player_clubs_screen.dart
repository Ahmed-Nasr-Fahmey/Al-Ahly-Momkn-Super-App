import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/gaming/super_consts/strings.dart';

class SuperPlayerClubsScreen extends StatefulWidget {
  const SuperPlayerClubsScreen({
    super.key,
  });

  @override
  State<SuperPlayerClubsScreen> createState() => _SuperPlayerClubsScreenState();
}

class _SuperPlayerClubsScreenState extends State<SuperPlayerClubsScreen> {
  List<String> clubs = [];
  String answer = "";
  bool isLoading = true;
  String errorMessage = '';
  int score = 0;
  late ClueTimerController _clueTimerController;
  List<String> possibleAnswers = [];
  List<String> filteredAnswers = [];
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clueTimerController = ClueTimerController();
    _fetchClubs();
    _fetchAnswers();
  }

  Future<void> _fetchClubs() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('GPClubs')
          .doc('S3VpN35vll2XZCVxEY9Z')
          .get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          clubs = List<String>.from(data['clubs']);
          answer = data['answer'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Document does not exist.";
          isLoading = false;
        });
      }
    } on FirebaseException catch (e) {
      log("Firebase error: $e");
      setState(() {
        errorMessage = "Failed to fetch clubs: ${e.message}";
        isLoading = false;
      });
    } catch (e) {
      log("Error: $e");
      setState(() {
        errorMessage = "An unexpected error occurred.";
        isLoading = false;
      });
    }
  }

  Future<void> _fetchAnswers() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('GPControll')
          .doc('XgA333X4OmrDAcEARoAZ')
          .get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          possibleAnswers = List<String>.from(data['answers']);
        });
      } else {
        setState(() {
          errorMessage = "Answers document does not exist.";
        });
      }
    } on FirebaseException catch (e) {
      log("Firebase error: $e");
      setState(() {
        errorMessage = "Failed to fetch answers: ${e.message}";
      });
    } catch (e) {
      log("Error: $e");
      setState(() {
        errorMessage = "An unexpected error occurred.";
      });
    }
  }

  void _navigateToAnotherScreen() {
    Navigator.of(context).pop();
  }

  void _submitAnswer(String userAnswer) {
    setState(() {
      _answerController.text = userAnswer;
    });
    _calcScore();
  }

  void _calcScore() {
    if (_answerController.text.trim().toLowerCase() ==
        answer.trim().toLowerCase()) {
      Fluttertoast.showToast(
          msg: "Excellent!",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.green,
          gravity: ToastGravity.TOP);
    } else {
      Fluttertoast.showToast(
          msg: "Wrong answer try again!",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.red,
          gravity: ToastGravity.TOP);
    }
  }

  void _skipQuestion() {
    _submitAnswer(_answerController.text);
    _calcScore();
    _navigateToAnotherScreen();
  }

  void _filterAnswers(String input) {
    setState(() {
      filteredAnswers = possibleAnswers
          .where((answer) =>
              answer.toLowerCase().startsWith(input.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.screenBackgroundColor,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : Column(
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

                      ClueTimer(
                        onTimeUp: _skipQuestion,
                        controller: _clueTimerController,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: context.screenAspectRatio*15),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _skipQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
AppTheme.orangeColor                          ),
                          child: const Text(
                            "Skip question",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "your answer is: \t ${_answerController.text}",
                        style:  TextStyle(color: AppTheme.primaryGreenColor,fontSize: AppTheme.fontSize18(context)),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: context.screenAspectRatio*5),
                        child: TextField(
                          controller: _answerController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your answer',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: AppTheme.primaryGreenColor,
                            filled: true,
                          ),
                          style: const TextStyle(color: Colors.white),
                          onChanged: _filterAnswers,
                        ),
                      ),
                      const SizedBox(height: 10),
                      filteredAnswers.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: 170,
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: filteredAnswers.map((answer) {
                                    return GestureDetector(
                                      onTap: () {
                                        _answerController.text = answer;
                                        _submitAnswer(answer);
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        margin: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              49, 71, 94, 1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border:
                                              Border.all(color: Colors.white70),
                                        ),
                                        child: Text(
                                          answer,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(clubs.length, (index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: context.screenAspectRatio*15,vertical: context.screenAspectRatio*5),
                                    width: double.infinity,
                                    padding:  EdgeInsets.symmetric(
                                        vertical: context.screenAspectRatio*8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: AppTheme.boxRadius,
                                      border: Border.all(
                                          color: AppTheme.primaryGreenColor, width: 2),
                                    ),
                                    child: Text(
                                      clubs[index],
                                      style:  TextStyle(
                                        color: AppTheme.primaryGreenColor,
                                        fontSize: AppTheme.fontSize16(context),
                                        fontWeight: FontWeight.w700,
                                      ),textAlign: TextAlign.center,
                                    ),
                                  ),
                                  if (index < clubs.length - 1)
                                    const Icon(
                                      Icons.arrow_downward,
                                      color: AppTheme.orangeColor,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

class ClueTimerController {
  late Function() resetTimer;
}

class ClueTimer extends StatefulWidget {
  final VoidCallback onTimeUp;
  final ClueTimerController controller;

  const ClueTimer({required this.onTimeUp, required this.controller, Key? key})
      : super(key: key);

  @override
  State<ClueTimer> createState() => _ClueTimerState();
}

class _ClueTimerState extends State<ClueTimer> {
  Timer? _timer;
  int _timeRemaining = SuperStringsClass.clubsTime;

  @override
  void initState() {
    super.initState();
    _startTimer();
    widget.controller.resetTimer = resetTimer;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          widget.onTimeUp();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _timeRemaining = SuperStringsClass.clubsTime;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_timeRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_timeRemaining % 60).toString().padLeft(2, '0');
    return Text(
      "Time remaining: $minutes:$seconds",
      style:  TextStyle(color: AppTheme.primaryGreenColor),
    );
  }
}
