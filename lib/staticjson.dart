import 'dart:async';
import 'dart:convert';

import 'package:NewFlutterApp/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:NewFlutterApp/model/StudentModel.dart';

class StaticJson extends StatefulWidget {
  StaticJson({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StaticJson createState() => _StaticJson();
}

class _StaticJson extends State<StaticJson> {
  final ScrollController _scrollController = new ScrollController();
  List<StudentModel> student;
  List studentReOrder = null;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          runSpacing: 20.0,
          children: [
            Column(children: [
              Container(
                child: Text("Static Json Example with Student Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        color: HexColor('#3CB371'))),
              ),
              new Container(
                width: 200,
                height: 300,
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: (student != null)
                      ? ListView.builder(
                          itemCount: student.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(student[index].studentName),
                                subtitle: Text("Score -- " +
                                    student[index].studentScores.toString()));
                          })
                      : new Text('No record found'),
                ),
              )
            ]),
            Spacer(flex: 2),
            Column(children: [
              Container(
                child: Text("Reorder ListView",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        color: HexColor('#3CB371'))),
              ),
              Container(
                width: 200,
                height: 300,
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: (student != null)
                      ? ReorderableListView(
                          onReorder: _updateMyItems,
                          children: List.generate(student.length, (index) {
                            return ListTile(
                              key: ValueKey(index),
                              title: Text('ID: ' +
                                  student[index].studentName.toString()),
                              subtitle:
                                  Text(student[index].studentScores.toString()),
                            );
                          }),
                        )
                      : new Text('No record found'),
                ),
              ),
            ]), /*,
                new Container(
                  width:200,
                  height:300,
                 child: projectWidget(),
                )*/
          ]),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future<String> _loadStudentAsset() async {
    return await rootBundle.loadString('../assets/mock/Student.json');
  }

  void _loadStudent() {
    _loadStudentAsset().then((response) {
      setState(() {
        Iterable list = json.decode(response);
        student = list.map((model) => StudentModel.fromJson(model)).toList();
        studentReOrder = list.toList();
      });
    });
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final StudentModel item = student.removeAt(oldIndex);

    student.insert(newIndex, item);
  }
}
