import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HabitAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HabitAdd();
}

class _HabitAdd extends State<HabitAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
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
                    // controller: _emailController,
                    decoration: InputDecoration(
                      // labelText: 'Email',
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
                    'Tanggal Mulai',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  // TextFormField(
                  //   // controller: _emailController,
                  //   decoration: InputDecoration(
                  //     // labelText: 'Password',
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //       borderSide: BorderSide(
                  //           color: Color.fromARGB(255, 171, 195, 255),
                  //           width: 1.0),
                  //     ),
                  //   ),
                  // ),
                  TextFormField(
                    // controller: dateInput,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 171, 195, 255),
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
                          // dateInput.text = formattedDate; //set output date to TextField value.
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
                  "LOG IN",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
