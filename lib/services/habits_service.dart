import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Habits');
class FirebaseHabit {
  static Future<Response> addHabits({
    required String idUser,
    required String habit,
    required DateTime tglMulai,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "habit": habit,
      "tglMulai" : tglMulai
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

  static Stream<QuerySnapshot> readHabits() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
    // return notesItemCollection.where("topic", isEqualTo: "flutter").snapshots();
  }

  static Future<Response> updateHabits({
    required String idUser,
    required String habit,
    required String tglMulai,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "habit": habit,
      "tglMulai" : tglMulai
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated Habits";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Future<Response> deleteHabits({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted Habits";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }
}