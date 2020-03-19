import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rmrcloud/ui/ui_dashboard.dart';
import 'package:rmrcloud/ui/ui_login.dart';

class LauncherUI extends StatefulWidget {
  @override
  _LauncherUIState createState() => _LauncherUIState();
}

class _LauncherUIState extends State<LauncherUI> {

  var _future;

  @override
  void initState() {
    _future = whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot){
          if(snapshot.hasData) {
            if(snapshot.data.toString().isEmpty) {
              return new LoginUI();
            } else {
              return new DashboardUI();
            }
          } else {
            return LinearProgressIndicator(backgroundColor: Colors.black12,);
          }
        },
      ),
    );
  }

  whereToGo() async {
    var securedDB = new FlutterSecureStorage();
    String flag = await securedDB.read(key: "isAutheticated");
    return flag==null ? "" : flag;
  }
}
