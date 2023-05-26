import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  const CustomButton({super.key, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Sofia",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
