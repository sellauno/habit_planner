import 'package:flutter/material.dart';
import 'package:habit_planner/pages/habitadd.dart';
import '../services/habits_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HabitsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HabitsList();
}

class _HabitsList extends State<HabitsList> {
  final Stream<QuerySnapshot> collectionReference = FirebaseHabit.readHabits();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      // body: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.circular(10.0),
      //         child: Container(
      //             color: Color.fromARGB(255, 251, 251, 251),
      //             width: double.infinity,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Habit List",
      //                         style: TextStyle(fontSize: 20),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 10),
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(10.0),
      //                     child: Container(
      //                       color: Color.fromARGB(255, 242, 145, 145),
      //                       constraints: BoxConstraints(minHeight: 40),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(10.0),
      //                         child: Row(
      //                           // mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Expanded(
      //                               child: Text(
      //                                 "Membaca",
      //                                 style: TextStyle(
      //                                   // fontWeight: FontWeight.bold,
      //                                   fontSize: 15,
      //                                   // color: Colors.white
      //                                 ),
      //                               ),
      //                             ),
      //                             Text(
      //                               "Day 20",
      //                               style: TextStyle(
      //                                 // fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 // color: Colors.white
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       width: double.infinity,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             )),
      //       ),
      //     ),

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
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Habit: " + e['habit'],
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        // color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Tanggal Mulai: " + e['idUser'],
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      // color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            width: double.infinity,
                          ),
                        ),
                      );
                      // return Card(
                      //     child: Column(children: [
                      //   ListTile(
                      //     title: Text(e["idUser"]),
                      //     subtitle: Container(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           Text("Habit: " + e['habit'],
                      //               style: const TextStyle(fontSize: 14)),
                      //           Text("Tanggal Mulai: " + e['idUser'],
                      //               style: const TextStyle(fontSize: 12)),
                      //         ],
                      //       ),
                      //     ),
                      //   ),

                      // ]));
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HabitAdd()),
          ),
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}