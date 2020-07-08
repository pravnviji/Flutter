import 'package:flutter/material.dart';

class TestCalendar extends StatefulWidget {
  TestCalendar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestCalendar createState() => _TestCalendar();
}

class _TestCalendar extends State<TestCalendar> {
  var date = DateTime.now().toUtc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            CalendarDatePicker(
                initialDate: date ?? DateTime.now(),
                firstDate: DateTime(1970, 1, 1),
                lastDate: DateTime(2099, 31, 12),
                onDateChanged: (DateTime value) {},
                currentDate: date ?? DateTime.now()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      date = date.add(Duration(days: -1));
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      date = date.add(Duration(days: 1));
                    });
                  },
                )
              ],
            ),
            Text('Current date: ${date.toString()}'),
          ],
        ));
  }
}
