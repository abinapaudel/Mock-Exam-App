import 'package:api_with_provider/screens/mock%20Test/mocktest_attempted.dart';
import 'package:api_with_provider/screens/mock%20Test/mock_test_home.dart';
import 'package:api_with_provider/widgets/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: CustomAppBar(text: "Mock Exam")),
            Expanded(
              child: TabBar(
                  // labelColor: Colors.blue,
                  // indicatorColor: Colors.blue,
                  // unselectedLabelColor: ,
                  indicator: BoxDecoration(color: Colors.blueAccent),
                  tabs: [
                    Tab(
                      child: Text(
                        'Unattempted Questions',
                        style: TextStyle(color: Colors.black),
                      ),
                      // text: 'Attempted Questions',
                      // icon: Icon(Icons.home),
                    ),
                    Tab(
                      child: Text(
                        'Attempted Question',
                        style: TextStyle(color: Colors.black),
                      ),
                      // text: 'Attempted Questions',
                      // icon: Icon(Icons.home),
                    ),
                  ]),
            ),
            Expanded(
              flex: 13,
              child: TabBarView(children: [MockTest(), MockTestAttempted()]),
            ),
          ],
        ),
      ),
    );
  }
}
