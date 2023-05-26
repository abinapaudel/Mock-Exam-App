// import 'package:api_with_provider/services/category_services.dart';
// import 'package:flutter/cupertino.dart';

// import '../models/category_model.dart';

// class CategoryProvider extends ChangeNotifier {
//   CategoryProvider() {
//     setCategories();
//   }
//   List<Category> categories = [];
//   List<Category> get getCategories => categories;

//   void setCategories() async {
//     await CategoryServices().fetchCategories().then((value) {
//       categories = value;
//     });
//     notifyListeners();
//   }

//   void addCategory(String categoryName) async {
//     await CategoryServices().addCategory(categoryName);
//     notifyListeners();
//   }

//   void updateCategory(String id, String categoryName) async {
//     print(" id is $id");
//     print(" category Name $categoryName");
//     await CategoryServices().updateCategory(id, categoryName);
//     refreshCategories();
//   }

//   void deleteCategory(String id) async {
//     await CategoryServices().deleteCategory(id);
//     refreshCategories();
//   }

//   void refreshCategories() {
//     setCategories();
//     notifyListeners();
//   }

//   // void addCategory(Category category) async {
//   //   await CategoryServices().addCategory(category);
//   //   refreshCategories();
//   //   notifyListeners();
//   // }

//   void searchCategory(String search) {
//     categories = categories
//         .where(
//           (category) => category.name
//               .toString()
//               .toLowerCase()
//               .contains(search.toLowerCase()),
//         )
//         .toList();
//     notifyListeners();
//   }
// }
