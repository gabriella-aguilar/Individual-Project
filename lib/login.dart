import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/signup.dart';
import 'package:tracker/user.dart';
import 'package:tracker/forgotPassword.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Symptom Tracker',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: newBlue,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility_new,
                      color: newBlue,
                      size: 100.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Symptom Tracker',
                      style: TextStyle(fontSize: 24.0, color: newBlue),
                    ),
                  ],
                ),
                //SizedBox(height: 120.0),
                Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      cursorColor: newBlueAccent,
                    ),
                    //SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      cursorColor: newBlueAccent,
                      obscureText: true,
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: newBlue),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child:
                            Text('Sign Up', style: TextStyle(color: newBlue))),
                        RaisedButton(
                          elevation: 8.0,
                          child: Text('Next'),
                          textColor: Colors.white,
                          color: newBlue,
                          onPressed: () {
                            if (_usernameController.text.trim() ==
                                sampleU.getEmail() &&
                                _passwordController.text.trim() ==
                                    sampleU.getPassword()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            } else {
                              _showInvalidLogin();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showInvalidLogin() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your username or password is incorrect.'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: 8,
              child: Text('Try Again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
