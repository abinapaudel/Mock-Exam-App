import 'package:api_with_provider/screens/auth/login_screen.dart';
import 'package:api_with_provider/services/auth_services.dart';
import 'package:api_with_provider/widgets/register_custom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../initial_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> Register() async {
    try {
      await AuthServices()
          .signUp(emailController.text, passwordController.text, fullNameController.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  bool isChecked = false;
  bool isLoggedIn = false;
  Map userObj = {};
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: CoffeeClipper(),
            child: Container(
              height: hh * 0.2,
              width: ww * 1,
              // color: Color(0xFFB19E90),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/mocktest.jpg'))),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('assets\images\coffee.jpg'))),
            ),
          ),
          Container(
            height: hh * 0.65,
            width: ww * 1,
            color: Colors.white,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: hh * 0.01, right: 0.1),
                    child: Text(
                      "Register here",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                  RegisterCustom(
                    nameController: fullNameController,
                    name: 'Enter your name',
                    lable: 'Name',
                  ),
                  RegisterCustom(
                    nameController: emailController,
                    name: 'Enter your email',
                    lable: 'Email',
                  ),
                  RegisterCustom(
                    nameController: passwordController,
                    name: 'Enter your password',
                    lable: ' Password',
                  ),
                  RegisterCustom(
                    nameController: passwordController,
                    name: 'Enter your password',
                    lable: 'Confirm Password',
                  ),

                  
                  InkWell(
                    onTap: () async {
                      try {
                        await AuthServices().signUp(
                            emailController.text, passwordController.text, fullNameController.text);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));

                        
                      } on FirebaseException catch (e) {
                        print(e);
                      }
                      // await AuthServices()
                      //     .signUp(_emailController.text, _passwordController.text);
                      // await Register().then((value) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Register Sucessfully')));

                      // });

                      if (errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage!)));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: hh * 0.06),
                      child: Container(
                        height: hh * 0.08,
                        width: ww * 0.7,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFB19E90),
                                Color.fromARGB(255, 218, 213, 213)
                              ],
                            ),
                            // color: Colors.indigo,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: hh * 0.12),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: hh * 0.02),
                          child: Text(
                            "Already have Account? ",
                            style: TextStyle(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: hh * 0.02),
                            child: Text(
                              "Sign In!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          ClipPath(
            clipper: CoffeeDownClipper(),
            child: Container(
              height: hh * 0.15,
              width: ww * 1,
              // color: Color(0xFFB19E90),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/mocktest.jpg'))),
            ),
          )
        ]),
      ),
    );
  }
}

class AppBarBorder {}

class CoffeeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.2,
        size.width * 0.01, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.7,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.4,
        size.width * 0.8, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.9, size.height, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CoffeeDownClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.9, size.height);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.5,
        size.width * 0.41, size.height * 0.74);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.85,
        size.width * 0.19, size.height * 0.7);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
