import 'package:flutter/material.dart';
import 'package:habit_planner/services/activity_service.dart';
import '../services/habits_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_planner/models/habit.dart';
import 'package:habit_planner/pages/sidemenu.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  final Stream<QuerySnapshot> collectionReferenceHabit =
      FirebaseHabit.readHabits();
  final Stream<QuerySnapshot> collectionReferenceActivity =
      FirebaseActivity.readActivity();
  final Stream<QuerySnapshot> collectionReference = FirebaseHabit.readHabits();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish',
        scaffoldBackgroundColor: Color.fromARGB(255, 171, 195, 255),
      ),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
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
                        const EdgeInsets.only(top: 20, left: 20.0, bottom: 5),
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Color.fromARGB(255, 251, 251, 251),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Today List",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Expanded(
                        //   child: StreamBuilder(
                        //     stream: collectionReference,
                        //     builder: (BuildContext context,
                        //         AsyncSnapshot<QuerySnapshot> snapshot) {
                        //       if (snapshot.hasData) {
                        //         return ListView(
                        //           children: snapshot.data!.docs.map((e) {
                        //             return Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: ClipRRect(
                        //                 borderRadius:
                        //                     BorderRadius.circular(10.0),
                        //                 child: Container(
                        //                   color: Color.fromARGB(
                        //                       255, 242, 145, 145),
                        //                   constraints:
                        //                       BoxConstraints(minHeight: 40),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(8.0),
                        //                     child: Column(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         Text(
                        //                           e['habit'],
                        //                           style: TextStyle(
                        //                             // fontWeight: FontWeight.bold,
                        //                             fontSize: 15,
                        //                             // color: Colors.white
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   width: double.infinity,
                        //                 ),
                        //               ),
                        //             );
                        //             // Padding(
                        //             //   padding: const EdgeInsets.all(8.0),
                        //             //   child: ClipRRect(
                        //             //     borderRadius: BorderRadius.circular(10.0),
                        //             //     child: Container(
                        //             //       color: Color.fromARGB(255, 242, 145, 145),
                        //             //       constraints: BoxConstraints(minHeight: 40),
                        //             //       child: Padding(
                        //             //         padding: const EdgeInsets.all(8.0),
                        //             //         child: Column(
                        //             //           mainAxisAlignment: MainAxisAlignment.center,
                        //             //           crossAxisAlignment: CrossAxisAlignment.start,
                        //             //           children: [
                        //             //             Text(
                        //             //               "Membaca",
                        //             //               style: TextStyle(
                        //             //                 // fontWeight: FontWeight.bold,
                        //             //                 fontSize: 15,
                        //             //                 // color: Colors.white
                        //             //                 decoration: TextDecoration.lineThrough,
                        //             //               ),
                        //             //             ),
                        //             //           ],
                        //             //         ),
                        //             //       ),
                        //             //       width: double.infinity,
                        //             //     ),
                        //             //   ),
                        //             // ),
                        //           }).toList(),
                        //         );
                        //       }

                        //       return Container(
                        //         height: 100,
                        //         color: Colors.amber,
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )),

            // StreamBuilder(
            //   stream: collectionReferenceHabit,
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       return ListView(
            //         children: snapshot.data!.docs.map((e) {
            //           return Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(10.0),
            //               child: Container(
            //                 color:
            //                     Color.fromARGB(255, 242, 145, 145),
            //                 constraints:
            //                     BoxConstraints(minHeight: 40),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Column(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     crossAxisAlignment:
            //                         CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         e['habit'],
            //                         style: TextStyle(
            //                           // fontWeight: FontWeight.bold,
            //                           fontSize: 15,
            //                           // color: Colors.white,
            //                           decoration: TextDecoration.lineThrough,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 width: double.infinity,
            //               ),
            //             ),
            //           );
            //           // Padding(
            //           //   padding: const EdgeInsets.all(8.0),
            //           //   child: ClipRRect(
            //           //     borderRadius: BorderRadius.circular(10.0),
            //           //     child: Container(
            //           //       color: Color.fromARGB(255, 242, 145, 145),
            //           //       constraints: BoxConstraints(minHeight: 40),
            //           //       child: Padding(
            //           //         padding: const EdgeInsets.all(8.0),
            //           //         child: Column(
            //           //           mainAxisAlignment: MainAxisAlignment.center,
            //           //           crossAxisAlignment: CrossAxisAlignment.start,
            //           //           children: [
            //           //             Text(
            //           //               "Membaca",
            //           //               style: TextStyle(
            //           //                 // fontWeight: FontWeight.bold,
            //           //                 fontSize: 15,
            //           //                 // color: Colors.white
            //           //                 decoration: TextDecoration.lineThrough,
            //           //               ),
            //           //             ),
            //           //           ],
            //           //         ),
            //           //       ),
            //           //       width: double.infinity,
            //           //     ),
            //           //   ),
            //           // ),
            //         }).toList(),
            //       );
            //     }
            //     return Container();
            //   },
            // ),
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

  getDataHabit(data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Color.fromARGB(255, 242, 145, 145),
          constraints: BoxConstraints(minHeight: 40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['habit'],
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
  }
}
