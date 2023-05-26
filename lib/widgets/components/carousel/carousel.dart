import 'dart:async';

import 'package:api_with_provider/widgets/components/carousel/widgets/dot.dart';
import 'package:flutter/material.dart';

import '../../../datas/carousel_data.dart';


List<Widget> carouselItems = images
    .map((cimage) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cimage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ))
    .toList();

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  late Timer timer;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage < images.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    timer.cancel(); // dispose timer
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    List<Widget> dotlist() {
      List<Widget> list = [];

      for (int i = 0; i < images.length; i++) {
        list.add(i == selectedIndex ? Dot(isActive: true) : Dot(isActive: false));
      }
      return list;
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: carouselItems,
            onPageChanged: (int page) {
              setState(() {
                selectedIndex = page;
              });
            },
          ),

          //  Position the dot in the place you prefer by chnaging the top, bottom, left right values
          Positioned(bottom: 20, right: 150, child: Row(children: dotlist()))
        ],
      ),
    );
  }
}
