import 'package:flutter/material.dart';
import 'package:habit_planner/models/goal.dart';
import 'package:habit_planner/pages/evaluasi.dart';
import 'package:habit_planner/pages/goalslist.dart';
import 'package:habit_planner/pages/habitslist.dart';
import 'package:habit_planner/pages/kalender.dart';
import 'package:habit_planner/pages/forms/login.dart';
import 'package:habit_planner/pages/forms/register.dart';
import 'package:habit_planner/pages/forms/habitadd.dart';
import 'package:habit_planner/pages/forms/goaladd.dart';
import 'package:habit_planner/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_planner/pages/profile.dart';
import 'package:habit_planner/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // runApp(Home());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish',
      ),
      home: userUid != ''
      ? Home()
      : Login(),

      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/habitadd': (context) => HabitAdd(),
        '/goaladd': (context) => GoalAdd(),
        '/kalender': (context) => Kalender(),
        '/habits': (context) => HabitsList(),
        '/goals': (context) => GoalsList(),
        '/evaluasi': (context) => Evaluasi(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
