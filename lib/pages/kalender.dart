import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Kalender();
}

class _Kalender extends State<Kalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: Padding(
      // padding: const EdgeInsets.all(15.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Oktober",
      //         style: TextStyle(
      //           fontSize: 25,
      //           fontWeight: FontWeight.bold,
      //           fontFamily: 'Mulish',
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //     ],
      //   ),
      // )
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(color: Colors.black87, width: 2.0),
              ),
              child: TableCalendar(
                // today's date
                focusedDay: DateTime.now(),
                // earliest possible date
                firstDay: DateTime.utc(2010, 10, 16),
                // latest allowed date
                lastDay: DateTime.utc(2030, 3, 14),
                // default view when displayed
                calendarFormat: CalendarFormat.month,
                // default is Saturday & Sunday but can be set to any day.
                // instead of day, a number can be mentioned as well.
                weekendDays: const [DateTime.sunday, 6],
                // default is Sunday but can be changed according to locale
                startingDayOfWeek: StartingDayOfWeek.monday,
                // height between the day row and 1st date row, default is 16.0
                daysOfWeekHeight: 40.0,
                // height between the date rows, default is 52.0
                rowHeight: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
