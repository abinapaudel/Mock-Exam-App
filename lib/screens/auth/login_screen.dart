import 'package:api_with_provider/providers/login_provider.dart';
import 'package:api_with_provider/screens/auth/forgot_password.dart';
import 'package:api_with_provider/screens/auth/register_screen.dart';

import 'package:api_with_provider/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> login() async {
    try {
      await AuthServices()
          .signIn(emailController.text, passwordController.text);
    } on FirebaseAuthException catch (e) {
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
    return Scaffold(body: Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return SingleChildScrollView(
          child: Column(children: [
            ClipPath(
              clipper: CoffeeClipper(),
              child: Container(
                height: hh * 0.15,
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
              height: hh * 0.71,
              width: ww * 1,
              color: Colors.white,
              child: Column(children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back !",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35)),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: hh * 0.05),
                  child: SizedBox(
                    height: hh * 0.1,
                    width: ww * 0.8,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter you name',
                          label: Text("Username")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hh * 0.01),
                  child: SizedBox(
                    height: hh * 0.1,
                    width: ww * 0.8,
                    child: TextField(
                      controller: passwordController,
                      obscureText: loginProvider.obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Your Password',
                        label: Text("Password"),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginProvider.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color.fromARGB(255, 86, 55, 19),
                          ),
                          onPressed: () {
                            loginProvider.changeValue();
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///                                                                           remeber me
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: ww * 0.08),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: ww * 0.001),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Color(0xFFB19E90),
                              ),
                              child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Color(0xFFB19E90),
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                            ),
                          ),
                          Text('Remember me',
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ForgotScreen();
                          },
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: ww * 0.12),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    await login();

                    if (errorMessage != null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(errorMessage!)));
                    } else {
                      loginProvider.setIslogin(true);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("login Successfully")));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: hh * 0.02),
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
                          "LOGIN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hh * 0.02, left: ww * 0.17),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: hh * 0.001,
                        width: ww * 0.2,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Or Login With"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Container(
                          height: hh * 0.001,
                          width: ww * 0.2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                //                                                              Login WIth Svg facebook, google ans so one

                Padding(
                  padding: EdgeInsets.only(left: ww * 0.2, top: hh * 0.01),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: ww * 0.1),
                        child: SvgPicture.asset(
                          'assets/icons/facebook.svg',
                          height: hh * 0.04,
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          AuthServices().logininwithgoogle();
                          if (errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage!)));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Google login Successfully")));
                          }
                        }),
                        child: Padding(
                          padding: EdgeInsets.only(left: ww * 0.05),
                          child: SvgPicture.asset(
                            'assets/icons/gmail.svg',
                            height: hh * 0.04,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ww * 0.05),
                        child: SvgPicture.asset(
                          'assets/icons/apple.svg',
                          height: hh * 0.05,
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: hh * 0.02),
                      child: Text(
                        "Dont have Account? ",
                        style: TextStyle(),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegisterScreen();
                          },
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: hh * 0.02),
                        child: Text(
                          "Sign up!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
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
        );
      },
    ));
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

    // path.lineTo(size.width, 0);
    // path.lineTo(0, size.height );

    // path.lineTo(size.width * 0.8, size.height);
    // path.quadraticBezierTo(size.width * 0.6, size.height * 0.6,
    //     size.width * 0.3, size.height * 0.3);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
