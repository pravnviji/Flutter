import 'dart:async';
import 'dart:convert';

import 'package:NewFlutterApp/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SilverAppExample extends StatefulWidget {
  @override
  _SilverAppExampleState createState() => _SilverAppExampleState();
}

class _SilverAppExampleState extends State<SilverAppExample> {
  StreamController _postController;

  Future _loadStudentAsset() async {
    return await rootBundle.loadString('assets/mock/Student.json');
  }

  void _loadStudent() async {
    _loadStudentAsset().then((response) async {
      Iterable list = json.decode(response);
      _postController.add(list);
      return list;
    });
  }

  @override
  void initState() {
    _postController = new StreamController();
    _loadStudent();
    super.initState();
  }

  /*Future<String> _loadStudentAsset() async {
  return await rootBundle.loadString('assets/mock/Student.json');
  }*/

/*
  Stream<List<StudentModel>> _studentFinalStream = (() async* {
    rootBundle.loadString('assets/mock/Student.json').then((response) {
      print(response);
      Iterable list = json.decode(response);
      return Stream<List<StudentModel>>.fromIterable(
        <List<StudentModel>>[
          list.map((model) => StudentModel.fromJson(model)).toList(),
        ],
      );
    });
  })();*/

/*
  final ScrollController _scrollController = new ScrollController();
  List<StudentModel> student;

  Future<String> _loadStudentAsset() async {
    return await rootBundle.loadString('assets/mock/Student.json');
  }

  void _loadStudent() {
    _loadStudentAsset().then((response) {
      Iterable list = json.decode(response);
      student = list.map((model) => StudentModel.fromJson(model)).toList();
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbars ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    /* background: Container(
                  height: 100.0,
                  width: double.infinity,
                  child: Text("List of Students",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16.0,
                      )),
                ) */

                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              )
            ];
          },
          body: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("Static Json Example with Student Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          color: HexColor('#3CB371'))),
                ),
                Expanded(
              flex: 2,
              child: StreamBuilder(
                  stream: _postController.stream,
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error);
                    }

                    if (snapshot.hasData) {
                      return ListView.builder(
                          // scrollDirection: Axis.vertical,
                          //physics: ScrollPhysics(),
                          //shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var student = snapshot.data[index];
                            return ListTile(
                              title: Text(student['name']),
                              subtitle: Text(student['id']),
                            );
                          });
                    }
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      return Text('No Posts');
                    }
                  }),
            ),
              ],
            ),
          ),
        ));
  }
}
