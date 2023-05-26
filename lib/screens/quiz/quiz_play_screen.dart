import 'package:api_with_provider/screens/quiz/option_box.dart';
import 'package:api_with_provider/widgets/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/practice_quiz_model.dart';
import '../../providers/mock_exma_provider.dart';

class QuizPlayScreen extends StatefulWidget {
  final Category category;
  const QuizPlayScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<QuizPlayScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizPlayScreen> {
  double width = 0.1;
  Color borderColor = Colors.white;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    ExamProvider quizProvider =
        Provider.of<ExamProvider>(context, listen: true);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                      "Sorry!  you cannot go back without submitting the test!",
                      style: TextStyle(fontFamily: "Sofia"),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Okay")),
                      // TextButton(
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //       Navigator.pop(context);
                      //     },
                      //     child: const Text("Yes")),
                    ],
                  ));
          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: CustomAppBar(
                text: "Quiz Screen",
              )),
              Expanded(
                  flex: 10,
                  child: Consumer<ExamProvider>(
                    builder: ((context, quizProvider, child) {
                      ;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _controller,
                              itemCount: widget.category.questions!.length,
                              onPageChanged: (value) {
                                quizProvider.currentPageNumber = value;
                              },
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFBDE9C4),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            widget.category.questions![index]
                                                .question!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              QuizOptionBox(
                                                0,
                                                onTap: () {
                                                  Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeIn);
                                                  });
                                                  
                                                  // quizProvider.answerChecker(
                                                  //   currentCategory.title!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .question!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .option1!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .answer!,
                                                  //   index.toString(),
                                                  // );
                                                  // print(
                                                  //     " Tapped on option 1, my category is  ${currentCategory.title} and my index is $index");

                                                  // quizProvider
                                                  //     .updateInitialOptionUtils(
                                                  //         quizProvider.currentSet,
                                                  //         index,
                                                  //         0);

                                                  // quizProvider
                                                  //     .addToAttemptedQuestions(
                                                  //         currentCategory
                                                  //             .questions![index]
                                                  //             .question!);
                                                },
                                                optionData: widget.category
                                                    .questions![index].option1,
                                                // showcheck: optionsProvider.showCheck[0],
                                                // categoryName:
                                                //     currentCategory.title,
                                                // questionIndex: index,
                                              ),
                                              QuizOptionBox(
                                                1,
                                                onTap: () {
                                                   Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeIn);
                                                  });
                                                  

                                                  // quizProvider.answerChecker(
                                                  //   currentCategory.title!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .question!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .option2!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .answer!,
                                                  //   index.toString(),
                                                  // );
                                                  // quizProvider
                                                  //     .addToAttemptedQuestions(
                                                  //         currentCategory
                                                  //             .questions![index]
                                                  //             .question!);

                                                  // quizProvider
                                                  //     .updateInitialOptionUtils(
                                                  //         quizProvider.currentSet,
                                                  //         index,
                                                  //         1);
                                                  // print(quizProvider.getOptionUtils);
//
                                                },
                                                optionData: widget.category
                                                    .questions![index].option2,
                                                // showcheck: optionsProvider.showCheck[1],
                                                // categoryName:
                                                //     currentCategory.title,
                                                // questionIndex: index,
                                              ),
                                              QuizOptionBox(
                                                2,
                                                onTap: () {
                                                   Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeIn);
                                                  });
                                                  
                                                  // quizProvider.answerChecker(
                                                  //   currentCategory.title!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .question!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .option3!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .answer!,
                                                  //   index.toString(),
                                                  // );
                                                  // quizProvider
                                                  //     .addToAttemptedQuestions(
                                                  //         currentCategory
                                                  //             .questions![index]
                                                  //             .question!);
                                                  // quizProvider
                                                  //     .updateInitialOptionUtils(
                                                  //         quizProvider.currentSet,
                                                  //         index,
                                                  //         2);
                                                  // print(quizProvider.getOptionUtils);
                                                  // print(" Tapped on option 3");
                                                },
                                                optionData: widget.category
                                                    .questions![index].option3,
                                                // showcheck: optionsProvider.showCheck[2],
                                                // categoryName:
                                                //     currentCategory.title,
                                                // questionIndex: index,
                                              ),
                                              QuizOptionBox(
                                                3,
                                                onTap: () {
                                                   Future.delayed(
                                                      Duration(seconds: 2), () {
                                                    _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeIn);
                                                  });

                                                  
                                                  
                                                  // quizProvider.answerChecker(
                                                  //   currentCategory.title!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .question!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .option4!,
                                                  //   currentCategory
                                                  //       .questions![index]
                                                  //       .answer!,
                                                  //   index.toString(),
                                                  // );
                                                  // quizProvider
                                                  //     .addToAttemptedQuestions(
                                                  //         currentCategory
                                                  //             .questions![index]
                                                  //             .question!);
                                                  // quizProvider
                                                  //     .updateInitialOptionUtils(
                                                  //         quizProvider.currentSet,
                                                  //         index,
                                                  //         3);
                                                },
                                                optionData: widget.category
                                                    .questions![index].option4,
                                                // showcheck: optionsProvider.showCheck[3],
                                                // categoryName:
                                                //     currentCategory.title,
                                                // questionIndex: index,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }),
                  )),
              Expanded(flex: 2, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
