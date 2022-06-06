import 'package:firebase_auth/firebase_auth.dart';

class ClientDatabase {
  final clientFirebase = FirebaseAuth.instance;

  Future<void> loginFirebase(
      {required String email, required String password}) async {
    try {
      await clientFirebase.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> logOutFirebase() async {
    FirebaseAuth.instance.signOut();
  }
}
