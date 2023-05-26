// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class Syllabus extends StatefulWidget {
//   const Syllabus({super.key});

//   @override
//   State<Syllabus> createState() => _SyllabusState();
// }

// class _SyllabusState extends State<Syllabus> {
//   get path => null;

//   PageController _controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PDFView(
//         filePath: path,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: false,
//         onRender: (_pages) {
//           setState(() {
//             var pages = _pages;
//             var isReady = true;
//           });
//         },
//         onError: (error) {
//           print(error.toString());
//         },
//         onPageError: (page, error) {
//           print('$page: ${error.toString()}');
//         },
//         onViewCreated: (PDFViewController pdfViewController) {
//           _controller.complete(pdfViewController);
//         },
//         onPageChanged: (int page, int total) {
//           print('page change: $page/$total');
//         },
//       ),
//     );
//   }
// }
