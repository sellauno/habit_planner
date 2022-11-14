import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataAkun();
  }

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
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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
                          'Nama',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                        TextFormField(
                          controller: _namaController,
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
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
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
                          "Masukkan password untuk mengubah profile",
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 75, 250),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
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
                        // SignInSignUpResult result = await createUser(
                        //     email: _emailController.text,
                        //     pass: _passwordController.text);
                        // if (result.user != null) {
                        //   String usruid = result.user!.uid;
                        //   await addUser(
                        //     idUser: usruid,
                        //     email: _emailController.text,
                        //     nama: _namaController.text,
                        //   );
                        //   Navigator.pop(context);
                        // } else {
                        //   String msg = result.message.toString();
                        //   // Show Dialog
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => AlertDialog(
                        //             title: Text("Error"),
                        //             content: Text(msg),
                        //             actions: <Widget>[
                        //               TextButton(
                        //                 onPressed: () {
                        //                   Navigator.pop(context);
                        //                 },
                        //                 child: Text("OK"),
                        //               )
                        //             ],
                        //           ));
                        // }
                      },
                      child: Text(
                        "SIMPAN",
                        // "SIMPAN",
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

  void dataAkun() async {
    String dnama = '';
    String demail = '';

    var collection = FirebaseFirestore.instance.collection('Users');
    var docSnapshot = await collection.doc(userUid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      dnama = data!["nama"];
      demail = data["email"];
    }

    setState(() {
      _emailController.text = demail;
      _namaController.text = dnama;
    });
  }
}
