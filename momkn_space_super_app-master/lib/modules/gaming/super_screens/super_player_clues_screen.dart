import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/gaming/super_consts/strings.dart';

class SuperPlayerCluesScreen extends StatefulWidget {
  const SuperPlayerCluesScreen({super.key});

  @override
  State<SuperPlayerCluesScreen> createState() => _SuperPlayerCluesScreenState();
}

class _SuperPlayerCluesScreenState extends State<SuperPlayerCluesScreen> {
  List<String> clues = [];
  String answer = "";
  int clueIndex = 0;
  int score = 0;
  bool isLoading = true;
  String errorMessage = '';
  late ClueTimerController _clueTimerController;
  List<String> possibleAnswers = [];
  List<String> filteredAnswers = [];
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clueTimerController = ClueTimerController();
    _fetchClues();
    _fetchAnswers();
  }

  Future<void> _fetchClues() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('GPClues')
          .doc('pmmuFMcmUFH9L1sFPPeD')
          .get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          clues = [
            data['clue1'],
            data['clue2'],
            data['clue3'],
            data['clue4'],
            data['clue5']
          ];
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
        errorMessage = "Failed to fetch clues: ${e.message}";
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
      setState(() {
        isLoading = true;
      });
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
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _addClue() {
    if (clueIndex < clues.length - 1) {
      setState(() {
        clueIndex++;
      });
      _clueTimerController.resetTimer();
      Fluttertoast.showToast(
        msg: "New Clue Available!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }
  }

  void _navigateToTypeHandlingScreen() {
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
    _navigateToTypeHandlingScreen();
  }

  void _filterAnswers(String input) {
    setState(() {
      if (input.trim().isEmpty) {
        filteredAnswers = [];
      } else {
        filteredAnswers = possibleAnswers
            .where((answer) =>
                answer.toLowerCase().startsWith(input.trim().toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.screenBackgroundColor,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppTheme.primaryGreenColor,
              ))
            : errorMessage.isNotEmpty
                ? Center(
                    child:
                        Text(errorMessage, style: TextStyle(color: Colors.red)))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
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
                            onTimeUp: () {
                              if (clueIndex < clues.length - 1) {
                                setState(() {
                                  clueIndex++;
                                });
                                _clueTimerController.resetTimer();
                                Fluttertoast.showToast(
                                  msg: "New Clue Available!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: AppTheme.primaryGreenColor,
                                  textColor: Colors.white,
                                );
                              } else {
                                _navigateToTypeHandlingScreen();
                              }
                            },
                            controller: _clueTimerController,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: _skipQuestion,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.orangeColor),
                                  child: const Text(
                                    "Skip question",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              if (clueIndex < clues.length - 1)
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: _addClue,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppTheme.orangeColor),
                                    child: const Text(
                                      "Add clue",
                                      style: TextStyle(
                                          color: AppTheme.whiteColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Your answer is: \t ${_answerController.text}",
                            style: TextStyle(
                                color: AppTheme.primaryGreenColor,
                                fontSize: AppTheme.fontSize18(context)),
                          ),
                          const SizedBox(height: 10),
                          TextField(
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
                            onSubmitted: _submitAnswer,
                          ),
                          const SizedBox(height: 10),
                          filteredAnswers.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      children: filteredAnswers.map((answer) {
                                        return GestureDetector(
                                          onTap: () {
                                            _answerController.text = answer;
                                            _submitAnswer(answer);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            margin: const EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  49, 71, 94, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                  color: Colors.white70),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(clueIndex + 1, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Clue ${index + 1} : ",
                                      style: const TextStyle(
                                          color: AppTheme.primaryGreenColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      clues[index],
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
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
  _ClueTimerState createState() => _ClueTimerState();
}

class _ClueTimerState extends State<ClueTimer> {
  Timer? _timer;
  int _timeRemaining = SuperStringsClass.clueTime;

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
      _timeRemaining = SuperStringsClass.clueTime;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Time remaining: ${(_timeRemaining ~/ 60).toString().padLeft(2, '0')}:${(_timeRemaining % 60).toString().padLeft(2, '0')}",
      style: const TextStyle(color: AppTheme.primaryGreenColor),
    );
  }
}
