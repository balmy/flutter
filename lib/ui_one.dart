import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "flutter one",home: new myButton ()));
}

class myButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap :() {
        print('you gesture listened');
      },
      child: new Container(
        height: 66.0,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(3.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('click me'),
        ),
      ),
    );
  }
}

