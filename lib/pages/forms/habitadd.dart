import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habit_planner/services/habits_service.dart';

class HabitAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HabitAdd();
}

class _HabitAdd extends State<HabitAdd> {
  final _habitcontroller = TextEditingController();
  final _tglcontroller = TextEditingController();
  DateTime tgl = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tambah Habit",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Masukkan rencana habit baru Anda",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Habit',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                        TextFormField(
                          controller: _habitcontroller,
                          decoration: InputDecoration(
                            // labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 171, 195, 255),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 20, 84, 247),
                                  width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Tanggal Mulai',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                        TextFormField(
                          controller: _tglcontroller,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 171, 195, 255),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 20, 84, 247),
                                  width: 1.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                              ),
                              onPressed: () {},
                            ),
                          ),

                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                tgl = pickedDate;
                                _tglcontroller.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Jumlah Hari',
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
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 20, 84, 247),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var response = await FirebaseHabit.addHabits(
                            idUser: "ABC",
                            habit: _habitcontroller.text,
                            tglMulai: tgl,
                          );
                          if (response.code != 200) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.message.toString()),
                                  );
                                }).then((val) {
                              Navigator.pop(context);
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.message.toString()),
                                );
                              },
                            );
                          }
                        }
                      },
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
          ),
        )));
  }
}
