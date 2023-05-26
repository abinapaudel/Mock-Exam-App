import 'package:api_with_provider/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => RegisterScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/images/$assetName.svg', width: 350.0),
      // child: SvgImage.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontFamily: "Quando",
      fontSize: 17.0,
    );
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
        fontFamily: "Alike",
        fontSize: 26.0,
        fontWeight: FontWeight.w500,
      ),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Your Guide for HA License Exam Preparation ",
          body:
              "HA Preparation app is full of material and resources that can help you to clear your license exam",
          image: _buildImage('introduction'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Practice sets",
          body:
              "We have lots of unitwise  practice sets according to the syllabus of Health Assistance ",
          image: _buildImage('practice'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Mock Exam",
          body:
              "Attend multiple sets of mock exam to build confidence for the exams.",
          image: _buildImage('exam'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Notice and News",
          body:
              "You can find the latest notifications and news in the app as soon as they are published",
          image: _buildImage('news'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Study Notes ",
          body: "Surf the important notes created by fellow aspirants",
          image: _buildImage('note'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Watch Videos",
          body:
              "Watch the selected must imporatnt videos online. Lets get started",
          image: _buildImage('video'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      // skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      done: const Text(
        'Start',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF4ea685),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(7, 7),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFF090C22),
        activeSize: Size(16.0, 7.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
