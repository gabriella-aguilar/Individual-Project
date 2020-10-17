import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/dummyDate.dart';
import 'dart:async';

class SymptomPickerPage extends StatefulWidget {
  @override
  _SymptomPickerPageState createState() => _SymptomPickerPageState();
}

class _SymptomPickerPageState extends State<SymptomPickerPage> {
  List symptoms = getDummyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pick Your Symptoms',
            style: TextStyle(color: Colors.white),
          ),
          //automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: newBlue,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              RaisedButton(
                elevation: 8.0,
                child: Text('Sign Up'),
                textColor: Colors.white,
                color: newBlue,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));},
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}
