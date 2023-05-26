import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogged = false;
    bool obscureText = true;


  bool get getIsLogged => isLogged;
  setIslogin(bool status) {
    isLogged = status;
    notifyListeners();
  }

  changeValue() {
    obscureText = !obscureText;
    notifyListeners();
  }

 




}
