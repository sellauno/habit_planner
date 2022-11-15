import 'package:habit_planner/pages/utils.dart';

class MyEvents {
  late final String eventTitle;
  late final String eventDay;
  get getEventTitle => this.eventTitle;

  get getEventDay => this.eventDay;

  MyEvents({required this.eventTitle, required this.eventDay});

  @override
  String toString() => eventTitle;

  MyEvents.fromMap(Map<String, dynamic> map) {
    this.eventDay = map['habit'];
    this.eventTitle = map['tglMulai'];
  }
}
