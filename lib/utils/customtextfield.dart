import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon icons;
  final bool validator;
  final Function onSaved;
  final Function onChanged;
  final TextEditingController controller;
  final String intialVal;

  CustomTextField(
      {this.hintText,
      this.labelText,
      this.icons,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.intialVal});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 0.9,
      child: TextFormField(
        // initialValue: (this.intialVal != "") ? Text(this.intialVal) : 'ture',
        decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            //    border: InputBorder.none,
            hintText: this.hintText,
            labelText: this.labelText,
            icon: this.icons),
        onSaved: this.onSaved,
        onChanged: this.onChanged,
        controller: this.controller,
        validator: (this.validator)
            ? (value) {
                if (value.isEmpty) {
                  return 'Field should not be empty';
                }
                return null;
              }
            : null,
      ),
    );
  }
}
