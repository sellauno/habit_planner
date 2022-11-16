import 'package:flutter/material.dart';
import 'package:habit_planner/services/activity_service.dart';
import 'package:habit_planner/services/auth_service.dart';
import 'package:habit_planner/services/habits_service.dart';
import '../services/habits_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_planner/models/habit.dart';
import 'package:habit_planner/pages/sidemenu.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  final Stream<QuerySnapshot> collectionReferenceHabit =
      FirebaseHabit.readHabits();
  final Stream<QuerySnapshot> collectionReferenceActivity =
      FirebaseActivity.readActivity();
  final Stream<QuerySnapshot> collectionReferenceActivityDone =
      FirebaseActivity.readActivityDone();

  List<String> mytext = ["Habit 1"];
  List<String> myday = [];

  int indexHabit = 0;

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    // setListHabit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 195, 255),
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20.0, bottom: 5),
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
                      style: const TextStyle(
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
                              // FutureBuilder(
                              // future: getSliderImageFromDb(),
                              // builder: (_, AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapShot) {
                              //   return
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 50,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                ),

                                items: mytext.map((i) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            i,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "Day 10",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                }).toList(),

                                // Text(
                                //   "Membaca",
                                //   // userUid,
                                //   style: TextStyle(fontSize: 12),
                                // ),
                                // Text(
                                //   "Day 10",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold, fontSize: 20),
                                // ),
                              ),
                              //   }
                              // )
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Today List",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        StreamBuilder(
                          stream: collectionReferenceActivity,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        FirebaseActivity.updateActivity(
                                            docId: e.id,
                                            finished: e['finished']);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              255, 242, 145, 145),
                                          constraints:
                                              BoxConstraints(minHeight: 40),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future:
                                                      namaHabit(e['idHabit']),
                                                  builder: (context,
                                                      AsyncSnapshot<String>
                                                          snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      String storeValue =
                                                          'Load data';
                                                      if (snapshot.data !=
                                                          null) {
                                                        storeValue =
                                                            snapshot.data!;
                                                      }

                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return ListTile(
                                                              title: Text(
                                                                  storeValue),
                                                            );
                                                          });
                                                    } else if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.none) {
                                                      return Text("No data");
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }

                            return Container(
                              height: 100,
                              color: Colors.amber,
                            );
                          },
                        ),
                      
                      ],
                    ),
                  ),
                )),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Finished List",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        StreamBuilder(
                          stream: collectionReferenceActivityDone,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        FirebaseActivity.updateActivity(
                                            docId: e.id,
                                            finished: e['finished']);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              255, 242, 145, 145),
                                          constraints: const BoxConstraints(
                                              minHeight: 40),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future:
                                                      namaHabit(e['idHabit']),
                                                  builder: (context,
                                                      AsyncSnapshot<String>
                                                          snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      String storeValue = 'ABC';
                                                      if (snapshot.data !=
                                                          null) {
                                                        storeValue =
                                                            snapshot.data!;
                                                      }

                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return ListTile(
                                                              title: Text(
                                                                storeValue,
                                                                style:
                                                                    const TextStyle(
                                                                  // fontWeight: FontWeight.bold,
                                                                  // fontSize: 15,
                                                                  // color: Colors.white,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    } else if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.none) {
                                                      return Text("No data");
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(10.0),
                                  //     child: Container(
                                  //       color: Color.fromARGB(255, 242, 145, 145),
                                  //       constraints: BoxConstraints(minHeight: 40),
                                  //       child: Padding(
                                  //         padding: const EdgeInsets.all(8.0),
                                  //         child: Column(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           crossAxisAlignment: CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               "Membaca",
                                  //               style: TextStyle(
                                  //                 // fontWeight: FontWeight.bold,
                                  //                 fontSize: 15,
                                  //                 // color: Colors.white
                                  //                 decoration: TextDecoration.lineThrough,
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       width: double.infinity,
                                  //     ),
                                  //   ),
                                  // ),
                                }).toList(),
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                )),
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
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['habit'],
                  style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> namaHabit(id) async {
    String habit = 'No habit';
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .doc(userUid)
        .collection('Habits');
    var docSnapshot = await collection.doc(id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      habit = data!["habit"];
    }
    return habit;
  }

  void setListHabit() async {
    List<String> newList = [];
    int idx = 0;
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    final dateNow = DateTime(dateParse.year, dateParse.month, dateParse.day);
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .doc(userUid)
        .collection('Habits')
        .where('tglAct', isEqualTo: dateNow);
    var docSnapshot = await collection.get();
    if (docSnapshot.size != 0) {
      newList[0] = "Ada sih";
      docSnapshot.docs.map((e) => {
            newList[0] = "Ada",
            newList[idx] = e.id,
            indexHabit += 1,
          });
    } else {
      newList[0] = "Tidak Ada";
    }
    setState(() {
      mytext = newList;
    });
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getSliderImageFromDb() async {
    var _fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot = await _fireStore
        .collection('Users')
        .doc(userUid)
        .collection('Habits')
        .get();
    if (mounted) {
      // setState(() {
      //   _dataLength = snapshot.docs.length;
      // });
    }
    return snapshot.docs;
  }
}
