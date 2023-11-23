import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daraz_idea_firebase/constants/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Text Controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  /// Login Method

  Future<UserCredential?> loginMethod({
    context,
  }) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  /// Register Method
  Future<UserCredential?> registerMethod({
    email,
    password,
    context,
  }) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  /// Store User Data
  storeUserData({
    name,
    email,
    password,
  }) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);

    store.set({
      'name': name,
      'email': email,
      'password': password,
      'photoUrl': '',
    });
  }

  /// Logout Method
  logoutMethod(
    context,
  ) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
