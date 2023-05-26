import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var hh = media.size.height;
    var ww = media.size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: media.size.height * 1,
            width: media.size.width * 1,
            color: Colors.white,
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: ww * .85, top: hh * 0.07),
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    height: 30,
                  ),
                ),
              ),
              //                                                                                        Hello there and wave svg
              Padding(
                padding: EdgeInsets.only(left: ww * .05, top: hh * 0.05),
                child: Row(
                  children: [
                    Text(
                      'Forgot Password ',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ww * .01),
                      child: SvgPicture.asset(
                        'assets/icons/key.svg',
                        color: Color(0xFFFDCD4A),
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: hh * 0.03),
                child: Container(
                  width: ww * 0.9,
                  height: hh * 0.01,
                  child: Wrap(
                    children: [
                      Text(
                          'Enter your email address to get an OTP code to reset your password')
                    ],
                  ),
                ),
              ),

              ///                                                                                             Email
              Padding(
                padding: EdgeInsets.only(top: hh * 0.07),
                child: Container(
                  height: hh * 0.15,
                  width: ww * 0.9,
                  // color: Colors.red,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(right: ww * 0.7),
                      child: Text(
                        'Email',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: hh * 0.03, left: ww * 0.01),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle()),
                      ),
                    )
                  ]),
                ),
              ),
//                                                                                                Password field

//                                                                                    Remember Me

              InkWell(
                onTap: () async {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);

                    Fluttertoast.showToast(
                        msg: "Passowrd reset procedure is sent to your email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    // show a flutter toast

                    // Show a success message
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "Error occured!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    // Show an error message
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(top: hh * 0.4, left: ww * 0.05),
                    child: Container(
                      height: hh * 0.07,
                      width: ww * 0.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFB19E90),
                              Color.fromARGB(255, 218, 213, 213)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text("CONTINUE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    )),
              )
            ]),
          )
        ],
      )),
    );
  }
}
