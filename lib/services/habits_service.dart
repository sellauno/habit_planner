import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_planner/services/auth_service.dart';
import 'package:habit_planner/services/activity_service.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _Collection = _firestore.doc(userUid).collection('Habits');
final CollectionReference _Collection =
    _firestore.collection('Users').doc(userUid).collection('Habits');

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
          idUser: idUser,
          idHabit: documentReferencer.id,
          jmlHari: jmlHari,
          tglAct: tglMulai);
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readHabits() {
    CollectionReference habitsCollection = _Collection;

    // return habitsCollection.snapshots();
    return habitsCollection.snapshots();
  }

  static Future<String> searchHabits({
    required String docId,
  }) async {
    CollectionReference habitsCollection = _Collection;
    DocumentReference documentReferencer = _Collection.doc(docId);

    String myHabit = "Tidak ditemukan";

    var collection = FirebaseFirestore.instance.collection('Habits');
    var docSnapshot = await collection.doc(docId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      myHabit = data?['habit']; // <-- The value you want to retrieve.
    }

    return myHabit;
  }

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

    await documentReferencer.update(data).whenComplete(() async {
      var collection = FirebaseFirestore.instance
          .collection('Users')
          .doc(userUid)
          .collection('Activity');
      var snapshot = await collection.where('idHabit', isEqualTo: docId).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      FirebaseActivity.addActivity(
          idUser: idUser,
          idHabit: documentReferencer.id,
          jmlHari: jmlHari,
          tglAct: tglMulai);

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

    await documentReferencer.delete().whenComplete(() async {
      response.code = 200;
      response.message = "Sucessfully Deleted Habits";
      var collection = FirebaseFirestore.instance
          .collection('Users')
          .doc(userUid)
          .collection('Activity');
      var snapshot = await collection.where('idHabit', isEqualTo: docId).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
