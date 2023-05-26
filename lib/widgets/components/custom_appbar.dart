import 'package:flutter/material.dart';
import '../../utils/text_style_utils.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  const CustomAppBar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: kToolbarHeight + 20,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyleUtils.header,
        ),
      ),
    );
  }
}
