import 'package:flutter/material.dart';

class NavigateToButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String buttonText;

  NavigateToButton(
      {this.color = Colors.red,
      @required this.onPressed,
      this.buttonText = 'Default'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
          textColor: Colors.white,
        ),
      ),
    );
  }
}