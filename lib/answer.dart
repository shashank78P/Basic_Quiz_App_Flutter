import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Answer extends StatelessWidget {
  late Function(String) optionSelectHandler;
  String option;
  bool isSelected;
  Answer({
    required this.optionSelectHandler,
    required this.option,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          // print(option);
          optionSelectHandler(option);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white70 : Colors.black54,
          backgroundColor: isSelected
              ? Colors.green[400]
              : const Color.fromARGB(255, 180, 213, 239),
        ),
        child: Text(
          option,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
