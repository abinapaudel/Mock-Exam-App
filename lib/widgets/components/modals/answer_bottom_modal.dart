import 'package:api_with_provider/services/exam_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mock_exma_provider.dart';
import '../../../providers/utils_provider.dart';
import '../../../screens/mock Test/score_view.dart';

// import '../utils/test_style.dart';

class AnswerModalSheet extends StatefulWidget {
  const AnswerModalSheet({super.key});

  @override
  State<AnswerModalSheet> createState() => _AnswerModalSheetState();
}

class _AnswerModalSheetState extends State<AnswerModalSheet> {
  var borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Consumer<ExamProvider>(builder: (context, quizProvider, child) {
            return SizedBox(
              // height: MediaQuery.of(context).size.height * 0.10,
              child: Column(
                children: [
                  const Text(
                    "Mock Test Progress",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sofia",
                        fontSize: 20),
                  ),
                  Text(
                      "Attempted ${quizProvider.getAttemptedQuestions.length}/${quizProvider.getTotalNumberOfQuestions} Questions",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Text(
                    " Select Question number to jump to questions",
                  ),
                  const Text(
                      "PS: You can click on empty space above to close this")
                ],
              ),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Consumer<ExamProvider>(
              builder: (context, nquizProvider, child) {
                return ListView.builder(
                  itemCount: nquizProvider.getCategories.length,
                  itemBuilder: ((context, indexx) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 7.9),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: Colors.indigo)),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  nquizProvider.getCategories[indexx].title!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Sofia"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  // height: nquizProvider.getCategories[indexx]
                                  //             .questions!.length >
                                  //         9
                                  //     ? 80
                                  //     : 40,
                                  color: Colors.greenAccent,
                                  child: Wrap(
                                    children: List.generate(
                                      // 10,
                                      nquizProvider.getCategories[indexx]
                                          .questions!.length,
                                      (index) => InkWell(
                                        // onTap: onClick,
                                        onTap: () {
                                          nquizProvider
                                              .updateSetBorderAndSelected(
                                                  nquizProvider
                                                      .getCategories[indexx]
                                                      .title!,
                                                  (index).toString());

                                          nquizProvider.currentCategoryIndex =
                                              indexx;
                                          nquizProvider.currentSet =
                                              nquizProvider
                                                  .categories[indexx].title!;
                                          nquizProvider.currentQuestionNumber =
                                              nquizProvider
                                                  .dgetIndexForPages(indexx);

                                          if (nquizProvider.dgetIndexForPages(
                                                      indexx) +
                                                  index ==
                                              nquizProvider
                                                  .currentQuestionNumber) {
                                            // borderColor = Colors.green;
                                          }

                                          // onClick(indexx);
                                          nquizProvider.pageController
                                              .jumpToPage(index);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 8.0),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: nquizProvider.getOptionUtils[
                                                                nquizProvider
                                                                    .getCategories[
                                                                        indexx]
                                                                    .title]![
                                                            'isSelected']![index] ==
                                                        true
                                                    ? Colors.indigoAccent
                                                    : null,
                                                // color: Colors.red,
                                                border: Border.all(
                                                  color: nquizProvider
                                                                  .getBorderAndSelected[
                                                              nquizProvider
                                                                  .getCategories[
                                                                      indexx]
                                                                  .title]!['$index'] ==
                                                          true
                                                      ? Colors.red
                                                      : Colors.black,
                                                )
                                                // border: Border.all(
                                                //     color: nquizProvider
                                                //                     .getUtilsData()[
                                                //                 nquizProvider
                                                //                     .getCategories[
                                                //                         indexx]
                                                //                     .title]!['changeBorder']![index] ==
                                                //             true
                                                //         ? Colors.black
                                                //         : Colors.white,
                                                //     width: 2)
                                                ),
                                            child: Center(
                                              child: Text(
                                                (nquizProvider
                                                            .dgetIndexForPages(
                                                                indexx) +
                                                        index)
                                                    .toString(),
                                                style: TextStyle(
                                                  color: nquizProvider.getOptionUtils[
                                                                  nquizProvider
                                                                      .getCategories[
                                                                          indexx]
                                                                      .title]![
                                                              'isSelected']![index] ==
                                                          true
                                                      ? Colors.white
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
          Consumer<ExamProvider>(builder: (context, quizProvider, child) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      // TODO chnage it to 0.6
                      if (quizProvider.getAttemptedQuestions.length /
                              quizProvider.getTotalNumberOfQuestions <
                          0.0) {
                        //  show dialog saying you must attempt 60% questions
                        showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Center(child: Text("Submit")),
                                content: const Text(
                                    "You must attempt atleast 60% of the questions to submit the test. Please attempt more questions and then submit the test."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok")),
                                ],
                              )),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                content: const Text(
                                    "Are you sure you want to submit the test ? You caanot ondo this"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  Consumer<UtilsProvider>(
                                      builder: (context, utilsProvider, child) {
                                    return ElevatedButton(
                                        onPressed: () async {
                                          utilsProvider.stop();
                                     
                                          await QuizApi().sendData(
                                              quizProvider.getUserName,
                                              quizProvider.currentScore.length,
                                              1);

                                          if (!mounted) {}
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ScoreViewScreen()));
                                        },
                                        child: const Text("Submit"));
                                  })
                                ],
                              )),
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Sofia",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Sofia",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
