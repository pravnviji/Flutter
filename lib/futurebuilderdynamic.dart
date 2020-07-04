import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:NewFlutterApp/futurebuilderdynamicdetail.dart';
import 'package:NewFlutterApp/model/EmployeeModel.dart';

class FutureBuilderDynamic extends StatefulWidget {
  @override
  _FutureBuilderDynamicState createState() => _FutureBuilderDynamicState();
}

class _FutureBuilderDynamicState extends State<FutureBuilderDynamic> {
  Future<List<EmployeeModel>> employeeDetails;

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }


  final String endpointUrl = "http://dummy.restapiexample.com/api/v1/employees";

/* Working 
Future<EmployeeModel> fetchInfo() async{
  final response = await http.get(jsonplaceholder);
  final jsonresponse = json.decode(response.body)['data'];
  debugger();
  return EmployeeModel.fromJson(jsonresponse);
}*/

  Future<List<EmployeeModel>> _getEmployeeDetails(http.Client client) async {
    final response = await client.get(endpointUrl);
    return compute(parseEmployeeDetails, response.body);
  }

  List<EmployeeModel> parseEmployeeDetails(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parsed
        .map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
        .toList();
  }


  /*Widget createEmployeeWidget(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    print("Item count " + values.length.toString());
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return values.isNotEmpty
            ? Column(
                children: <Widget>[
                  ListTile(
                    title: Text(values[index].name),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                ],
              )
            : CircularProgressIndicator();
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dyamic Future Builder Example"),
        ),
        body: new Center(
          child: new Column(
            
           mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: Text(
                    "Dynamic data binding using Future Builder",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                        color: Colors.redAccent),
                  )),
             Expanded(
              child: Container(
              padding: EdgeInsets.all(5),
                height: 30,
                color:Colors.blue[200],
                width: double.infinity,
                child: FutureBuilder(
                  future: _getEmployeeDetails(http.Client()),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        //  ?  EmployeeDetails(employee: snapshot.data)
                        ? Scrollbar(
                            isAlwaysShown: true,
                            controller: _scrollController,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                //  return Text(snapshot.data[index].employeeName);
                                  return FutureBuilderDynamicDetail(
                                    employeeName:snapshot.data[index].employeeName,
                                    employeeAge:snapshot.data[index].employeeAge,
                                    employeeSalary:snapshot.data[index].employeeSalary,
                                     id:snapshot.data[index].id,
                                    );
                                }),
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
              ),
             ),
            ],
          ),
        )
        );
  }
}

class EmployeeDetails extends StatelessWidget {
  final List employee;

  EmployeeDetails({Key key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: employee.length,
      itemBuilder: (context, index) {
        print('Item builder');
        print(employee[index]);
        return Text(employee[index]);
      },
    );
  }
}
