import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/mock_exma_provider.dart';
import '../../providers/utils_provider.dart';
import '../../utils/utils_functions.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/components/custom_appbar.dart';
import 'answer_view.dart';

class ScoreViewScreen extends StatelessWidget {
  const ScoreViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomButton(
          buttonText: "View Solutions",
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AnswerView()));
            // Navigator.pop(context);
          },
        ),
        body: Consumer<ExamProvider>(builder: (context, quizProvider, child) {
          return Column(
            children: [
              const CustomAppBar(text: "Mock Test Result"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "HA Mock Test -1 Result",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo,
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                const AssetImage("assets/images/dotc.png"),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    quizProvider.currentScore.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    quizProvider.totalNumberOfQuestions
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo,
                            backgroundImage:
                                const AssetImage("assets/images/time.png"),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Time",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Consumer<UtilsProvider>(builder:
                                        (context, utilsProvider, child) {
                                      utilsProvider.stop();
                                      String hours = utilsProvider
                                          .duration.inHours
                                          .toString()
                                          .padLeft(2, '0');
                                      String minutes = utilsProvider
                                          .duration.inMinutes
                                          .remainder(60)
                                          .toString()
                                          .padLeft(2, '0');
                                      String seconds = utilsProvider
                                          .duration.inSeconds
                                          .remainder(60)
                                          .toString()
                                          .padLeft(2, '0');
                                      return Text(
                                        "$hours:$minutes:$seconds",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      );
                                    })
                                  ]),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset(
                            "assets/images/check.svg",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                            "${quizProvider.attemptedQuestions.length} Attempted"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Correct: ${quizProvider.currentScore.length}",
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),
                        Text(
                          "${quizProvider.currentScore.length} Marks",
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Incorrect: ${quizProvider.totalNumberOfQuestions - quizProvider.currentScore.length}",
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        const Text(
                          "-0 marks",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset(
                            "assets/images/uncheck.svg",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                            "${quizProvider.totalNumberOfQuestions - quizProvider.attemptedQuestions.length} Unattempted"),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: quizProvider.getCategories.length,
                  itemBuilder: ((context, indexx) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 7.9),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
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
                                  quizProvider.getCategories[indexx].title!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Sofia"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  // height: quizProvider.getCategories[indexx]
                                  //             .questions!.length >
                                  //         9
                                  //     ? 80
                                  //     : 40,
                                  color: Colors.indigoAccent,
                                  child: Wrap(
                                    children: List.generate(
                                      // 10,
                                      quizProvider.getCategories[indexx]
                                          .questions!.length,
                                      (index) => InkWell(
                                        // onTap: onClick,
                                        onTap: () {
                                          quizProvider
                                              .updateSetBorderAndSelected(
                                                  quizProvider
                                                      .getCategories[indexx]
                                                      .title!,
                                                  (index).toString());

                                          quizProvider.currentCategoryIndex =
                                              indexx;
                                          quizProvider.currentSet = quizProvider
                                              .categories[indexx].title!;
                                          quizProvider.currentQuestionNumber =
                                              quizProvider
                                                  .dgetIndexForPages(indexx);

                                          if (quizProvider.dgetIndexForPages(
                                                      indexx) +
                                                  index ==
                                              quizProvider
                                                  .currentQuestionNumber) {
                                            // borderColor = Colors.green;
                                          }

                                          // onClick(indexx);
                                          // quizProvider.pageController
                                          //     .jumpToPage(index);
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
                                                // color: quizProvider.getOptionUtils[quizProvider.getCategories[indexx].title]!['isSelected']![
                                                //             index] ==
                                                //         true
                                                //     ? Colors
                                                //         .indigoAccent
                                                //     : null,
                                                color: UtilFunctions()
                                                    .showColor(quizProvider
                                                            .userSelectedAnswer[
                                                        quizProvider
                                                            .getCategories[
                                                                indexx]
                                                            .title!]![index
                                                        .toString()]),
                                                border: Border.all(
                                                  color: quizProvider
                                                                  .getBorderAndSelected[
                                                              quizProvider
                                                                  .getCategories[
                                                                      indexx]
                                                                  .title]!['$index'] ==
                                                          true
                                                      ? Colors.red
                                                      : Colors.black,
                                                )
                                                // border: Border.all(
                                                //     color: quizProvider
                                                //                     .getUtilsData()[
                                                //                 quizProvider
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
                                                (quizProvider.dgetIndexForPages(
                                                            indexx) +
                                                        index)
                                                    .toString(),
                                                style: TextStyle(
                                                  color: quizProvider.getOptionUtils[
                                                                  quizProvider
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
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
