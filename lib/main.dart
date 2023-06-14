import 'package:demo_project/question.dart';
import 'package:demo_project/quiz.dart';
import 'package:demo_project/result.dart';
import 'package:demo_project/subBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;
  int totalMarksScored = 0;
  bool isForward = true;
  final _answeredData = [];
  final questionAnswer = [
    {
      "question": "Who am I?",
      "answer": ["Human", "Devil", "Alien", "Monster"],
      "corectAnswer": "Human"
    },
    {
      "question": "What is my age?",
      "answer": ["29", "20", "21", "25"],
      "corectAnswer": "21"
    },
  ];

  int calculateQuizMarks() {
    print("called calculated data $_answeredData");
    for (int i = 0; i < _answeredData.length; i++) {
      print("e ${_answeredData[i]}");
      print("e ${questionAnswer[i]["corectAnswer"]}");
      if (_answeredData[i] == questionAnswer[i]["corectAnswer"]) {
        setState(() {
          totalMarksScored = totalMarksScored + 1;
        });
        print("e $totalMarksScored");
      }
    }
    return totalMarksScored;
  }

  void optionSelctHandler(String optionSelected) {
    print(
        "option selcted $optionSelected $questionIndex ${_answeredData.length}");
    if (questionIndex < questionAnswer.length) {
      setState(() {
        // setting a flaf is forward to true
        isForward = true;
        // saving the selected answer
        if (questionIndex < _answeredData.length) {
          _answeredData
              .replaceRange(questionIndex, questionIndex + 1, [optionSelected]);
        } else {
          _answeredData.insert(questionIndex, optionSelected);
        }
        // increasing question number
        questionIndex = questionIndex + 1;
      });
    }
    if (questionIndex == questionAnswer.length) {
      calculateQuizMarks();
    }
    print("_answeredData $_answeredData");
    print("questionIndex $questionIndex");
  }

  void incrementHandler() {
    if (questionIndex < questionAnswer.length) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
  }

  void clearAllQuizData() {
    print("dsfsdf");
    setState(() {
      questionIndex = 0;
      totalMarksScored = 0;
      isForward = true;
      _answeredData.clear();
    });
    print("$_answeredData, $isForward , $questionIndex");
  }

  // void saveSelectedOption(String optionSelecetd)

  void showPreviousAnsweredQuestion() {
    print("questionIndex $questionIndex");
    if (questionIndex <= questionAnswer.length && questionIndex > 0) {
      setState(() {
        // setting is forward  false
        isForward = false;
        // descresing question number
        questionIndex = questionIndex - 1;
      });
      // setState(() {
      //   isForward = false;
      // });
    }
  }

  // void storeAnswer(optedAnswer) {
  //   if (questionIndex < questionAnswer.length) {
  //     _answeredData[questionIndex] = {optedAnswer: optedAnswer};
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quize"),
          backgroundColor: const Color.fromARGB(255, 180, 213, 239),
          foregroundColor: const Color.fromARGB(255, 170, 2, 248),
        ),
        body: Column(
          children: [
            SubBar(
              answeredData: _answeredData,
              questionAnswer.length,
              showPreviousAnsweredQuestion,
            ),
            (questionIndex < questionAnswer.length)
                ? Quiz(
                    questionAnswer: questionAnswer,
                    questionIndex: questionIndex,
                    optionSelectHandler: optionSelctHandler,
                    answeredData: _answeredData,
                    incrementHandler: incrementHandler,
                    clearAllQuizData: clearAllQuizData,
                  )
                : Result(calculateQuizMarks, clearAllQuizData, totalMarksScored)
          ],
        ),
      ),
    );
  }
}
