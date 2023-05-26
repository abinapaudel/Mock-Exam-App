import 'dart:convert';
import '../models/practice_quiz_model.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static String baseUrl = "https://secret-reaches-08912.herokuapp.com/";

  Future<List<Category>> fetchCategories() async {
    print("fetch categproies caleld");
    var response = await http.get(Uri.parse("${baseUrl}category"));

    List<Category> categories = [];
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var json = jsonDecode(jsonString);
      print("This is print of category $json");

      for (var item in json['categorys']) {
        categories.add(Category.fromJson(item));
      }
      return categories;
    } else {
      return categories;
    }
  }

  Future<bool> addCategory(String categoryName) async {
    var url = Uri.parse(
      baseUrl + "quiz-category",
    );
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': categoryName,
        }));

    if (response.statusCode == 201) {
      print("Category added");
      return true;
    } else {
      print("Category not added");
      return false;
    }
  }

  Future<bool> updateCategory(String id, String categoryName) async {
    var url = Uri.parse(
      baseUrl + "quiz-category/$id",
    );
    var response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': categoryName,
        }));

    print(response.statusCode);

    if (response.statusCode == 200) {
      print("Category updated");
      return true;
    } else {
      print("Category not updated");
      return false;
    }
  }

  Future<bool> deleteCategory(String id) async {
    var url = Uri.parse(
      baseUrl + "quiz-category/$id",
    );
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      print("Category deleted");
      return true;
    } else {
      print("Category not deleted");
      return false;
    }
  }
}
