import 'package:flutter/material.dart';

class PracticeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(title: Text('Practice Layout')),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.teal,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                  )
                ],
              ),
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
