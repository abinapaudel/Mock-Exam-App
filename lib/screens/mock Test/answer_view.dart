import 'package:api_with_provider/screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mock_exma_provider.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/components/custom_appbar.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CustomButton(
            buttonText: "Return Home",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          body: Column(
            children: [
              const CustomAppBar(
                text: "Mock Test Exam",
              ),
              Consumer<ExamProvider>(builder: (context, quizProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: quizProvider.categories.length,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                quizProvider.currentCategoryIndex = index;
                                quizProvider.currentSet =
                                    quizProvider.categories[index].title!;
                                // quizProvider.getPageController.jumpTo(0);
                                quizProvider.currentQuestionNumber =
                                    quizProvider.dgetIndexForPages(index);
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: quizProvider.currentSet ==
                                              quizProvider
                                                  .categories[index].title!
                                          ? Colors.red
                                          : Colors.indigo,
                                      width: 2),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                        quizProvider.categories[index].title!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Sofia")),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                );
              }),
              Expanded(child: Consumer<ExamProvider>(
                  builder: (context, ExamProvider quizProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, indexx) => Container(
                        // height: 1,
                        color: Colors.grey,
                      ),
                      itemCount: quizProvider
                          .getCategories[quizProvider.currentCategoryIndex]
                          .questions!
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              "${index + 1}.  ${quizProvider.getCategories[quizProvider.currentCategoryIndex].questions![index].question!}",
                              // widget.mydata[0][widget.questionNo![i].toString()

                              // ],

                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Correct Answer: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        // widget.mydata[2]
                                        //     [widget.questionNo![i].toString()],

                                        quizProvider
                                            .getCategories[quizProvider
                                                .currentCategoryIndex]
                                            .questions![index]
                                            .answer!,

                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontFamily: "Sofia",
                                            // color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                quizProvider.userSelectedAnswer[quizProvider
                                                .getCategories[quizProvider
                                                    .currentCategoryIndex]
                                                .title!]![index.toString()]
                                            .toString() ==
                                        quizProvider
                                            .getCategories[quizProvider
                                                .currentCategoryIndex]
                                            .questions![index]
                                            .answer!
                                    ? Container()
                                    : Row(
                                        children: [
                                          const Text("Your answer: "),
                                          Flexible(
                                            child: Text(
                                              quizProvider.userSelectedAnswer[
                                                      quizProvider
                                                          .getCategories[
                                                              quizProvider
                                                                  .currentCategoryIndex]
                                                          .title!]![
                                                      index.toString()]
                                                      ['answer']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: quizProvider
                                                              .userSelectedAnswer[
                                                                  quizProvider
                                                                      .getCategories[
                                                                          quizProvider
                                                                              .currentCategoryIndex]
                                                                      .title!]![
                                                                  index
                                                                      .toString()]
                                                              .toString() ==
                                                          quizProvider
                                                              .getCategories[
                                                                  quizProvider
                                                                      .currentCategoryIndex]
                                                              .questions![index]
                                                              .answer!
                                                              .toString()
                                                      ? Colors.black
                                                      : Colors.black),
                                            ),
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
