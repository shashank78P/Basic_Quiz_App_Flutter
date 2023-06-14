import "package:demo_project/answer.dart";
import "package:demo_project/question.dart";
import "package:flutter/material.dart";

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionAnswer;
  final List answeredData;
  final int questionIndex;
  final Function(String) optionSelectHandler;
  final Function incrementHandler;
  final Function clearAllQuizData;

  const Quiz({
    required this.questionAnswer,
    required this.questionIndex,
    required this.optionSelectHandler,
    required this.answeredData,
    required this.incrementHandler,
    required this.clearAllQuizData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionAnswer[questionIndex]["question"] as String),
        ...(questionAnswer[questionIndex]["answer"] as List<String>)
            .map(
              (answer) => Answer(
                optionSelectHandler: optionSelectHandler,
                option: answer,
                isSelected: (questionIndex < answeredData.length)
                    ? answeredData[questionIndex] == answer
                    : false,
              ),
            )
            .toList(),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.white70,
              backgroundColor: Colors.white70,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: AlertDialog(
                      title: const Text("Are u sure to exit from Quiz!!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            print("cancel");
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print("df");
                            clearAllQuizData();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Exit",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Exit",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
