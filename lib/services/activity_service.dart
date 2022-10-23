import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Activity');

class FirebaseActivity {

  static Stream<QuerySnapshot> readActivity() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readActivityDone() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.where('finished', isEqualTo: 'true').snapshots();
  }


  static Future<Response> addActivity({
    required String idUser,
    required String idHabit,
    required DateTime tglAct,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "idHabit": idHabit,
      "tglAct": tglAct
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

  // static Stream<QuerySnapshot> searchTodayActivity() {
  //   CollectionReference notesItemCollection = _Collection;

  //   int now = DateTime.now().millisecondsSinceEpoch;
  //   return notesItemCollection.where('tgl' isEqualTo: now).snapshots();
  // }

  static Future<Response> updateActivity({
    required bool finished,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    bool status = true;

    if(finished){
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
