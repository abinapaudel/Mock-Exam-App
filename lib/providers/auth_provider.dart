

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {


  final FirebaseAuth _auth;
  AuthProvider(this._auth);
  User get user => _auth.currentUser!;
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();


}