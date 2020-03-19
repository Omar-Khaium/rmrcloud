import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatsWidget extends StatefulWidget {
  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 160,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "8h 55m",
                              style:
                              Theme.of(context).textTheme.display1.copyWith(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Avg. Office Hour',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 92,
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "13 days",
                              style:
                              Theme.of(context).textTheme.display1.copyWith(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.calendarDay,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Available Leave',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 92,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "- 20m",
                              style:
                              Theme.of(context).textTheme.display1.copyWith(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.percentage,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Improvement',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 160,
                      color: Colors.orange,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "1h 45m",
                              style:
                              Theme.of(context).textTheme.display1.copyWith(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.userClock,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Office Hour Left (Toaday)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
