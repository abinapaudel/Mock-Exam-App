import 'package:api_with_provider/providers/quiz_provider.dart';
import 'package:api_with_provider/screens/quiz/quiz_play_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/practice_quiz_model.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Home"),
        ),
        body: Consumer<QuizProvider>(builder: (context, quizProvider, child) {
          return quizProvider.getQuizSets.isEmpty
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
                  itemCount: quizProvider.getQuizSets.length,
                  itemBuilder: (context, index) {
                    Category quiz = quizProvider.getQuizSets[index];

                    return ListTile(
                      title: Text(quiz.title!),
                      subtitle:
                          Text(quiz.questions!.length.toString() + "questions"),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return QuizPlayScreen(category: quiz);
                          },
                        ));
                      },
                    );
                  },
                );
        }));
  }
}
