import 'package:NewFlutterApp/futurebuilderdynamic.dart';
import 'package:flutter/material.dart';
import 'package:NewFlutterApp/statepage.dart';
import 'package:NewFlutterApp/staticjson.dart';

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
        ),
        RaisedButton(
          onPressed: _staticJsonAction,
          child: (Text('Static Json Example')),
        ), RaisedButton(
          onPressed: _dynamicDataction,
          child: (Text('Dynamic Data With FlutterBuilder')),
        )
      ])),
    );
  }
  

  void _fireStateFunction() {
    print('State Example pressed');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StatePage(title:'State Page Example')),
    );
  }

  void _staticJsonAction() {
    print('Static Json Button pressed');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StaticJson(title:'Static Json Example')),
    );
  }

  void _dynamicDataction(){
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FutureBuilderDynamic()),
    );
  }
}
