import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfadi_uro/pages/Services/db_service.dart';

class AuthService {
  Future<String?> registration({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID (uid)
      String uid = userCredential.user!.uid;

      // Write user data to Firestore using uid
      DBService().addUser(uid, userName);

      return 'Success';
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      // Handle general errors
      return e.toString();
    }
  }

  Future<void> writeUserData(String uid, Map<String, dynamic> user) async {
    print(uid + user.toString());

    // Use set to store user data in the correct document
    await FirebaseFirestore.instance.collection('users').doc(uid).set(user);
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      // Handle specific authentication errors
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      // Handle general errors
      return e.toString();
    }
  }
}