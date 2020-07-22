import 'package:NewFlutterApp/model/EmployeeModel.dart';
import 'package:NewFlutterApp/userformresult.dart';
import 'package:NewFlutterApp/utils/customtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  @override
  _UserForm createState() => _UserForm();
}

class _UserForm extends State<UserForm> {
  AnimationController animationController;
  Animation<EdgeInsets> animation;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _empIdController = new TextEditingController();
  final TextEditingController _empNameController = new TextEditingController();
  String _empId;
  EmployeeModel model = EmployeeModel();

//  final _textFieldController = TextEditingController();

  _UserForm() {
    _empIdController.addListener(_empIdListen);
  }
  void _empIdListen() {
    if (_empIdController.text.isEmpty) {
      _empId = '';
    } else {
      _empId = _empIdController.text;
    }
  }

  @override
  void initState() {
    super.initState();
    /*  animationController = AnimationController(
          vsync: this,
          duration: Duration(seconds: 2),
        )..addListener(() => setState(() {}));
    
        animation = EdgeInsetsTween(
          end: EdgeInsets.only(left: 0.0, top: 0.0),
          begin: EdgeInsets.only(left: 0.0, top: 15.0),
        ).animate(animationController);
    
        animationController.forward();*/
  }

  dispose() {
    super.dispose();
    _empIdController.dispose();
    _empNameController.dispose();
    // animationController.dispose();
    //_textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dyamic Future Builder Example"),
        ),
        body: Form(
            key: _formKey,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                    minWidth: viewportConstraints.maxWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomTextField(
                            labelText: "Employee Id",
                            controller: _empIdController,
                            intialVal: _empId,
                            hintText: "Please enter your employee id",
                            icons: Icon(Icons.adjust),
                            onSaved: (String value) {
                              //  _formKey.currentState.save();
                              model.id = value;
                              this.model.id = value;
                            },
                            onChanged: (String value) {
                              _formKey.currentState.save();
                              model.id = value;
                            },
                            validator: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomTextField(
                          labelText: "Employee Name",
                          //   intialVal: _empNameController.text,
                          controller: _empNameController,
                          hintText: "Please enter your Name",
                          icons: Icon(Icons.people_outline),
                          validator: true,
                          onChanged: (String value) {
                            _formKey.currentState.save();
                            this.model.employeeName = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomTextField(
                          labelText: "Salary",
                          hintText: "Please enter your Salary",
                          icons: Icon(Icons.apps),
                          validator: true,
                          onChanged: (String value) {
                            this.model.employeeSalary = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                _empIdController.text = this.model.id;
                                _empNameController.text =
                                    this.model.employeeName;
                                this._formKey.currentState.save();
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserFormResult(
                                        employeeModel: this.model)),
                              );
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })));
  }
}
