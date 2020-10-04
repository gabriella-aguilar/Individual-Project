import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogComment extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backBlue,
        body: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: newBlue,
              title: Text('Log a Comment',style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                  cursorColor: newBlueAccent,
                  minLines: 5,
                  maxLines: 6,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: newBlueAccent, width: 5.0),

                      ))),
            ),
          ],
        ));
  }
}
