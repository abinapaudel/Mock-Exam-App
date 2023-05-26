
//  This is for quiz practice
class Category {

  int? id;
  String? title;
  List<Question>? questions;
  int? quizId;

  Category({this.id, this.title, this.questions,  this.quizId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
    quizId = json['quiz_id'];
  }
}

class Question {
  int? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? answer;
  int? quizId;
  Category? category;
  int? categoryId;

  Question(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.answer,
      this.quizId,
      this.category,
      this.categoryId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    answer = json['answer'];
    quizId = json['quiz_id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    categoryId = json['category_id'];
  }

  // question to map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'answer': answer,
      'quiz_id': quizId,
      'category_id': categoryId,
    };
    return map;
  }
}