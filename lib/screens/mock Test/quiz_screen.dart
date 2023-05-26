import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../models/mock_exam_quiz_model.dart';
import '../../providers/mock_exma_provider.dart';
import '../../providers/utils_provider.dart';
import '../../utils/text_style_utils.dart';
import '../../widgets/components/modals/answer_bottom_modal.dart';
import '../../widgets/components/pageview/qna_page.dart';

class QuizScreen extends StatefulWidget {
  final int quizIndex;
  final List<Category>? categories;
  const QuizScreen(
    this.quizIndex, {
    Key? key,
    this.categories,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  double width = 0.1;
  Color borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    UtilsProvider utilsProvider =
        Provider.of<UtilsProvider>(context, listen: true);

    ExamProvider quizProvider =
        Provider.of<ExamProvider>(context, listen: true);

    utilsProvider.start();
    String hours = utilsProvider.duration.inHours.toString().padLeft(2, '0');
    String minutes = utilsProvider.duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String seconds = utilsProvider.duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    // print(quizProvider.getBorderAndSelected);

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
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          // focusColor: Colors.indigoAccent,
                          // highlightColor: Colors.indigoAccent,
                          onTap: () {
                            quizProvider.getPageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios,
                                ),
                                Text("Previous")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 40,
                              width: 1,
                              color: Colors.grey,
                            ),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const AnswerModalSheet();
                                        // return StatefulBuilder(builder: ((context, setsState) {
                                        //   return AnswerModalSheet();
                                        // }

                                        // ));
                                      });
                                },
                                child: SvgPicture.asset(
                                  "assets/images/grid.svg",
                                  color: const Color.fromARGB(255, 97, 89, 89),
                                  height: 30,
                                  width: 30,
                                )),
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 40,
                              width: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            quizProvider.getPageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Next  "),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 0),
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: kToolbarHeight + 20,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const JsonText()));
                        },
                        child: RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: (quizProvider.currentPageNumber +
                                          quizProvider.getCurrentQuestionNumber)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25)),
                              const TextSpan(text: " Of  "),
                              TextSpan(
                                  text: quizProvider.getQuizs[widget.quizIndex]
                                      .questions!.length
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ])),
                      ),
                      const Text(
                        "Mock Test Exam",
                        style: TextStyleUtils.header,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.punch_clock,
                            color: Colors.black,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("$hours:$minutes:$seconds",
                                style: TextStyleUtils.title),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ListView.builder(
                      itemCount: quizProvider.getCategories.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            quizProvider.currentCategoryIndex = index;
                            quizProvider.currentSet =
                                quizProvider.categories[index].title!;
                            quizProvider.getPageController.jumpTo(0);
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
                                          quizProvider.categories[index].title!
                                      ? Colors.red
                                      : Colors.indigo,
                                  width: 2),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                QuestionView(
                  iQController: quizProvider.getPageController,
                  currentPageNumber: quizProvider.currentPageNumber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
