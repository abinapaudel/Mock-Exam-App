import 'package:flutter/material.dart';

class UtilFunctions {
  Color showColor(value) {

    if (value != null) {
      if (value['isCorrect'] == true) {
        return Colors.green;
      } else if (value['isCorrect'] == false) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
    return Colors.grey;
  }
}
