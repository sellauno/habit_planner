import 'package:flutter/material.dart';
import 'package:habit_planner/pages/evaluasiform.dart';

class Evaluasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Evaluasi();
}

class _Evaluasi extends State<Evaluasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Good job!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mulish',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Mulai evaluasi dengan menjawab pertanyaan-pertanyaan berikut.",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Mulish',
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 200,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 86, 131, 246),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EvaluasiForm()),
                );
              },
              child: Text(
                "Mulai Evaluasi",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
