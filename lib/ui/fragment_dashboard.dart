import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:rmrcloud/widget/form_clock_in.dart';
import 'package:rmrcloud/widget/form_clock_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rmrcloud/widget/widget_dashboard_date_list.dart';
import 'package:rmrcloud/widget/widget_google_map.dart';
import 'package:rmrcloud/widget/widget_stats.dart';

class DashboardFragment extends StatefulWidget {
  @override
  _DashboardFragmentState createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> with SingleTickerProviderStateMixin {
  GlobalKey _key = GlobalKey<State>();

  bool _isRunningTimer = false;

  int _startTime = 86400;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    restoreTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              key: _key,
              pinned: true,
              expandedHeight: 180.0,
              backgroundColor: Colors.greenAccent.shade700,
              leading: Container(),
              elevation: 8,
              floating: true,
              automaticallyImplyLeading: true,
              flexibleSpace: Center(
                child: ListView(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdidNuwBVsremAuu9OD5XykIER2KUK2Z-c8OeEL1RmuoBJsjSu",
                                  placeholder: (context, url) =>
                                      new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(
                                    Icons.broken_image,
                                    size: 36,
                                  ),
                                  fit: BoxFit.cover,
                                  width: 36,
                                  height: 36,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Evan Islam",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('MMM, yyyy').format(DateTime.now()),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DashboardDateListWidget(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            SliverToBoxAdapter(
              child: ListView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Work Time",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Container(
                                    width: 48,
                                    child: Divider(
                                      thickness: 2,
                                    )),
                              ],
                            ),
                            Center(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onTap: () {
                                  !_isRunningTimer ? doClockIn() : doClockOut();
                                },
                                child: Container(
                                  width: 216,
                                  height: 216,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 4,
                                        color: _isRunningTimer
                                            ? Colors.green.shade100
                                                .withOpacity(.8)
                                            : Colors.red.shade50,
                                        offset: Offset(0, 0),
                                      ),
                                      BoxShadow(
                                        blurRadius: 4,
                                        spreadRadius: 4,
                                        color: Colors.white10,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(144),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          (_isRunningTimer
                                              ? timeFormatter(Duration(
                                                  seconds: 86400 - _startTime))
                                              : "00:00:00"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          (_isRunningTimer
                                              ? FontAwesomeIcons.pause
                                              : FontAwesomeIcons.play),
                                          size: 36,
                                          color: (_isRunningTimer
                                              ? Colors.green.shade300
                                              : Colors.red.shade300),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Tap to clock-${_isRunningTimer ? "out" : "in"}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                  color: Colors.grey.shade500),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: GoogleMapUI(),
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: StatsWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  doClockIn() async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ClockInForm(clockInSuccessful, clockInFailed),fullscreenDialog: true),);
  }

  doClockOut() async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ClockOutForm(clockOutSuccessful, clockOutFailed),fullscreenDialog: true),);
  }

  void startTimer() async {
    String startedAt = await FlutterSecureStorage().read(key: "timerStartedAt");
    if (startedAt == null) {
      await FlutterSecureStorage().write(
          key: "timerStartedAt",
          value: DateTime.now().millisecondsSinceEpoch.toString());
    } else {
      DateTime now = DateTime.now();
      DateTime before =
          new DateTime.fromMicrosecondsSinceEpoch(int.parse(startedAt) * 1000);

      int diff = now.difference(before).inDays;
      if (diff > 0) {
        await FlutterSecureStorage().write(
            key: "timerStartedAt",
            value: DateTime.now().millisecondsSinceEpoch.toString());
      }
    }

    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_startTime < 1) {
            timer.cancel();
          } else {
            _startTime = _startTime - 1;
          }
        },
      ),
    );
  }

  restoreTimer() async {
    String startedAt = await FlutterSecureStorage().read(key: "timerStartedAt");
    if (startedAt != null) {
      DateTime now = DateTime.now();
      DateTime before =
          new DateTime.fromMicrosecondsSinceEpoch(int.parse(startedAt) * 1000);

      int diff = now.difference(before).inSeconds;
      _startTime -= diff;
      setState(() {
        _isRunningTimer = true;
      });
      startTimer();
    }
  }

  void pauseTimer() async {
    if (_timer != null) {
      await FlutterSecureStorage().delete(key: "timerStartedAt");
      _startTime = 86400;
      _timer.cancel();
    }
    setState(() {
      _isRunningTimer = false;
    });
  }

  String timeFormatter(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  @override
  void dispose() {
    if (_timer != null) {
      _startTime = 86400;
      _timer.cancel();
    }
    super.dispose();
  }

  clockInSuccessful(int flag) {
    startTimer();
    setState(() {
      _isRunningTimer = !_isRunningTimer;
    });
  }

  clockInFailed(int flag) {}

  clockOutSuccessful(int flag) {
    pauseTimer();
    setState(() {
      _isRunningTimer = !_isRunningTimer;
    });
  }

  clockOutFailed(int flag) {}
}
