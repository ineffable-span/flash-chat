import 'package:flutter/material.dart';

import 'package:flash_chat/components/navigate_to_button.dart';
import 'package:flash_chat/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = ' /login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: kInputFieldTextStyle,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputFieldInputDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: kInputFieldTextStyle,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputFieldInputDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            NavigateToButton(
              color: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
