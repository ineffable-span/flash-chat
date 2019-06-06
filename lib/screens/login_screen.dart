import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flash_chat/components/navigate_to_button.dart';
import 'package:flash_chat/constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = ' /login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
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
                keyboardType: TextInputType.emailAddress,
                style: kInputFieldTextStyle,
                onChanged: (value) {
                  _email = value;
                },
                decoration: kInputFieldInputDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: kInputFieldTextStyle,
                onChanged: (value) {
                  _password = value;
                },
                decoration: kInputFieldInputDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              NavigateToButton(
                color: Colors.lightBlueAccent,
                buttonText: 'Log In',
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  } finally {
                    setState(() {
                      _showSpinner = false;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
