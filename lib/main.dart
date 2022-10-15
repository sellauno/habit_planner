import 'package:flutter/material.dart';
import 'package:habit_planner/pages/evaluasi.dart';
import 'package:habit_planner/pages/habitslist.dart';
import 'package:habit_planner/pages/kalender.dart';
import 'package:habit_planner/pages/login.dart';
import 'package:habit_planner/pages/register.dart';
import 'package:habit_planner/pages/habitadd.dart';
import 'package:habit_planner/pages/goaladd.dart';
import 'package:habit_planner/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(const MyApp());
  runApp(Home());
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
        // scaffoldBackgroundColor : Color.fromARGB(255, 171, 195, 255),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: Login(),
      // home: Register(),
      // home: HabitAdd(),
      // home:  GoalAdd(),
      // home:  Home(),
      // home: Kalender(),
      // home: HabitsList(),
      // home: Evaluasi(),
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
