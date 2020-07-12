import 'dart:convert';

import 'package:NewFlutterApp/HexColor.dart';
import 'package:NewFlutterApp/model/StudentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SilverAppExample extends StatefulWidget {
  @override
  _SilverAppExample createState() => _SilverAppExample();
}

class _SilverAppExample extends State<SilverAppExample> {
  final ScrollController _scrollController = new ScrollController();
  List<StudentModel> student;

  @override
  void initState() {
    super.initState();
    _loadStudent();
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
                title: Text("Collapsing Toolbar",
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
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
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
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
