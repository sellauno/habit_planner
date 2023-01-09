import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_planner/services/auth_service.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Users').doc(userUid).collection('Goals');
class FirebaseGoal {
  static Future<Response> addGoals({
    required String idUser,
    required String goal,
    required DateTime deadline,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "goal": goal,
      "deadline" : deadline
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

  static Stream<QuerySnapshot> readGoals() {
    CollectionReference goalsCollection =
        _Collection;

    return goalsCollection.snapshots();
  }

  static Future<Response> updateGoals({
    required String idUser,
    required String goal,
    required DateTime deadline,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "idUser": idUser,
      "goal": goal,
      "deadline" : deadline
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated Goals";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Future<Response> deleteGoals({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted Goals";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }
}