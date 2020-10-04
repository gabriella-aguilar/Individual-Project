import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogPain extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: backBlue,
      body: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: newBlue,
            title: Text('Log a Pain',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}