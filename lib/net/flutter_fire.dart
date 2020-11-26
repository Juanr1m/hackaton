import 'package:cactus_jobs/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> register(String email, String password, String fullName) async {
  try {
    var _authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password);
    UserModel _user = UserModel(
      uid: _authResult.user.uid,
      email: _authResult.user.email,
      fullName: fullName.trim(),
      accountCreated: Timestamp.now(),
    );
    bool _isInFirebase = await createUser(_user);
    if (_isInFirebase) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('weak password');
    } else if (e.code == 'email-already-used') {
      print('email already used');
    }
    return false;
  } catch (e) {
    print(e.toString());
  }
  return false;
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> createUser(UserModel user) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'fullName': user.fullName.trim(),
      'email': user.email.trim(),
      'accountCreated': Timestamp.now(),
    });
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}
