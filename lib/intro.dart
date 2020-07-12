import 'package:NewFlutterApp/contact/contactlistpage.dart';
import 'package:NewFlutterApp/fileanimation.dart';
import 'package:NewFlutterApp/futurebuilderdynamic.dart';
import 'package:NewFlutterApp/silverapp.dart';
import 'package:NewFlutterApp/testcalendar.dart';
import 'package:NewFlutterApp/userform.dart';
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
        ),
        RaisedButton(
          onPressed: _dynamicDataction,
          child: (Text('Dynamic Data With FlutterBuilder')),
        ),
        RaisedButton(
          onPressed: _testCalendarAction,
          child: (Text('Test Calendar')),
        ),
        RaisedButton(
          onPressed: _flipAnimationAction,
          child: (Text('Flip Animation')),
        ),
        RaisedButton(
          onPressed: _silverAppAction,
          child: (Text('Silver App Bar')),
        ),
        RaisedButton(
          onPressed: _userFormAction,
          child: (Text('Form Ex')),
        ),
        RaisedButton(
          onPressed: _circularClipAction,
          child: (Text('Circular clip animation - page navigation')),
        )
      ])),
    );
  }

  void _fireStateFunction() {
    print('State Example pressed');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StatePage(title: 'State Page Example')),
    );
  }

  void _staticJsonAction() {
    print('Static Json Button pressed');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StaticJson(title: 'Static Json Example')),
    );
  }

  void _dynamicDataction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FutureBuilderDynamic()),
    );
  }

  void _testCalendarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              TestCalendar(title: 'Test Calendar Functionality')),
    );
  }

  void _flipAnimationAction() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FlipAnimation(title: 'Flip Animation')),
    );
  }

  void _silverAppAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SilverAppExample()),
    );
  }

  void _userFormAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserForm()),
    );
  }

  void _circularClipAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactListPage()),
    );
  }
}
