import 'dart:ui';

import 'package:rmrcloud/utils/widget_gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rmrcloud/ui/ui_login.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MdiIcons.lockReset,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("Change Password"),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () => checkTimer(),
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MdiIcons.logoutVariant,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("Logout"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetData() async {
    FlutterSecureStorage storage = new FlutterSecureStorage();
    await storage.delete(key: "isAutheticated");
    await storage.delete(key: "timerStartedAt");
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginUI()));
  }

  checkTimer() async {
    FlutterSecureStorage storage = new FlutterSecureStorage();
    String startedAt = await storage.read(key: "timerStartedAt");
    if (startedAt != null) {
      showDialog(context: context, builder: (_) => clockOutConfirmation());
    } else {
      showDialog(context: context, builder: (_) => logOutConfirmation());
    }
  }

  clockOutConfirmation() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: SimpleDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(0),
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Do you wanna clock-out ?"),
        ),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/timer.gif",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "Close",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  color: Colors.grey.shade100,
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () => showDialog(
                      context: context, builder: (_) => loadingAlert()),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "Clock-Out",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  color: Colors.deepOrange,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  logOutConfirmation() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: SimpleDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(0),
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Are you sure ?"),
        ),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/confuse.gif",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  color: Colors.grey.shade100,
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () {
                    resetData();
                    showDialog(
                        context: context, builder: (_) => loadingAlert());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  color: Colors.deepOrange,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
