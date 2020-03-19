import 'package:rmrcloud/model/attendance.dart';

class StepItem {
  String _date;
  List<Attendance> _attendances;

  StepItem(this._date, this._attendances);

  List<Attendance> get attendances => _attendances;

  set attendances(List<Attendance> value) {
    _attendances = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }
}