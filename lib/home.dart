import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.only(top: 10, left: 10.0, bottom: 5),
                    child: Text(
                      'Habit Planner',
                      style: TextStyle(
                        fontSize: 25,
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
                        fontSize: 17,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center, 
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Column(children: [
                          Text(
                            "Membaca",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "Day  10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.deepOrange,
                        child: Column(children: [
                          Text(
                            "Membaca 1 buku",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "Day -10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ]),
                      ),
                    ),
                  ]),
                ],
              ),
          ),
          Container(
              color: Color.fromARGB(255, 197, 152, 89),
              width: double.infinity,
              child: Text("LALALA")),
        ],
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
