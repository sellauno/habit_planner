import 'package:flutter/material.dart';
import 'package:habit_planner/pages/forms/habitadd.dart';
import 'package:habit_planner/pages/forms/habitedit.dart';
import 'package:intl/intl.dart';
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
      backgroundColor: Color.fromARGB(255, 171, 195, 255),
      appBar: AppBar(
        title: const Text("Habits List"),
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
                      DateTime date = e['tglMulai'].toDate();
                      String mydate = DateFormat('dd/MM/yyyy').format(date);
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
                                          e['habit'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Tanggal Mulai: $mydate",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Jumlah Hari: ${e['jmlHari']}",
                                          style: TextStyle(
                                            fontSize: 15,
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
                                            await FirebaseHabit.deleteHabits(
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
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HabitEdit(
                                                documentId: e.id,
                                                tgl: e['tglMulai'].toDate(),
                                                habit: e['habit']),
                                          ),
                                        ),
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
          Navigator.pushNamed(context, '/habitadd'),
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
