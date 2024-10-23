import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DBService {

  //Firebase Auth reference
  late FirebaseAuth auth;

  //DB Reference
  final currentUser = FirebaseAuth.instance;

  //DB Collection Reference
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  //Add User to "Users" Database
  Future<void> addUser(String userId, String userName,) async {
    await usersRef.doc(userId).set({
      'UserName': userName,
      'Perm': "user",
    })
        .then((value) => print("User added Successfully!"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //Get User Info from "Users" Database
  Future<void> fetchUsers() async {

    var uid = currentUser.currentUser!.uid.toString();

    //return usersRef.doc(uid).get()

  }

  Future<void> updateUserEmail(String userUid, String newEmail) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users.doc(userUid).update({'email': newEmail})
        .then((value) => print("User email updated successfully!"))
        .catchError((error) => print("Failed to update user email: $error"));
  }

  Future<void> deleteUser(String userUid) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users.doc(userUid).delete()
        .then((value) => print("User deleted successfully!"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

//https://medium.com/@samra.sajjad0001/getting-started-with-firebase-firestore-in-flutter-a-comprehensive-guide-with-crud-operations-ec75f2188355