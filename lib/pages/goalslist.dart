import 'package:flutter/material.dart';

class GoalsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GoalsList();
}

class _GoalsList extends State<GoalsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
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
                          child: Column(
                            children: [
                              Text(
                                "Goal List",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
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
                                        "Membaca",
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          // color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Day 20",
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
                        ),

                        // PERCOBAAN
                        // StreamBuilder(
                        //   stream: collectionReference,
                        //   builder: (BuildContext context,
                        //       AsyncSnapshot<QuerySnapshot> snapshot) {
                        //     if (snapshot.hasData) {
                        //       return Padding(
                        //         padding: const EdgeInsets.only(top: 8.0),
                        //         child: ListView(
                        //           children: snapshot.data!.docs.map((e) {
                        //             return Card(
                        //                 child: Column(children: [
                        //               ListTile(
                        //                 title: Text(e["idUser"]),
                        //                 subtitle: Container(
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: <Widget>[
                        //                       Text("Habit: " + e['habit'],
                        //                           style: const TextStyle(
                        //                               fontSize: 14)),
                        //                       Text(
                        //                           "Tanggal Mulai: " + e['idUser'],
                        //                           style: const TextStyle(
                        //                               fontSize: 12)),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //               ButtonBar(
                        //                 alignment: MainAxisAlignment.spaceBetween,
                        //                 children: <Widget>[
                        //                   TextButton(
                        //                     style: TextButton.styleFrom(
                        //                       padding: const EdgeInsets.all(5.0),
                        //                       primary: const Color.fromARGB(
                        //                           255, 143, 133, 226),
                        //                       textStyle:
                        //                           const TextStyle(fontSize: 20),
                        //                     ),
                        //                     child: const Text('Edit'),
                        //                     onPressed: () {
                        //                       // Navigator.pushAndRemoveUntil<dynamic>(
                        //                       //   context,
                        //                       //   MaterialPageRoute<dynamic>(
                        //                       //     builder: (BuildContext context) => EditPage(
                        //                       //       employee: Employee(
                        //                       //           uid: e.id,
                        //                       //           idUser: e["idUser"],
                        //                       //           habit: e["habit"],
                        //                       //           contactno: e["idUser"]),
                        //                       //     ),
                        //                       //   ),
                        //                       //   (route) =>
                        //                       //       false, //if you want to disable back feature set to false
                        //                       // );
                        //                     },
                        //                   ),
                        //                   TextButton(
                        //                     style: TextButton.styleFrom(
                        //                       padding: const EdgeInsets.all(5.0),
                        //                       primary: const Color.fromARGB(
                        //                           255, 143, 133, 226),
                        //                       textStyle:
                        //                           const TextStyle(fontSize: 20),
                        //                     ),
                        //                     child: const Text('Delete'),
                        //                     onPressed: () async {
                        //                       var response =
                        //                           await FirebaseCrud.deleteHabits(
                        //                               docId: e.id);
                        //                       if (response.code != 200) {
                        //                         showDialog(
                        //                             context: context,
                        //                             builder: (context) {
                        //                               return AlertDialog(
                        //                                 content: Text(response
                        //                                     .message
                        //                                     .toString()),
                        //                               );
                        //                             });
                        //                       }
                        //                     },
                        //                   ),
                        //                 ],
                        //               ),
                        //             ]));
                        //           }).toList(),
                        //         ),
                        //       );
                        //     }

                        //     return Container();
                        //   },
                        // ),
                        //     // END PERCOBAAN
                      ],
                    )),
              ),
            ),
        );
  }
}
