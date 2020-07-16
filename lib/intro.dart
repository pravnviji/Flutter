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
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(children: <Widget>[
              RaisedButton(
                color: Colors.brown[100].withOpacity(0.1),
                onPressed: _fireStateFunction,
                child: (Text('State Example',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _staticJsonAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Static Json Example',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _dynamicDataction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Dynamic Data With FlutterBuilder',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _testCalendarAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Test Calendar',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _flipAnimationAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Flip Animation',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _silverAppAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Silver App Bar',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _userFormAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Form Ex',style: TextStyle(color: Colors.white, fontSize: 16),)),
              ),
              RaisedButton(
                onPressed: _circularClipAction,
                color: Colors.brown[100].withOpacity(0.1),
                child: (Text('Circular clip animation - page navigation',style: TextStyle(color: Colors.white, fontSize: 16),)),
              )
            ]))));
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
