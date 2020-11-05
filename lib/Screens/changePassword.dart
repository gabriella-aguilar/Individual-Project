import 'package:flutter/material.dart';
import 'package:tracker/Screens/login.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/user.dart';
import 'dart:async';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final _passwordController = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: backBlue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text(
          'Change Password',
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                  ),
                  cursorColor: newBlueAccent,
                  obscureText: true,
                ),
                SizedBox(height: 12.0),
                TextField( //TODO:Error checking for pass and email + password rules
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
                    if (_passwordControllerConfirm.text !=
                        _passwordController.text) {
                      _poppin("Your passwords don't match!");
                    } else {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  LoginPage()));
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




  Future<void> _poppin(String problem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error Signing Up"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(problem),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: 8,
              child: Text('Try Again'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


}
