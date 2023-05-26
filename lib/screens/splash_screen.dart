import 'package:api_with_provider/screens/auth/login_screen.dart';
import 'package:api_with_provider/utils/color_utils.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorUtils().primaryColor,
          body: Center(child: const Text("HA Mock Exam"))),
    );
  }
}
