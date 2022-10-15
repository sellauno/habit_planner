import 'package:flutter/material.dart';

class EvaluasiForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EvaluasiForm();
}

class _EvaluasiForm extends State<EvaluasiForm> {
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
            "Oktober",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mulish',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Masukkan email dan password untuk masuk ke akun Anda",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Mulish',
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Color.fromARGB(255, 242, 145, 145),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Membaca",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              width: double.infinity,
            ),
          ),
        ],
      ),
    ));
  }
}
