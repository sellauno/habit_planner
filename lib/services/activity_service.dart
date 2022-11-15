import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_planner/services/auth_service.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection =
    _firestore.collection('Users').doc(userUid).collection('Activity');

class FirebaseActivity {
  static Stream<QuerySnapshot> readActivity() {
    CollectionReference activitiesCollection = _Collection;
    
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    final dateNow = DateTime(dateParse.year, dateParse.month, dateParse.day);

    return activitiesCollection.where('finished', isEqualTo: false).where('tglAct', isEqualTo: dateNow).snapshots();
  }

  static Stream<QuerySnapshot> readActivityDone() {
    CollectionReference activitiesCollection = _Collection;

    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    final dateNow = DateTime(dateParse.year, dateParse.month, dateParse.day);

    return activitiesCollection.where('finished', isEqualTo: true).where('tglAct', isEqualTo: dateNow).snapshots();
  }

  static Future<Response> addActivity({
    required String idUser,
    required String idHabit,
    required int jmlHari,
    required DateTime tglAct,
  }) async {
    Response response = Response();
    for (int i = 0; i < jmlHari; i++) {
      DateTime tgl = tglAct.add(Duration(days: i));
      DocumentReference documentReferencer = _Collection.doc();

      Map<String, dynamic> data = <String, dynamic>{
        "idUser": idUser,
        "idHabit": idHabit,
        "tglAct": tgl,
        "dayCount": i+1,
        "finished": false,
      };

      var result = await documentReferencer.set(data).whenComplete(() {
        response.code = 200;
        response.message = "Sucessfully added to the database";
      }).catchError((e) {
        response.code = 500;
        response.message = e;
      });
    }
    return response;
  }

  // static Stream<QuerySnapshot> searchTodayActivity() {
  //   CollectionReference activitiesCollection = _Collection;

  //   int now = DateTime.now().millisecondsSinceEpoch;
  //   return activitiesCollection.where('tgl' isEqualTo: now).snapshots();
  // }

  static Future<Response> updateActivity({
    required bool finished,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    bool status = true;

    if (finished) {
      status = false;
    }

    Map<String, dynamic> data = <String, dynamic>{
      "finished": status,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Activity";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> deleteActivity({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Activity";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
