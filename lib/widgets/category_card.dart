// import 'package:api_with_provider/providers/category_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CategoryCard extends StatelessWidget {
//   final String number;
//   final String name;
//   final String id;

//   const CategoryCard(
//       {super.key, required this.number, required this.name, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
//     return Container(height: 100,
//       decoration: BoxDecoration(gradient: LinearGradient(
//                                 begin: Alignment.topRight,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                 //  Colors.red,
//                                   Color.fromARGB(255, 172, 240, 197),
//                                   Color.fromARGB(255, 255, 255, 255)
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
        
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: Colors.blue,
//               child: Center(
//                 child: Text(number.toString()),
//               ),
//             ),
//           ),
//           // decorated text
//           Expanded(
//             flex: 6,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 16, 19, 21),
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Text(
//                   id,
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 16, 19, 21),
//                   ),
//                 ),
//               ],
//             ),
//           ),

         
//           Expanded(
//             flex: 1,
//             child: IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: ((context) {
//                         TextEditingController nameController =
//                             TextEditingController();
//                         nameController.text = name;
//                         return AlertDialog(
//                           title: const Text("Edit Category"),
//                           content: TextField(
//                             controller: nameController,
//                             onChanged: (value) {
//                               // categoryProvider.changeName(value);
//                             },
//                           ),
//                           actions: [
//                             TextButton(
//                                 onPressed: () {
//                                   categoryProvider.updateCategory(
//                                       id, nameController.text);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text("Update"))
//                           ],
//                         );
//                       }));
//                 },
//                 icon: Icon(
//                   Icons.edit,
//                   color: Colors.blue,
//                 )),
//           ),
//            Expanded(
//             flex: 1,
//             child: IconButton(
//                 onPressed: () {
//                   categoryProvider.deleteCategory(id);
//                 },
//                 icon: Icon(
//                   Icons.delete,
//                   color: Colors.red,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
