import 'package:flutter/material.dart';

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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
    ));
  }
}
