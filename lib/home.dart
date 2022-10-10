import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Habit Planner',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  getCurrentDate(),
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Mulish',
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 171, 195, 255),
            height: double.infinity,
          ),
        ],
      ),
    ));
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}
