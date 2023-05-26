
import 'package:api_with_provider/widgets/components/card/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mock_exam_quiz_model.dart';
import '../../providers/mock_exma_provider.dart';

class MockTest extends StatefulWidget {
  const MockTest({super.key});

  @override
  State<MockTest> createState() => MockTestState();
}

class MockTestState extends State<MockTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: Consumer<ExamProvider>(
        builder: (context, quizProvider, child) {
          return quizProvider.getQuizs.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "LoadinG ..",
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: quizProvider.getQuizs.length,
                  itemBuilder: (context, index) {
                    Exam quiz = quizProvider.getQuizs[index];
                    return QuizCard(
                      quizIndex: index,
                      quiz: quiz,
                    );
                  },
                );
        },
      ),
    );
  }
}
