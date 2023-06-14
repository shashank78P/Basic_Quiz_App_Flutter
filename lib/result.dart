import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final Function calculateQuizMarks;
  final Function clearAllQuizData;
  final int totalMarksScored;

  const Result(
      this.calculateQuizMarks, this.clearAllQuizData, this.totalMarksScored,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: const Text(
              "Quiz Completed",
              style: TextStyle(
                color: Color.fromARGB(255, 170, 2, 248),
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[500],
                ),
                onPressed: () => {
                  clearAllQuizData(),
                  print("cancel"),
                },
                child: const Text("Cancel"),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      onPressed: () => {
                        clearAllQuizData(),
                        print("clear all"),
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueGrey[400],
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("Clear all"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              child: AlertDialog(
                                title: Text(
                                  "Your quiz marks!!  $totalMarksScored",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      clearAllQuizData();
                                    },
                                    child: const Text(
                                      "Ok",
                                      // style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        print("Submited"),
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green[500],
                      ),
                      child: const Text("Submit"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
