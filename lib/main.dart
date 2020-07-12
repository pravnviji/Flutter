import 'package:flutter/material.dart';
import 'package:NewFlutterApp/intro.dart';
import 'package:flutter/rendering.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  //debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(title: 'Test app'),
      theme: ThemeData(
          primaryColor: Colors.blue[400],
          accentColor: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.blueAccent),
            hintStyle: TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
          )),
    );
  }
}
