import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_planner/pages/forms/login.dart';
import '../models/response.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final User? user = _auth.currentUser;
String userUid = '';

Future getCurrentUser() async {
  return user;
}

Future<void> editUser(namaUser, emailUser) async {
  final thisUser = FirebaseAuth.instance.currentUser;
  if (thisUser != null) {
    final name = thisUser.displayName;
    final email = thisUser.email;
    final uid = thisUser.uid;
    await thisUser.updateDisplayName(namaUser);
    await thisUser.updateEmail(emailUser);

     DocumentReference documentReferencer =
      _firestore.collection('Users').doc(uid);

  Map<String, dynamic> data = <String, dynamic>{
    "nama": namaUser,
    "email": emailUser,
  };

  await documentReferencer.update(data);
  }
}

Future<SignInSignUpResult> createUser(
    {required String email, required String pass}) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

Future<SignInSignUpResult> signInWithEmail(
    {required String email, required String pass}) async {
  await Firebase.initializeApp();
  try {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    userUid = result.user!.uid;
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

void signOut() {
  _auth.signOut();
  userUid = '';

}

class SignInSignUpResult {
  final User? user;
  final String? message;
  SignInSignUpResult({this.user, this.message});
}

Future<Response> addUser({
  required String idUser,
  required String nama,
  required String email,
}) async {
  Response response = Response();
  DocumentReference documentReferencer =
      _firestore.collection('Users').doc(idUser);

  Map<String, dynamic> data = <String, dynamic>{
    "nama": nama,
    "email": email,
  };

  var result = await documentReferencer.set(data).whenComplete(() {
    response.code = 200;
    response.message = "Sucessfully added to the database";
  }).catchError((e) {
    response.code = 500;
    response.message = e;
  });

  return response;
}
