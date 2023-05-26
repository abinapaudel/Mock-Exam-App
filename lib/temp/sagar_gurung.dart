import 'package:flutter/material.dart';

class GitExercise extends StatefulWidget {
  const GitExercise({super.key});

  @override
  State<GitExercise> createState() => _GitExerciseState();
}

class _GitExerciseState extends State<GitExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Text("Hello THere"),
          )
      ],)),
    );
  }
}