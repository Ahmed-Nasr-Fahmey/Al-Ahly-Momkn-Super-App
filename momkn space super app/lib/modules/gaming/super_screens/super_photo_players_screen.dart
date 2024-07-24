import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/gaming/super_consts/strings.dart';

class SuperPhotoPlayersScreen extends StatefulWidget {
  const SuperPhotoPlayersScreen({
    super.key,
  });

  @override
  State<SuperPhotoPlayersScreen> createState() =>
      _SuperPhotoPlayersScreenState();
}

class _SuperPhotoPlayersScreenState extends State<SuperPhotoPlayersScreen> {
  String imageUrl = '';
  List<String> playerNames = [];
  List<String> possibleAnswers = [];
  List<String> userAnswers = [];
  List<String> filteredAnswers = [];
  bool isLoading = true;
  String errorMessage = '';
  late ClueTimerController _clueTimerController;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clueTimerController = ClueTimerController();
    _fetchPhotoData();
    _fetchPossibleAnswers();
  }

  Future<void> _fetchPhotoData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('GPPhotos')
          .doc('FCTAcGOtvslibbOyS2zw')
          .get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          imageUrl = data['img'];
          playerNames = List<String>.from(data['playersNames']);
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
        errorMessage = "Failed to fetch data: ${e.message}";
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

  Future<void> _fetchPossibleAnswers() async {
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
    Navigator.pop(context);
  }

  void _submitAnswer(String userAnswer) {
    String formattedAnswer = userAnswer.trim().toLowerCase();
    if (userAnswers.length >= 11) {
      Fluttertoast.showToast(msg: 'You can only submit up to 11 answers.');
    } else if (userAnswers.contains(formattedAnswer)) {
      Fluttertoast.showToast(msg: 'You have already chosen this answer.');
    } else {
      setState(() {
        userAnswers.add(formattedAnswer);
        if (playerNames
            .map((name) => name.trim().toLowerCase())
            .contains(formattedAnswer)) {
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
      });
    }
    _textController.clear();
  }

  void _skipQuestion() async {
    _navigateToAnotherScreen();
  }

  void _filterAnswers(String query) {
    setState(() {
      filteredAnswers = possibleAnswers
          .where((answer) => answer.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _removeAnswer(String answer) {
    String formattedAnswer = answer.trim().toLowerCase();
    setState(() {
      userAnswers.remove(formattedAnswer);
      if (playerNames
          .map((name) => name.trim().toLowerCase())
          .contains(formattedAnswer)) {}
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

                          const SizedBox(height: 10),
                          ClueTimer(
                            onTimeUp: _skipQuestion,
                            controller: _clueTimerController,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'Enter player name',
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
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  filteredAnswers = [];
                                });
                              } else {
                                _filterAnswers(value);
                              }
                            },
                            onSubmitted: _submitAnswer,
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 8.0, // spacing between items
                            runSpacing: 4.0, // spacing between rows
                            children: filteredAnswers.map((answer) {
                              return GestureDetector(
                                onTap: () {
                                  _submitAnswer(answer);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[
                                        800], // Adjust the color as needed
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    answer,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                           Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Who is in the picture?",
                              style: TextStyle(
                                  color: AppTheme.primaryGreenColor,
                                  fontWeight: FontWeight.w600,fontSize: AppTheme.fontSize18(context)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Your Answers:',
                            style: TextStyle(
                                color: AppTheme.primaryGreenColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: userAnswers.map((answer) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 36, 50, 61),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: const Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () {
                                        _removeAnswer(answer);
                                      },
                                    ),
                                    Text(
                                      answer,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _skipQuestion,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
AppTheme.orangeColor                              ),
                              child: const Text(
                                "Skip question",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
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
  State<ClueTimer> createState() => _ClueTimerState();
}

class _ClueTimerState extends State<ClueTimer> {
  Timer? _timer;
  int _timeRemaining = SuperStringsClass.photoTime;

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
      _timeRemaining = SuperStringsClass.photoTime;
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
