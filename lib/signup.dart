import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/user.dart';
import 'dart:async';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
    final _dobController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _emailControllerConfirm = TextEditingController();
    final _passwordControllerConfirm = TextEditingController();
    String dob = 'Date of Birth';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
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
                    SizedBox(width:10),
                    FlatButton(
                      //elevation: 8.0,
                      child: Text(sDate),
                      textColor: Colors.white,
                      color: newBlue,
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          errorFormatText: 'Enter valid date',
                          errorInvalidText: 'Enter date in valid range',

                        );
                      },
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
                  child: Text('Sign Up'),
                  textColor: Colors.white,
                  color: newBlue,
                  onPressed: () {
                    //NOTE: Initial error checking but needs ton more
                    //confirms match email and password
                    //no fields are empty
                    //email is valid format

                    bool error = false;
                    //Index with Errors
                    // 0 passwords don't match
                    // 1 emails don't match
                    // 2 first name empty
                    // 3 last name empty
                    // 4 dob empty
                    // 5 email 1 empty
                    // 6 email 2 empty
                    // 7 password1 empty
                    //8 password2 empty
                    //9 email invalid
                    List<bool> errorNums = [false, false];
                    if (_passwordController.text.toLowerCase().trim() ==
                        _passwordControllerConfirm.text.toLowerCase().trim()) {
                      error = true;
                      errorNums[0] = true;
                    }
                    if (_emailController.text.toLowerCase().trim() ==
                        _emailControllerConfirm.text.toLowerCase().trim()) {
                      error = true;
                      errorNums[1] = true;
                    }
                    if (_firstNameController.text.isEmpty ||
                        _firstNameController.text == "") {
                      error = true;
                      errorNums[2] = true;
                    }
                    if (_lastNameController.text.isEmpty ||
                        _lastNameController.text == "") {
                      error = true;
                      errorNums[3] = true;
                    }
                    if (_dobController.text.isEmpty ||
                        _dobController.text == "") {
                      //TODO: Needs to be fixed for datetime
                      error = true;
                      errorNums[4] = true;
                    }
                    if (_emailController.text.isEmpty ||
                        _emailController.text == "") {
                      error = true;
                      errorNums[5] = true;
                    }
                    if (_emailControllerConfirm.text.isEmpty ||
                        _emailControllerConfirm.text == "") {
                      error = true;
                      errorNums[6] = true;
                    }
                    if (_passwordController.text.isEmpty ||
                        _passwordController.text == "") {
                      error = true;
                      errorNums[7] = true;
                    }
                    if (_passwordControllerConfirm.text.isEmpty ||
                        _passwordControllerConfirm.text == "") {
                      error = true;
                      errorNums[8] = true;
                    }
                    if (_emailController.text.contains('@')) {
                      error = true;
                      errorNums[9] = true;
                    }

                    if (error == false) {
                      //User newUser = User();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      //TODO:need trigger for error labels

                    }
                  },
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
