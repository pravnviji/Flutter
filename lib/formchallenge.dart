import 'dart:ui';

import 'package:flutter/material.dart';

class FormChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Challenge Flutter')),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.brown,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        'https://media-exp1.licdn.com/dms/image/C5603AQHEPWuzejYKGQ/profile-displayphoto-shrink_200_200/0?e=1600300800&v=beta&t=gnCTyD9AkJa69NLADWR4kyd6WtLRmf23HtBQ67JFmlo')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Praveen Babu',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  color: Colors.black45,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      '+60 1117766585',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  color: Colors.black45,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Text(
                      'praveenbabu.it2009@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),

                /*
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
                        child: TextField(
                          controller:
                              TextEditingController(text: "+60 11192323023"),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 35.0),
                        child: TextField(
                          controller: TextEditingController(
                              text: "praveenbabu.it2009@gmail.com"),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                          ),
                        ),
                      ),*/
              ]),
        ),
      ),
    );
  }
}
