class Exam {
  int? id;
  String? title;
  String? description;
  List<Question>? questions;
  List<Category>? categories;
  Exam(
      {this.id, this.title, this.description, this.questions, this.categories});
  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
    if (json['category'] != null) {
      categories = <Category>[];

      // for (int i = 0; i < json['category'].length; i++) {
      //   categories!.add(Category.fromJson(json['category'][i]));
      // }
      json['category'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
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
  Exam? exam;
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
      this.exam,
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
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
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

class Category {
  //  id Int @id @default(autoincrement())
  // title String @db.VarChar(200)
  // questions Question[]
  // exam Quiz @relation(fields: [quiz_id], references: [id])
  // quiz_id Int

  int? id;
  String? title;
  List<Question>? questions;
  Exam? exam;
  int? quizId;

  Category({this.id, this.title, this.questions, this.exam, this.quizId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
    quizId = json['quiz_id'];
  }
}
