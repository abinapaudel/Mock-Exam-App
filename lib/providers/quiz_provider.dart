import 'package:api_with_provider/services/quiz_api_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/practice_quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  List<Category> quizSets = [];
  // make a getter
  List<Category> get getQuizSets => quizSets;

  // make a setter
  setQuizSets() async {
    print("set quiz sets called");
    quizSets = await CategoryServices().fetchCategories();

    print("Quiz sets are : $quizSets");
    notifyListeners();
  }
}
