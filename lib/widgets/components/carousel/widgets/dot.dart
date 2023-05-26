import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              50, // set this value to 0 if you want rectangular indicator
            )),
        child: CircleAvatar(
            radius: 4, // size of the dot
            backgroundColor: isActive
                ? Colors.red
                : Colors.transparent), // change dot colors here
      ),
    );
  }
}
