// import 'dart:html';

// import 'package:http/http.dart' as http;

// class ApiServices {
//   static final Url = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";
//   Future<String> loadPDF()   {
//     var response = await http.get(Uri.parse(Url));

//     var dir = await getTemporaryDirectory();
//     File file = new File(dir.path + '/data.pdf');

//     await file.writeAsBytes(response.bodyBytes, flush: true);
//     return file.path;
//   }
// }
