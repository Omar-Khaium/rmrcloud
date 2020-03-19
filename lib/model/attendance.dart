import 'package:rmrcloud/utils.dart';

class Attendance {
  int _id;
  String _clockInOutDate;
  String _clockInTime;
  String _clockOutTime;
  String _clockInNote;
  String _clockOutNote;
  double _clockInLatitude;
  double _clockInLongitude;
  double _clockOutLatitude;
  double _clockOutLongitude;
  int _timeSpent;

  Attendance(this._id, this._clockInOutDate, this._clockInTime,
      this._clockOutTime, this._clockInNote, this._clockOutNote,
      this._clockInLatitude, this._clockInLongitude, this._clockOutLatitude,
      this._clockOutLongitude, this._timeSpent);

  Attendance.fromJson(Map<String,dynamic> map) {
    this._id = map["Id"];
    this._clockInOutDate = map["ClockInOutDate"];
    this._clockInTime = map["ClockInTime"];
    this._clockOutTime = map["ClockOutTime"];
    this._clockInNote = map["ClockInNote"];
    this._clockOutNote = map["ClockOutNote"];
    this._clockInLatitude = check(map["ClockInPosition"].toString().split(" ")[0]);
    this._clockInLongitude = check(map["ClockInPosition"].toString().split(" ")[1]);
    this._clockOutLatitude = check(map["ClockOutPosition"].toString().split(" ")[0]);
    this._clockOutLongitude = check(map["ClockOutPosition"].toString().split(" ")[1]);
    this._timeSpent = int.parse(map["TimeSpent"]);
  }

  int get timeSpent => _timeSpent;

  set timeSpent(int value) {
    _timeSpent = value;
  }

  double get clockOutLongitude => _clockOutLongitude;

  set clockOutLongitude(double value) {
    _clockOutLongitude = value;
  }

  double get clockOutLatitude => _clockOutLatitude;

  set clockOutLatitude(double value) {
    _clockOutLatitude = value;
  }

  double get clockInLongitude => _clockInLongitude;

  set clockInLongitude(double value) {
    _clockInLongitude = value;
  }

  double get clockInLatitude => _clockInLatitude;

  set clockInLatitude(double value) {
    _clockInLatitude = value;
  }

  String get clockOutNote => _clockOutNote;

  set clockOutNote(String value) {
    _clockOutNote = value;
  }

  String get clockInNote => _clockInNote;

  set clockInNote(String value) {
    _clockInNote = value;
  }

  String get clockOutTime => _clockOutTime;

  set clockOutTime(String value) {
    _clockOutTime = value;
  }

  String get clockInTime => _clockInTime;

  set clockInTime(String value) {
    _clockInTime = value;
  }

  String get clockInOutDate => _clockInOutDate;

  set clockInOutDate(String value) {
    _clockInOutDate = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}
