import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/symptomPicker.dart';
import 'package:tracker/user.dart';
import 'dart:async';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailControllerConfirm = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();
  String _dob = '';

  @override
  Widget build(BuildContext context) {
    if(_dob == ''){
      _dob = dateFormat(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back,color: backBlue,),
              onPressed: () { Navigator.pop(context); },

            );
          },
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: backBlue),
        ),
        centerTitle: true,
        backgroundColor: newBlue,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                Icon(
                  Icons.accessibility_new,
                  color: newBlue,
                  size: 50.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Symptom Tracker',
                  style: TextStyle(fontSize: 24.0, color: newBlue),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  cursorColor: newBlueAccent,
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  cursorColor: newBlueAccent,
                ),
                SizedBox(height: 12.0),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DOB'),
                    SizedBox(width: 10),
                    FlatButton(
                      //elevation: 8.0,
                      child: Text(_dob),
                      textColor: backBlue,
                      color: newBlue,
                      onPressed: () => _selectDate(context)
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  cursorColor: newBlueAccent,
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _emailControllerConfirm,
                  decoration: InputDecoration(
                    labelText: 'Confirm Email',
                  ),
                  cursorColor: newBlueAccent,
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  cursorColor: newBlueAccent,
                  obscureText: true,
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _passwordControllerConfirm,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  cursorColor: newBlueAccent,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  elevation: 8.0,
                  child: Text('Next'),
                  textColor: backBlue,
                  color: newBlue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=>SymptomPickerPage(),
                        )
                    );},
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

   _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != DateTime.now()){


      setState(() {
       // _dobController.text = sDate;
        _dob = dateFormat(picked);
      });}
  }

  String dateFormat(DateTime d){
    String sDate = d.day.toString() +
        ' - ' +
        d.month.toString() +
        ' - ' +
        d.year.toString();
    return sDate;
  }
}
