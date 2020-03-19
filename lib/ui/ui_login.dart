import 'dart:convert';
import 'dart:ui';

import 'package:rmrcloud/widget/form_login.dart';
import 'package:rmrcloud/widget/widget_login_artwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rmrcloud/services.dart';
import 'package:rmrcloud/ui/ui_dashboard.dart';
import 'package:rmrcloud/ui/ui_forget_password.dart';
import 'package:rmrcloud/ui/ui_organization_selection.dart';
import 'package:rmrcloud/utils/widget_gif_loader.dart';

import '../utils.dart';

class LoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .7,
              child: LoginArtwork(),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 8,
                            offset: Offset(
                              0,
                              0,
                            ),
                          )
                        ],
                        color: Colors.white),
                    child: LoginForm(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
