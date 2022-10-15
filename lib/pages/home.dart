import 'package:flutter/material.dart';
import '../services/firebase_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_planner/models/habit.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readHabits();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish',
        scaffoldBackgroundColor: Color.fromARGB(255, 171, 195, 255),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10.0, bottom: 5),
                    child: Text(
                      'Habit Planner',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Text(
                      getCurrentDate(),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Expanded(
                          child: Container(
                            // color: Colors.blue,
                            child: Column(children: [
                              Text(
                                "Membaca",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Day 10",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // color: Colors.deepOrange,
                            child: Column(children: [
                              Text(
                                "Membaca 1 buku",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Day 10",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ]),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Color.fromARGB(255, 251, 251, 251),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                         Text(
                          "Today List",
                          style: TextStyle(fontSize: 20),
                        ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Color.fromARGB(255, 242, 145, 145),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Membaca",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            width: double.infinity,
                          ),
                        ),
                      ),

                      // PERCOBAAN
                      StreamBuilder(
                        stream: collectionReference,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ListView(
                                children: snapshot.data!.docs.map((e) {
                                  return Card(
                                      child: Column(children: [
                                    ListTile(
                                      title: Text(e["idUser"]),
                                      subtitle: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Habit: " + e['habit'],
                                                style: const TextStyle(
                                                    fontSize: 14)),
                                            Text(
                                                "Tanggal Mulai: " + e['idUser'],
                                                style: const TextStyle(
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(5.0),
                                            primary: const Color.fromARGB(
                                                255, 143, 133, 226),
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          child: const Text('Edit'),
                                          onPressed: () {
                                            // Navigator.pushAndRemoveUntil<dynamic>(
                                            //   context,
                                            //   MaterialPageRoute<dynamic>(
                                            //     builder: (BuildContext context) => EditPage(
                                            //       employee: Employee(
                                            //           uid: e.id,
                                            //           idUser: e["idUser"],
                                            //           habit: e["habit"],
                                            //           contactno: e["idUser"]),
                                            //     ),
                                            //   ),
                                            //   (route) =>
                                            //       false, //if you want to disable back feature set to false
                                            // );
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(5.0),
                                            primary: const Color.fromARGB(
                                                255, 143, 133, 226),
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          child: const Text('Delete'),
                                          onPressed: () async {
                                            var response =
                                                await FirebaseCrud.deleteHabits(
                                                    docId: e.id);
                                            if (response.code != 200) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(response
                                                          .message
                                                          .toString()),
                                                    );
                                                  });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ]));
                                }).toList(),
                              ),
                            );
                          }

                          return Container();
                          // END PERCOBAAN
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    String? month;
    if (dateParse.month == 1) {
      month = "Januari";
    } else if (dateParse.month == 2) {
      month = "Februari";
    } else if (dateParse.month == 3) {
      month = "Maret";
    } else if (dateParse.month == 4) {
      month = "April";
    } else if (dateParse.month == 5) {
      month = "Mei";
    } else if (dateParse.month == 6) {
      month = "Juni";
    } else if (dateParse.month == 7) {
      month = "Juli";
    } else if (dateParse.month == 8) {
      month = "Agustus";
    } else if (dateParse.month == 9) {
      month = "September";
    } else if (dateParse.month == 10) {
      month = "Oktober";
    } else if (dateParse.month == 11) {
      month = "November";
    } else {
      month = "Desember";
    }

    var formattedDate = "${dateParse.day} ${month} ${dateParse.year}";
    return formattedDate.toString();
  }
}
