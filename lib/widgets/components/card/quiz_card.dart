import 'package:api_with_provider/providers/mock_exma_provider.dart';
import 'package:api_with_provider/screens/mock%20Test/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/mock_exam_quiz_model.dart';
// import '../../modal_bottom_sheet.dart';

class QuizCard extends StatelessWidget {
  final Exam? quiz;
  final int quizIndex;

  const QuizCard({super.key, this.quiz, required this.quizIndex});

  @override
  Widget build(BuildContext context) {
    // QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Consumer<ExamProvider>(builder: ((context, quizProvider, child) {
      return InkWell(
        onTap: () {
          quizProvider.setCategory(quiz!.categories!);
          quizProvider.getinitialoptionUtils();

          quizProvider.setBorderAndSelected();
          quizProvider.setInitialSelectedAnswer();
          quizProvider.setTotalNumberOfQuestions(
              quizProvider.getQuizs[quizIndex].questions!.length);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(
                  quizIndex,
                  categories: quiz!.categories!,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image(
                          image: NetworkImage(
                              "https://nhpc.gov.np/beta//assets/img/nhpc_logo.jpg")),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(quiz!.title!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.bold)),
                          Text(quiz!.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontFamily: "Sofia")),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Level: ",
                          style: TextStyle(
                              fontFamily: "Sofia", fontWeight: FontWeight.bold),
                        ),
                        Text("Medium")
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Time: ",
                          style: TextStyle(
                              fontFamily: "Sofia", fontWeight: FontWeight.bold),
                        ),
                        Text("2 hours")
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Full Marks: ",
                          style: TextStyle(
                              fontFamily: "Sofia", fontWeight: FontWeight.bold),
                        ),
                        Text("100")
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Pass Marks: ",
                          style: TextStyle(
                              fontFamily: "Sofia", fontWeight: FontWeight.bold),
                        ),
                        Text("60")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
