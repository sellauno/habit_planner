import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_planner/services/auth_service.dart';
import 'package:habit_planner/services/activity_service.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _Collection = _firestore.doc(userUid).collection('Habits');
final CollectionReference _Collection = _firestore.collection('Habits');

class FirebaseHabit {
  static Future<Response> addHabits({
    required String idUser,
    required String habit,
    required DateTime tglMulai,
    required int jmlHari,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "habit": habit,
      "tglMulai": tglMulai,
      "jmlHari": jmlHari,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
      FirebaseActivity.addActivity(
          idUser: idUser, idHabit: documentReferencer.id, jmlHari: jmlHari, tglAct: tglMulai);
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readHabits() {
    CollectionReference notesItemCollection = _Collection;

    // return notesItemCollection.snapshots();
    return notesItemCollection.where("idUser", isEqualTo: userUid).snapshots();
  }

  Future<String> searchHabit(String docId) async {
    DocumentReference documentReferencer = _Collection.doc(docId);
    // var habit = _Collection.doc(docId).get('habit');
    // String namaHabit = habit['habit'];
    String namaHabit;
    String name = (documentReferencer.get() as Map<String, dynamic>)['habit'];
    return name;
  }

//   static Future<String> searchHabits({
//     required String docId,
// }) async{
//     CollectionReference notesItemCollection =
//         _Collection;
//     DocumentReference documentReferencer = _Collection.doc(docId);
//     var habit = documentReferencer.snapshots();

//     if (habit != null) {
//       habit.forEach((product) {
//         return habit;
//       });
//     }
//   }

  static Future<Response> updateHabits({
    required String idUser,
    required String habit,
    required DateTime tglMulai,
    required int jmlHari,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "habit": habit,
      "tglMulai": tglMulai,
      "jmlHari": jmlHari,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Habits";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> deleteHabits({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Habits";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
