import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogActivity extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: backBlue,
      body: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: newBlue,
            title: Text('Log an Activity',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}