import 'package:habit_planner/pages/utils.dart';

class MyEvents {
  late String eventTitle;
  late String eventDay;

  MyEvents(
      {required this.eventTitle,
      required this.eventDay});

  MyEvents.fromMap(Map<String, dynamic> map) {
    this.eventDay = map['id'];
    this.eventTitle = map['id'];
  }
}
