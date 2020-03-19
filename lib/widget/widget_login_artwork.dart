import 'package:flutter/material.dart';

class LoginArtwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/login.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 92),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 64,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
