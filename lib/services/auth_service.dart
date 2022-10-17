import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<SignInSignUpResult> createUser({ required String email, required String pass}) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);

    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

Future<SignInSignUpResult> signInWithEmail({required String email, required String pass}) async {
  await Firebase.initializeApp();
  try {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}

void signOut() {
  _auth.signOut();
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
        _firestore.collection('Users').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "uid": idUser,
      "nama": nama,
      "email": email,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Sucessfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }