import 'package:flutter/material.dart';
import 'package:habit_planner/pages/evaluasi.dart';
import 'package:habit_planner/pages/goalslist.dart';
import 'package:habit_planner/pages/habitslist.dart';
import 'package:habit_planner/pages/kalender.dart';
import 'package:habit_planner/pages/forms/login.dart';
import 'package:habit_planner/pages/profile.dart';
import 'package:habit_planner/services/auth_service.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/cover.jpg'))),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            // <a href="https://www.freepik.com/free-vector/evening-cloudy-sky-purple-background-with-group-cumulus-cirrus-clouds-flat-cartoon-illustration_16607919.htm#query=cartoon%20illustration&position=9&from_view=keyword">Image by macrovector</a> on Freepik
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Profile()),
              // ),
               Navigator.pushNamed(context, '/profile'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Kalender()),
              // ),
               Navigator.pushNamed(context, '/kalender'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Habit'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HabitsList()),
              // ),
               Navigator.pushNamed(context, '/habits'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text('Goals'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => GoalsList()),
              // ),
               Navigator.pushNamed(context, '/goals'),
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.book),
          //   title: const Text('Evaluasi'),
          //   onTap: () => {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Evaluasi()),
          //     ),
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            // onTap: () => { Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Login()),
            //   ),},
            onTap: () => {
              signOut(),
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return Login();
                }),
                ModalRoute.withName('/'),
              ),
            },
          ),
        ],
      ),
    );
  }
}
