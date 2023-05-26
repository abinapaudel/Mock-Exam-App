import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String? categoryName;
  final Color? categoryColor;
  final VoidCallback? onPressed;
  const CategoryButton(
      {super.key, this.categoryColor, this.categoryName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
              child: Text(
            categoryName!,
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: categoryColor!,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
