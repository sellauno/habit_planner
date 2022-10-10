import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
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
              "Mari Bergabung!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Mulish',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Masukkan data diri untuk membuat akun Anda",
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
                    'Nama',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  Text(
                    'Email',
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
                    'Password',
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
                    obscureText: true,
                  ),
                  // Container(
                  //   width: 200,
                  //   height: 45,
                  //   child: TextButton(
                  //     style: TextButton.styleFrom(
                  //       backgroundColor: Color(0x5E81FF),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //     child: Text(
                  //       "Log in",
                  //       style: TextStyle(
                  //         color: Color(0xffffffff),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 171, 195, 255),),
                onPressed: () {},
                child: Text(
                  "REGISTER",
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
