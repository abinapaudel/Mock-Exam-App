import 'package:api_with_provider/utils/color_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGoogle;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isGoogle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: isGoogle == true ? Colors.black : ColorUtils().primaryColor,
          width: 2,
        ),
        color: isGoogle == true ? Colors.white : ColorUtils().primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      // color: isGoogle ? Colors.white : ColorUtils().primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isGoogle == true
              ? const Icon(
                  Icons.alarm,
                  color: Colors.black,
                  size: 20,
                )
              : const SizedBox(),
          Text(
            text,
            style: TextStyle(
              color: isGoogle == true ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
