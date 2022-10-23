import 'package:flutter/material.dart';
import 'package:habit_planner/pages/evaluasi.dart';
import 'package:habit_planner/pages/goalslist.dart';
import 'package:habit_planner/pages/habitslist.dart';
import 'package:habit_planner/pages/kalender.dart';
import 'package:habit_planner/pages/forms/login.dart';
import 'package:habit_planner/services/auth_service.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/cover.jpg'))),
            // <a href="https://www.freepik.com/free-vector/evening-cloudy-sky-purple-background-with-group-cumulus-cirrus-clouds-flat-cartoon-illustration_16607919.htm#query=cartoon%20illustration&position=9&from_view=keyword">Image by macrovector</a> on Freepik
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calendar'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kalender()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Habit'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HabitsList()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.grade),
            title: Text('Goals'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoalsList()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Evaluasi'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Evaluasi()),
              ),
            },
          ),
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
