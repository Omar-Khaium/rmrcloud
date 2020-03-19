import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rmrcloud/ui/ui_login.dart';

import '../services.dart';
import '../utils.dart';

class ForgetPasswordUI extends StatefulWidget {
  @override
  _ForgetPasswordUIState createState() => _ForgetPasswordUIState();
}

class _ForgetPasswordUIState extends State<ForgetPasswordUI> {
  bool _autoValidateEmail = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/forget.jpg",
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SafeArea(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Colors.blueGrey.shade700),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: TextFormField(
                            controller: _emailController,
                            onTap: () {
                              setState(() {
                                _autoValidateEmail = true;
                              });
                            },
                            autofocus: false,
                            autocorrect: false,
                            autovalidate: _autoValidateEmail,
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            validator: (val)=>val.isEmpty ? "required" : (RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$').hasMatch(val) ? null : "invalid email"),
                            keyboardAppearance: MediaQuery.of(context).platformBrightness,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade50,
                              filled: true,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black),
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.green)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 3,
                                      style: BorderStyle.solid)),
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green,
                                      style: BorderStyle.solid)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 32, bottom: 32),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(72),
                              side: BorderSide(color: Colors.white),
                            ),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                "Send Mail",
                                style:
                                    TextStyle(color: Colors.blueGrey.shade800),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => loadingAlert());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  loadingAlert() {
    doSendMail();
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: SimpleDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "images/loading.gif",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void doSendMail() async {
    Map<String, String> headers = {
      "EmailAddress": _emailController.text,
    };

    var response = await forgetPasswordService(headers);
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginUI()));
      Toast_SUCCESS(context, "Email Sent", result['message']);
    } else {
      Toast_ERROR(context, "Something Went Wrong!", json.decode(response.body));
    }
  }
}
