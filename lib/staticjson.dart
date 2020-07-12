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
  final ScrollController _scrollController =
      new ScrollController(initialScrollOffset: 50.0);
  List<StudentModel> student;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  }

  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ConstrainedBox(
                  constraints: new BoxConstraints.tight(Size(800.0, 800.0)),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        top: 0.0,
                        left: 0.0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.red,
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      "Static Json Example with Student Data",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial',
                                        color: Colors.black,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.red[100],
                                    padding: EdgeInsets.all(10),
                                    child: (student != null)
                                        ? ListView.builder(
                                            itemCount: student.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                  title: Text(student[index]
                                                      .studentName),
                                                  subtitle: Text("Score -- " +
                                                      student[index]
                                                          .studentScores
                                                          .toString()));
                                            })
                                        : new Text('No record found'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          top: MediaQuery.of(context).size.height * 0.45,
                          left: 0.0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 0.0,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 100.0,
                                maxHeight: MediaQuery.of(context).size.height,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color: Colors.green[300],
                                        ),
                                        color: Colors.amber,
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("Reorder ListView",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Arial',
                                              color: Colors.black)),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 200.0,
                                        width: double.infinity,
                                        color: Colors.amber[100],
                                        alignment: Alignment.center,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          controller: _scrollController,
                                          child: (student != null)
                                              ? ReorderableListView(
                                                  onReorder: _updateMyItems,
                                                  children: List.generate(
                                                      student.length, (index) {
                                                    return ListTile(
                                                      key: ValueKey(index),
                                                      title: Text(
                                                        'ID: ' +
                                                            student[index]
                                                                .studentName
                                                                .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      subtitle: Text(
                                                        student[index]
                                                            .studentScores
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    );
                                                  }),
                                                )
                                              : new Text('No record found'),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                    ],
                  ))
            ]));
    /*,
                new Container(
                  width:200,
                  height:300,
                 child: projectWidget(),
                )*/

    /* ),
          ]),*/
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future<String> _loadStudentAsset() async {
    return await rootBundle.loadString('../assets/mock/Student.json');
  }

  void _loadStudent() {
    _loadStudentAsset().then((response) {
      setState(() {
        Iterable list = json.decode(response);
        student = list.map((model) => StudentModel.fromJson(model)).toList();
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
