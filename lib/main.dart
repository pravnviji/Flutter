import 'package:NewFlutterApp/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './provider_example/services/service_locator.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  //debugPaintSizeEnabled=true;
  setupServiceLocator();
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
      debugShowCheckedModeBanner: false,
      home: IntroPage(title: 'Test app'),
      theme: ThemeData(
          primaryColor: Colors.brown,
          accentColor: Colors.white,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.brown),
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
