import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  FancyButton(
      {@required this.onPressedHandler,
      @required this.answerText});

  final Function onPressedHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: onPressedHandler,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          //   mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.amberAccent,
            ),
            SizedBox(
              width: 8.0,
              height: 3.0,
            ),
            Text(
              "$answerText",
              style: new TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      shape: new StadiumBorder(),
    );
  }
}
