import 'package:api_with_provider/providers/mock_exma_provider.dart';
import 'package:api_with_provider/screens/home_page.dart';
import 'package:api_with_provider/screens/mock%20Test/tabbar_demo.dart';
import 'package:api_with_provider/screens/test_screen.dart';
import 'package:api_with_provider/screens/video_page.dart';
import 'package:api_with_provider/widgets/components/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int selectedIndex = 0;
  late ExamProvider examProvider;
  late QuizProvider quizProvider;
  bool _hasBeenCalled = false;

  List bottomIcon = [
    HomePage(),
    CustomTabBar(),

    // KhaltiPayment(),
    VideoHome(),

    TestScreen(),

    // Center(child: Text("page6")),
  ];

  @override
  void didChangeDependencies() {
    if (!_hasBeenCalled) {
      examProvider = Provider.of<ExamProvider>(context);
      quizProvider = Provider.of<QuizProvider>(context);

      examProvider.setQuiz();
      print("aba tw call hunw parni ho");
      quizProvider.setQuizSets();
      _hasBeenCalled = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          // appBar: AppBar(
          //   title: Center(child: Text("Mock Test")),
          // ),
          // backgroundColor: Colors.amber,

          body: bottomIcon.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.indigo,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/note.svg"),
                  label: "Mock Exam"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_file), label: "Videos"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/events.svg"),
                  label: "News"),
              // BottomNavigationBarItem(
              //     icon: SvgPicture.asset("assets/icons/events.svg"),
              //     label: "News"),
            ],
          )
          // bottomNavigationBar: CurvedNavigationBar(
          //   // backgroundColor: Colors.blueAccent,
          //   // buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          //   items: [
          //     Icon(
          //       Icons.home,
          //       size: 30,
          //     ),
          //     SvgPicture.asset("assets/icons/books.svg"),
          //     SvgPicture.asset("assets/icons/people.svg"),
          //     SvgPicture.asset("assets/icons/note.svg"),
          //     // SvgPicture.asset("assets/icons/events.svg"),
          //   ],

          //   onTap: changedIndex,
          // ),
          ),
    );
  }
}
