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
        body: Column(children: <Widget>[
          CalendarDatePicker(
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime(1970, 1, 1),
              lastDate: DateTime(2099, 31, 12),
              onDateChanged: (DateTime value) {}),
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
          Spacer(
            flex: 1,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "${date.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => _selectDate(context), // Refer step 3
                child: Text(
                  'Select date',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                color: Colors.greenAccent,
              ),
            ],
          )
        ]));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(1967),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date)
      setState(() {
        date = picked;
      });
  }
}
