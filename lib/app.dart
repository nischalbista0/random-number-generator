import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int randomNum1 = Random().nextInt(11);
  int randomNum2 = Random().nextInt(11);
  int totalClicks = 0;
  int correctAnswer = 0;
  int incorrectAnswer = 0;
  bool isGameFinished = false;

  @override
  void initState() {
    super.initState();
    if (randomNum1 == randomNum2) {
      randomNum1 = Random().nextInt(11);
      randomNum2 = Random().nextInt(11);
    }
  }

  void checkAnswer(int buttonNum) {
    if (buttonNum == 1) {
      if (randomNum1 > randomNum2) {
        correctAnswer++;
      } else {
        incorrectAnswer++;
      }
      randomNum1 = Random().nextInt(11);
    } else if (buttonNum == 2) {
      if (randomNum2 > randomNum1) {
        correctAnswer++;
      } else {
        incorrectAnswer++;
      }
      randomNum2 = Random().nextInt(11);
    }

    randomNum1 = Random().nextInt(11);
    randomNum2 = Random().nextInt(11);

    if (randomNum1 == randomNum2) {
      randomNum1 = Random().nextInt(11);
      randomNum2 = Random().nextInt(11);
    }

    totalClicks++;

    if (totalClicks == 10) {
      isGameFinished = true;
    } else if (totalClicks == 11) {
      totalClicks = 0;
      isGameFinished = false;
      correctAnswer = 0;
      incorrectAnswer = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          checkAnswer(1);
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        randomNum1.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          checkAnswer(2);
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        randomNum2.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Result",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Remaining : ${isGameFinished ? 0 : 10 - totalClicks}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Correct Answer : ${isGameFinished ? correctAnswer : ""}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Incorrect Answer : ${isGameFinished ? incorrectAnswer : ""}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
