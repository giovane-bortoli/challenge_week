import 'dart:developer';

import 'package:Challenge_App/controller/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ClientDatabase {
  final clientFirebase = FirebaseAuth.instance;

  Future<void> loginFirebase(
      {required String email, required String password}) async {
    try {
      final result = await clientFirebase.signInWithEmailAndPassword(
          email: email, password: password);
      inspect(result);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> forgotPasswordFirebase({required email}) async {
    await clientFirebase.sendPasswordResetEmail(email: email);
  }

  Future<void> logOutFirebase() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> firebaseAlreadyLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User? email) {
      if (email == null) {
        inspect('User is currently signed out!');
      } else {
        inspect('user is signed in');
      }
    });
  }
}
