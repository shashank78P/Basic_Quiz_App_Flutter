import "package:flutter/material.dart";

class SubBar extends StatelessWidget {
  final List answeredData;
  final int totalQuestion;
  final VoidCallback showPreviousAnsweredQuestion;

  const SubBar(this.totalQuestion, this.showPreviousAnsweredQuestion,
      {super.key, required this.answeredData});

  Color get getIconColor {
    if (answeredData.isEmpty) {
      return Colors.black12;
    }
    return Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const Text("answered/Total"),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                showPreviousAnsweredQuestion();
              },
              child: const Icon(
                Icons.arrow_back,
                // color: getIconColor,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Text(
            "${answeredData.length} / $totalQuestion",
            style: const TextStyle(
              color: Color.fromARGB(255, 170, 2, 248),
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
