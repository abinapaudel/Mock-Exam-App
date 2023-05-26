import 'package:api_with_provider/providers/mock_exma_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/mock_exam_quiz_model.dart';
import '../option_box.dart';

class QuestionView extends StatefulWidget {
  final int? currentPageNumber;
  final PageController? iQController;
  QuestionView({Key? key, this.currentPageNumber, this.iQController})
      : super(key: key);
  static int currentIndex = 0;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  bool isTapped = false;
  int number = 3;

  PageController controller = PageController();
  // PageController iQcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamProvider>(
      builder: ((context, quizProvider, child) {
        Category currentCategory =
            quizProvider.categories[quizProvider.currentCategoryIndex];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: quizProvider.pageController,
                itemCount: currentCategory.questions!.length,
                onPageChanged: (value) {
                  quizProvider.currentPageNumber = value;
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: const Color(0xFFBDE9C4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              currentCategory.questions![index].question!,
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
                                OptionBox(
                                  0,
                                  onTap: () {
                                    quizProvider.answerChecker(
                                      currentCategory.title!,
                                      currentCategory
                                          .questions![index].question!,
                                      currentCategory
                                          .questions![index].option1!,
                                      currentCategory.questions![index].answer!,
                                      index.toString(),
                                    );
                                    // print(
                                    //     " Tapped on option 1, my category is  ${currentCategory.title} and my index is $index");

                                    quizProvider.updateInitialOptionUtils(
                                        quizProvider.currentSet, index, 0);

                                    quizProvider.addToAttemptedQuestions(
                                        currentCategory
                                            .questions![index].question!);
                                  },
                                  optionData:
                                      currentCategory.questions![index].option1,
                                  // showcheck: optionsProvider.showCheck[0],
                                  categoryName: currentCategory.title,
                                  questionIndex: index,
                                ),
                                OptionBox(
                                  1,
                                  onTap: () {
                                    quizProvider.answerChecker(
                                      currentCategory.title!,
                                      currentCategory
                                          .questions![index].question!,
                                      currentCategory
                                          .questions![index].option2!,
                                      currentCategory.questions![index].answer!,
                                      index.toString(),
                                    );
                                    quizProvider.addToAttemptedQuestions(
                                        currentCategory
                                            .questions![index].question!);

                                    quizProvider.updateInitialOptionUtils(
                                        quizProvider.currentSet, index, 1);
                                    // print(quizProvider.getOptionUtils);
//
                                  },
                                  optionData:
                                      currentCategory.questions![index].option2,
                                  // showcheck: optionsProvider.showCheck[1],
                                  categoryName: currentCategory.title,
                                  questionIndex: index,
                                ),
                                OptionBox(
                                  2,
                                  onTap: () {
                                    quizProvider.answerChecker(
                                      currentCategory.title!,
                                      currentCategory
                                          .questions![index].question!,
                                      currentCategory
                                          .questions![index].option3!,
                                      currentCategory.questions![index].answer!,
                                      index.toString(),
                                    );
                                    quizProvider.addToAttemptedQuestions(
                                        currentCategory
                                            .questions![index].question!);
                                    quizProvider.updateInitialOptionUtils(
                                        quizProvider.currentSet, index, 2);
                                    // print(quizProvider.getOptionUtils);
                                    // print(" Tapped on option 3");
                                  },
                                  optionData:
                                      currentCategory.questions![index].option3,
                                  // showcheck: optionsProvider.showCheck[2],
                                  categoryName: currentCategory.title,
                                  questionIndex: index,
                                ),
                                OptionBox(
                                  3,
                                  onTap: () {
                                    quizProvider.answerChecker(
                                      currentCategory.title!,
                                      currentCategory
                                          .questions![index].question!,
                                      currentCategory
                                          .questions![index].option4!,
                                      currentCategory.questions![index].answer!,
                                      index.toString(),
                                    );
                                    quizProvider.addToAttemptedQuestions(
                                        currentCategory
                                            .questions![index].question!);
                                    quizProvider.updateInitialOptionUtils(
                                        quizProvider.currentSet, index, 3);
                                  },
                                  optionData:
                                      currentCategory.questions![index].option4,
                                  // showcheck: optionsProvider.showCheck[3],
                                  categoryName: currentCategory.title,
                                  questionIndex: index,
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
    );
  }
}
