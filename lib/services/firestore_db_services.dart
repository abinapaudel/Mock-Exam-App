import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/app_user_model.dart';


class DatabaseServices {
  FirebaseFirestore database = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(AppUser haUser) async {
    await users.doc(haUser.uid).set(haUser.userToMap());
  }

  Future<void> updateUser(
    AppUser haUser,
  ) async {
    await users
        .doc(haUser.uid)
        .update(
          haUser.userToMap(),
        )
        .then((_) => print("User Updated"));
  }


  getUserData(String userId) async {
    var data = await users.doc(userId).get();
    return data.data() as Map;
  }

}
