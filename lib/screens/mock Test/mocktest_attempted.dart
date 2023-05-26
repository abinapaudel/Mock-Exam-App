import 'package:flutter/material.dart';

class MockTestAttempted extends StatelessWidget {
  const MockTestAttempted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: Container()),
        Expanded(
          child: Image(
            image: AssetImage('assets/images/nothing.jpg'),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'Opps!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Looks like we dont't have them.")
              ],
            ))
      ]),
    );
  }
}
