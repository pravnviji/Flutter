import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
       Text("Thank you for your feedback"),
          Text("Network image"),
          Image.network('https://image.shutterstock.com/image-photo/smart-city-iot-internet-things-600w-1160793658.jpg',width: 100,height: 100,),
          Text("Asset image"),
          Image.asset('assets/images/diamond.png',width: 100,height: 100,)
    ]));
  }
}
