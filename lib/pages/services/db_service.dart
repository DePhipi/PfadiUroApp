import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class DBService {

  //Firebase Auth reference
  late FirebaseAuth auth;

  //DB Reference


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
  static Future<String> fetchUsers() async{

    final currentUser = FirebaseAuth.instance;
    var uid = currentUser.currentUser!.uid.toString();

    if (currentUser.currentUser != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        print("Document Found");
        return doc['UserName'] as String;
      } else {
        throw Exception("Document not existing");
      }
    }

    return "null";
  }



  Future<void> updateUserEmail(String userUid, String newEmail) {
    return usersRef.doc(userUid).update({'email': newEmail})
        .then((value) => print("User email updated successfully!"))
        .catchError((error) => print("Failed to update user email: $error"));
  }

  Future<void> deleteUser(String userUid) {
    return usersRef.doc(userUid).delete()
        .then((value) => print("User deleted successfully!"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

//https://firebase.flutter.dev/docs/database/read-and-write/
//https://medium.com/@samra.sajjad0001/getting-started-with-firebase-firestore-in-flutter-a-comprehensive-guide-with-crud-operations-ec75f2188355