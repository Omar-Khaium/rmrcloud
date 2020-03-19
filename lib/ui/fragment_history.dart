import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rmrcloud/model/attendance.dart';
import 'package:rmrcloud/model/step.dart';
import 'package:rmrcloud/widget/widget_date_filter.dart';
import 'package:rmrcloud/widget/widget_google_map.dart';

import '../services.dart';

class HistoryFragment extends StatefulWidget {
  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  List<Step> _stepItems = [];
  List<StepItem> _list = [];

  int _currentStep = 0;

  var _future;

  @override
  void initState() {
    _future = _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DateFilterWidget(),
                fullscreenDialog: true)),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(MdiIcons.filter),
                SizedBox(
                  width: 4,
                ),
                Text("Filter"),
              ],
            )),
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if(snapshot.hasData) { return Stepper(
              physics: ScrollPhysics(),
              type: StepperType.vertical,
              steps: _stepItems,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: _currentStep == 0 ? null : onStepCancel,
                      child: const Text('Previous'),
                    ),
                    FlatButton(
                      onPressed: _currentStep == (_stepItems.length - 1)
                          ? null
                          : onStepContinue,
                      child: const Text('Next'),
                    ),
                  ],
                );
              },
              currentStep: _currentStep,
              onStepContinue: () {
                setState(() {
                  _currentStep = _currentStep + 1;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep = _currentStep - 1;
                });
              },
              onStepTapped: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
            );}
            else return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }

  showDetails(Attendance attendance) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: AlertDialog(
              content: SizedBox(
                width: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "In",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.green,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              attendance.clockInTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Note",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                attendance.clockInNote,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 150,
                        child: GoogleMapUI(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Duration",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "${(attendance.timeSpent/3600).toStringAsFixed(2)} hours",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Out",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 48,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                              child: Text(
                            attendance.clockOutTime,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Note",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                attendance.clockOutNote,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 150,
                        child: GoogleMapUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future _getData() async {
    String token = await FlutterSecureStorage().read(key: "token");

    Map<String, String> headers = {
      "Authorization": token,
      "pageno": "1",
      "pagesize": "10",
    };

    var response = await historyService(headers);

    if (response.statusCode == 200) {
      List<Attendance> list = [];

      for(var item in json.decode(response.body)["model"]) {
        Map<String, dynamic> map = Map<String, dynamic>.from(item);
        list.add(Attendance.fromJson(map));
      }

      for(Attendance attendance in list) {
        int index = doesExist(attendance);
        if(index==-1) {
          _list.add(new StepItem(attendance.clockInOutDate, [attendance]));
        } else {
          _list[index].attendances.add(attendance);
        }
      }

      for(StepItem item in _list) {
        _stepItems.add(Step(
          isActive: true,
          title: Text(item.date),
          content: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      "${(item.attendances[index].timeSpent/3600).toStringAsFixed(2)} hours",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'In ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          TextSpan(text: item.attendances[index].clockOutTime),
                          TextSpan(text: " - "),
                          TextSpan(
                              text: 'Out ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          TextSpan(text: item.attendances[index].clockOutTime),
                        ],
                      ),
                    ),
                    trailing: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(
                          Icons.fullscreen,
                          size: 18,
                        ),
                      ),
                      onTap: () => showDetails(item.attendances[index]),
                    ),
                  ),
                );
              },
              itemCount: item.attendances.length),
        ));
      }
      return _list;
    } else {
      return "Failed";
    }
  }

  int doesExist(Attendance attendance) {
    int counter = 0;
    for (StepItem item in _list) {
      if(item.date == attendance.clockInOutDate) {
        return counter;
      }
    }
    return -1;
  }
}
