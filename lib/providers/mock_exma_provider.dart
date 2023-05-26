import 'package:api_with_provider/services/exam_api_service.dart';
import 'package:flutter/material.dart';
import '../models/mock_exam_quiz_model.dart';

class ExamProvider extends ChangeNotifier {
  String userName = '';
  String currentSet = '';
  int currentQuestionNumber = 1;
  List<Exam> quizs = [];
  List<Category> categories = [];
  Map<String, Map<String, bool>> borderAndSelected = {};

  Map<String, Map<String, List<dynamic>>> optionUtils = {};
  PageController pageController = PageController();
  int currentPageNumber = 0;
  int currentCategoryIndex = 0;
  Set attemptedQuestions = {};
  int totalNumberOfQuestions = 100;
  Set currentScore = {};
  Map<String, Map<String, dynamic>> userSelectedAnswer = {};

  // getters
  String get getUserName => userName;
  List<Exam> get getQuizs => quizs;
  List<Category> get getCategories => categories;
  PageController get getPageController => pageController;
  int get getCurrentQuestionNumber => currentQuestionNumber;
  int get getCurrentPageNumber => currentPageNumber;
  int get getCurrentCategoryIndex => currentCategoryIndex;
  Set get getAttemptedQuestions => attemptedQuestions;
  int get getTotalNumberOfQuestions => totalNumberOfQuestions;
  Set get getCurrentScore => currentScore;
  Map<String, Map<String, bool>> get getBorderAndSelected => borderAndSelected;
  Map<String, Map<String, List<dynamic>>> get getOptionUtils => optionUtils;

  void setQuiz() async {
    quizs = await QuizApi().getData();
    notifyListeners();
  }

  // set username
  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  setInitialSelectedAnswer() {
    for (int i = 0; i < categories.length; i++) {
      Map<String, dynamic> myUserSelectedAnswer = {};
      for (int j = 0; j < categories[i].questions!.length; j++) {
        myUserSelectedAnswer[j.toString()] = {
          'answer': "",
          'isCorrect': null,
        };
      }
      userSelectedAnswer[categories[i].title!] = myUserSelectedAnswer;
    }
  }

  void updateUserSelectedAnswer(
      String category, String qsnIndex, String option, bool isCorrect) {
    userSelectedAnswer[category]![qsnIndex] = {
      'answer': option,
      'isCorrect': isCorrect,
    };

    // print(userSelectedAnswer);
    notifyListeners();
  }

  setTotalNumberOfQuestions(int questionCount) {
    totalNumberOfQuestions = questionCount;
    notifyListeners();
  }

  void addToAttemptedQuestions(String question) {
    attemptedQuestions.add(question);
    notifyListeners();
  }

  void answerChecker(
    String category,
    String question,
    String option,
    String answer,
    String qsnIndex,
  ) {
    // print(qsnIndex);

    if (option == answer) {
      currentScore.add(question);
      updateUserSelectedAnswer(category, qsnIndex, option, true);

      // print(" Correct answer");
    } else {
      updateUserSelectedAnswer(category, qsnIndex, option, false);

      for (int i = 0; i < currentScore.length; i++) {
        if (currentScore.elementAt(i) == question) {
          currentScore.remove(question);
        }
      }
      // print(" Wrong answer");
    }
  }

  void setBorderAndSelected() {
    Map<String, Map<String, bool>> myborderAndSelected = {};
    for (int i = 0; i < categories.length; i++) {
      Map<String, bool> myOptionUtilss = {};
      for (int j = 0; j < categories[i].questions!.length; j++) {
        myOptionUtilss[j.toString()] = false;
      }
      myborderAndSelected[categories[i].title!] = myOptionUtilss;
    }
    borderAndSelected = myborderAndSelected;
    notifyListeners();
  }

  void updateSetBorderAndSelected(String category, String question) {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].title == category) {
        for (int j = 0; j < categories[i].questions!.length; j++) {
          if (j.toString() == question) {
            borderAndSelected[category]![question] = true;
          } else {
            borderAndSelected[category]![j.toString()] = false;
          }
        }
      }
      for (int k = 0; k < categories.length; k++) {
        if (categories[k].title != category) {
          for (int l = 0; l < categories[k].questions!.length; l++) {
            borderAndSelected[categories[k].title!]![l.toString()] = false;
          }
        }
      }
    }

    borderAndSelected = borderAndSelected;
    // print(borderAndSelected);

    notifyListeners();
  }

  int dgetIndexForPages(int currentIndex) {
    num myindex = 1;
    int index = currentIndex + 1;
    for (int i = 0; i < index - 1; i++) {
      myindex = myindex + categories[i].questions!.length;
      // print("my index is ${myindex.toString()}");
    }

    return myindex.toInt();
  }

  // setter for quizs

  void setCategory(List<Category> value) {
    categories = value;
    currentSet = value[0].title!;
    notifyListeners();
  }

  void setCategoryForQuiz(Exam quiz) {
    List<Category> myCategories = [];
    for (int i = 0; i < quiz.categories!.length; i++) {
      myCategories.add(quiz.categories![i]);
    }
  }

  void getinitialoptionUtils() {
    Map<String, Map<String, List>> myOptionUtils = {};
    for (int i = 0; i < getCategories.length; i++) {
      myOptionUtils['${getCategories[i].title}'] = {
        'isSelected': List.filled(getCategories[i].questions!.length, false),
        'selectedOption': List.filled(getCategories[i].questions!.length, null),
      };
    }
    optionUtils = myOptionUtils;

    notifyListeners();
  }

  void updateInitialOptionUtils(
    String category,
    int qsnIndex,
    int selectedOptionIndex,
  ) {
    optionUtils[category]!['isSelected']![qsnIndex] = true;
    optionUtils[category]!['selectedOption']![qsnIndex] = selectedOptionIndex;
    notifyListeners();
  }
}
