class TextUtils {

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
//  To get something like SG for Sagar Gurung
// for profile picture if user do not add image
  static String getFirstWords(String name) {
    List<String> fullName = name.split(' ');
    List<String> finalString = [];

    for (int i = 0; i < fullName.length; i++){
      String temp = fullName[i];
      finalString.add(temp[0].toUpperCase());
    }
     return finalString.join(" ");
  }
}
