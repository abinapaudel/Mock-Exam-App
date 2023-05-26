extension StringExtension on String {
  ///  extemsions are way to add extra functionality to existing libaries we add capitalize function in [String]
  /// for example .capitalize method is not available by default
  /// but we can add it using like this\
  /// now we can call somestring.capitalize()  Note: Must import this file where you use

  String capitalize() {
    String data = this;

    /// this means the string that we are going to capitalize came from [String] class

    List<String> strings = data.split(" ");

    /// .split will split the string wherever it finds one space " "

    List finalStrings = [];

    /// variable to store the capitalized string

    for (int i = 0; i < strings.length; i++) {
      String temp = strings[i]; // temp to store the splitted string temporarily
      String tempFirstLetter = temp[0].toUpperCase(); // capitalize first letter
      temp = temp.replaceRange(0, 1,
          tempFirstLetter); // replace the first letter of splitted string by capital word
      strings[i] = temp;
      finalStrings.add(strings[i]);
    }

    return finalStrings.join(" "); // join the splitted string on each space
  }
}
