import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekDaysWidget extends StatelessWidget {
  final DateTime _date;
  final int _today;

  WeekDaysWidget(this._date, this._today);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: (_today == _date.weekday) ? Colors.white : Colors.transparent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('E').format(_date),
            style: Theme.of(context).textTheme.button.copyWith(
                color: (_today == _date.weekday)
                    ? ((_today == 6 || _today == 7)
                        ? Colors.redAccent.shade400
                        : Colors.green)
                    : Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            _date.day.toString(),
            style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                color: (_today == _date.weekday)
                    ? ((_today == 6 || _today == 7)
                        ? Colors.redAccent.shade400
                        : Colors.green)
                    : Colors.white),
          ),
        ],
      ),
    );
  }
}
