import 'package:rmrcloud/utils/widget_gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services.dart';
import '../utils.dart';

class ClockOutForm extends StatefulWidget {

  final ValueChanged<int> success;
  final ValueChanged<int> failed;

  ClockOutForm(this.success, this.failed);

  @override
  _ClockOutFormState createState() => _ClockOutFormState();
}

class _ClockOutFormState extends State<ClockOutForm> {
  TextEditingController _noteController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.greenAccent.shade700,
        title: Text(
          "Clock-out",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              controller: _noteController,
              autofocus: false,
              autocorrect: false,
              style: TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: null,
              cursorColor: Colors.black,
              keyboardAppearance: MediaQuery.of(context).platformBrightness,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade50,
                filled: true,
                labelText: "Note",
                hintText: "optional",
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.grey),
                alignLabelWithHint: true,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 3,
                        style: BorderStyle.solid)),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green, style: BorderStyle.solid)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(),
                MaterialButton(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(72),
                    side: BorderSide(color: Colors.green),
                  ),
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 12, bottom: 12),
                    child: Text(
                      "Clock-out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => loadingAlert(),
                        barrierDismissible: false);
                    requestNetwork();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void requestNetwork() async {
    String token = await FlutterSecureStorage().read(key: "token");

    Map<String, String> headers = {
      "Authorization": token,
      "ClockOutLat": currentLatitude.toString(),
      "ClockOutLng": currentLongitude.toString(),
      "ClockOutNote": _noteController.text,
    };

    var response = await clockOutService(headers);

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      widget.success(0);
      Toast_SUCCESS(context, "Congratulations", "Clocked-out Successfully");
    } else{
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      widget.failed(0);
      Toast_ERROR(context, "Error", "Something Went Wrong");
    }
  }
}
