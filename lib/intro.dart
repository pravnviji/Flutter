import 'package:flutter/material.dart';
import 'package:NewFlutterApp/statepage.dart';

class IntroPage extends StatefulWidget {
  final String title;

  IntroPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(children: <Widget>[
        RaisedButton(
          onPressed: _fireStateFunction,
          child: (Text('State Example')),
        )
      ])),
    );
  }

  void _fireStateFunction() {
    print('State Example pressed');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StatePage()),
    );
  }
}
