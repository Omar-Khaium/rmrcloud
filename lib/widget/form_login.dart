import 'dart:convert';

import 'package:rmrcloud/ui/ui_forget_password.dart';
import 'package:rmrcloud/ui/ui_organization_selection.dart';
import 'package:rmrcloud/utils/widget_gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services.dart';
import '../utils.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool _autoValidateEmail = false;
  bool _autoValidatePassword = false;
  bool _isObscureText = true;
  bool _isRemembered = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    restoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        shrinkWrap: true,
        physics: ScrollPhysics(),
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
                top: 16, left: 16, right: 16),
            child: TextFormField(
              controller: _passwordController,
              onTap: () {
                setState(() {
                  _autoValidatePassword = true;
                });
              },
              style: TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              autofocus: false,
              autocorrect: false,
              autovalidate: _autoValidatePassword,
              validator: (val)=>val.isEmpty ? "required" : null,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              keyboardAppearance: MediaQuery.of(context).platformBrightness,
              obscureText: _isObscureText,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.green)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.green,
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
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    },
                    icon: Icon(
                      _isObscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )),
            ),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              "Remember Me",
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black),
            ),
            checkColor: Colors.white,
            activeColor: Colors.green,
            value: _isRemembered,
            onChanged: (flag) {
              setState(() {
                _isRemembered = !_isRemembered;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) =>
                            new ForgetPasswordUI()));
                  },
                ),
                MaterialButton(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(72),
                    side: BorderSide(color: Colors.green),
                  ),
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 12,
                        bottom: 12),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      doLogin();
                      showDialog(
                          context: context,
                          builder: (_) => loadingAlert(),
                          barrierDismissible: false);
                      if (_isRemembered) {
                        reserveData();
                      }
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void doLogin() async {
    await saveCredentials();
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };

    Map<String, String> body = {
      "username": _emailController.text,
      "password": _passwordController.text,
      "grant_type": "password"
    };

    var response = await loginService(headers, body);
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      await FlutterSecureStorage()
          .write(key: "isAutheticated", value: true.toString());
      await FlutterSecureStorage()
          .write(key: "token", value: map['token_type'] + " " + map['access_token']);
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseOrganizationUI()));
    } else if (response.statusCode == 500) {
      Toast_WARNING(context, "Server Error", "Re-check your email addess again.");
    } else {
      Toast_ERROR(context, "Wrong Credentials", "Incorrect password.");
    }
  }

  void reserveData() async {
    var storage = FlutterSecureStorage();
    await storage.write(key: "email", value: _emailController.text);
    await storage.write(key: "password", value: _passwordController.text);
  }

  Future saveCredentials() async {
    var storage = FlutterSecureStorage();
    if (_isRemembered) {
      await storage.write(key: "isRemembered", value: true.toString());
      await storage.write(key: "email", value: _emailController.text);
      await storage.write(key: "password", value: _passwordController.text);
    }
    return;
  }

  void restoreData() async {
    var storage = FlutterSecureStorage();
    String isRememberedByCredentials = await storage.read(key: "isRemembered");
    if (isRememberedByCredentials != null &&
        isRememberedByCredentials == true.toString()) {
      String email = await storage.read(key: "email");
      String password = await storage.read(key: "password");
      setState(() {
        _emailController.text = email;
        _passwordController.text = password;
        _isRemembered = true;
      });
    }
  }
}
