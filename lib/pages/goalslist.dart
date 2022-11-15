import 'package:flutter/material.dart';
import 'package:habit_planner/pages/forms/goaladd.dart';
import 'package:habit_planner/pages/forms/goaledit.dart';
import 'package:habit_planner/services/goals_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GoalsList();
}

class _GoalsList extends State<GoalsList> {
  final Stream<QuerySnapshot> collectionReference = FirebaseGoal.readGoals();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 171, 195, 255),
      appBar: AppBar(
        title: Text("Goals List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Color.fromARGB(255, 251, 251, 251),
                  width: double.infinity,
                  child: ListView(
                    children: snapshot.data!.docs.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Color.fromARGB(255, 242, 145, 145),
                            constraints: BoxConstraints(minHeight: 40),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['goal'],
                                          style: const TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            // color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          e['kategori'],
                                          style: const TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            // color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () async {
                                        var response =
                                            await FirebaseGoal.deleteGoals(
                                                docId: e.id);
                                        if (response.code != 200) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(response.message
                                                      .toString()),
                                                );
                                              });
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GestureDetector(
                                      child: Icon(Icons.mode_edit),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GoalEdit(
                                              deadline: e['deadline'].toDate(),
                                              goal: e['goal'],
                                              idUser: e['idUser'],
                                              kategori: e['kategori'],
                                              uid: e.id,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => GoalAdd()),
          // ),
          Navigator.pushNamed(context, '/goaladd'),
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
