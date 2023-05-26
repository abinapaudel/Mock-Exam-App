import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/mock_exam_quiz_model.dart';

class QuizApi {
  String baseUrl = "https://secret-reaches-08912.herokuapp.com/";

  Future<List<Exam>> getData() async {
    List<Exam> quizs = [];
    try {
      var response = await http.get(Uri.parse(baseUrl + "quiz"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData["quizs"];
        for (var quizSets in data) {
          Exam quiz = Exam.fromJson(quizSets);
          quizs.add(quiz);
        }
        // Quiz quiz = Quiz.fromJson(jsonData["quizs"][0]);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in QuizApi.getData()");
        print(e.toString());
      }
    }

    print(quizs);

    return quizs;
  }

  Future<void> sendData(String name, int marks, int quizId) async {
    try {
      final response =
          await http.post(Uri.parse('https://quiz4dost.up.railway.app/result'),
              // headers

              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(
                <String, dynamic>{
                  'name': name,
                  'marks': marks,
                  'quiz_id': quizId,
                },
              ));

      if (response.statusCode == 200) {}
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
