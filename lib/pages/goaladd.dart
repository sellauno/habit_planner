import 'package:flutter/material.dart';

class GoalAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GoalAdd();
}

class _GoalAdd extends State<GoalAdd> {
  String? _valKategori;
  List _listKategori = [
    "Pendek (1 Minggu)",
    "Menengah (1 Bulan)",
    "Panjang (1 Tahun)"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Mulish',
        ),
        home: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tambah Goal",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Selalu ingat untuk atur goals yang SMART(Specific, Measurable, Actionable, Realistic, Timebound)",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 15),
                Form(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      // TextFormField(
                      //   // controller: _emailController,
                      //   decoration: InputDecoration(
                      //     // labelText: 'Email',
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 171, 195, 255),
                      //           width: 1.0),
                      //     ),
                      //   ),
                      // ),
                      DropdownButtonFormField(
                        hint: Text("Select The Kategori"),
                        value: _valKategori,
                        items: _listKategori.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          // labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 171, 195, 255),
                                width: 1.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _valKategori = value.toString();
                          });
                        },
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Goal',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      TextFormField(
                        // controller: _emailController,
                        decoration: InputDecoration(
                          // labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 171, 195, 255),
                                width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Deadline',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      TextFormField(
                        // controller: _emailController,
                        decoration: InputDecoration(
                          // labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 171, 195, 255),
                                width: 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 171, 195, 255),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
