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
  final _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dateNow = new DateTime.now();
    String sDate = dateNow.day.toString() +
        ' - ' +
        dateNow.month.toString() +
        ' - ' +
        dateNow.year.toString();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();

    _dobController.text= sDate;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _emailControllerConfirm = TextEditingController();
    final _passwordControllerConfirm = TextEditingController();
    String dob = 'Date of Birth';
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
        //automaticallyImplyLeading: false,
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
                      child: Text(_dobController.text),
                      textColor: Colors.white,
                      color: newBlue,
                      onPressed: () => _selectDate(context, dateNow)
                      // { 
                      //   // showDatePicker(
                      //   //   context: context,
                      //   //   initialDate: DateTime.now(),
                      //   //   firstDate: DateTime(1900),
                      //   //   lastDate: DateTime.now(),
                      //   //   errorFormatText: 'Enter valid date',
                      //   //   errorInvalidText: 'Enter date in valid range',
                      //   //
                      //   // );
                      // },
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
                  textColor: Colors.white,
                  color: newBlue,
                  onPressed: () {
                    Navigator.pop(context);
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

   Future<String>_selectDate(BuildContext context, DateTime dateNow) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateNow, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != dateNow){
      String sDate = dateNow.day.toString() +
          ' - ' +
          dateNow.month.toString() +
          ' - ' +
          dateNow.year.toString();
      setState(() {
        _dobController.text = sDate;
      });}
  }
}
