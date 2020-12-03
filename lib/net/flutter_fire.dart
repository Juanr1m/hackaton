import 'package:cactus_jobs/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

Future<bool> register(String email, String password, String fullName) async {
  try {
    var _authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password);
    UserModel _user = UserModel(
      uid: _authResult.user.uid,
      email: _authResult.user.email,
      fullName: fullName.trim(),
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

Future<bool> signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential _credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential _authResult =
        await FirebaseAuth.instance.signInWithCredential(_credential);
    UserModel _user = UserModel(
      uid: _authResult.user.uid,
      email: _authResult.user.email,
      fullName: _authResult.user.displayName,
    );
    bool _isInFirebase = await createUser(_user);
    if (_isInFirebase) {
      return true;
    }
  } catch (e) {
    print(e.toString());
  }
  return false;
  // final GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
  // final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount.authentication;

  // final AuthCredential _credential = GoogleAuthProvider.credential(
  //   accessToken: googleSignInAuthentication.accessToken,
  //   idToken: googleSignInAuthentication.idToken,
  // );
  // final UserCredential _authResult =
  //     await FirebaseAuth.instance.signInWithCredential(_credential);

  // if (_authResult.user != null) {
  //   UserModel _user = UserModel(
  //     uid: _authResult.user.uid,
  //     email: _authResult.user.email,
  //     fullName: _authResult.user.displayName,
  //     accountCreated: Timestamp.now(),
  //   );
  //   bool _isInFirebase = await createUser(_user);

  //   final User currentUser = FirebaseAuth.instance.currentUser;
  //   assert(_authResult.user.uid == currentUser.uid);

  //   print('signInWithGoogle succeeded: $_authResult.user');

  //   return '$_authResult.user';
  // }
  // return null;
}

void signOutGoogle() async {
  await GoogleSignIn().signOut();
  print("User Signed Out");
}

Future<bool> createUser(UserModel user) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'fullName': user.fullName.trim(),
      'email': user.email.trim(),
    });
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}
