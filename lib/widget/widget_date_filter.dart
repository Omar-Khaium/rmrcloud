import 'package:flutter/material.dart';

class DateFilterWidget extends StatefulWidget {
  @override
  _DateFilterWidgetState createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[],
      ),
    );
  }
}
