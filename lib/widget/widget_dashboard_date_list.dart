import 'package:flutter/material.dart';
import 'package:rmrcloud/widget/widget_weekdays.dart';

class DashboardDateListWidget extends StatelessWidget {
  List<WeekDaysWidget> _list = [];

  @override
  Widget build(BuildContext context) {
    setDates();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _list.map((item) {
        return Expanded(
          flex: 1,
          child: item,
        );
      }).toList(),
    );
  }

  void setDates() {
    DateTime today = DateTime.now();
    DateTime _firstDayOfTheWeek =
        today.subtract(new Duration(days: (today.weekday - 1)));
    _list.add(WeekDaysWidget(_firstDayOfTheWeek, today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 1)), today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 2)), today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 3)), today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 4)), today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 5)), today.weekday));
    _list.add(WeekDaysWidget(
        _firstDayOfTheWeek.add(Duration(days: 6)), today.weekday));
  }
}
