import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habit_planner/services/habits_service.dart';

class HabitEdit extends StatefulWidget {
  final String documentId;
  final DateTime tgl;
  final String habit;

  const HabitEdit(
      {super.key,
      required this.documentId,
      required this.tgl,
      required this.habit});

  @override
  State<StatefulWidget> createState() => _HabitEdit();
}

class _HabitEdit extends State<HabitEdit> {
  final _habitcontroller = TextEditingController();
  final _tglcontroller = TextEditingController();
  final _jmlHariController = TextEditingController();
  DateTime tgl = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _habitcontroller.text = widget.habit;

    String formattedDate = DateFormat('yyyy-MM-dd').format(widget.tgl);
    print(formattedDate);
    setState(() {
      tgl = widget.tgl;
      _tglcontroller.text = formattedDate;
    });

    return Scaffold(
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

                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
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
                      controller: _jmlHariController,
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
                      var response = await FirebaseHabit.updateHabits(
                        idUser: "ABC",
                        habit: _habitcontroller.text,
                        tglMulai: tgl,
                        docId: widget.documentId,
                        jmlHari: int.parse(_jmlHariController.text),
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
                        ).then((val) {
                          Navigator.pop(context);
                        });;
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
    ));
  }
}
