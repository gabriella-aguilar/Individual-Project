import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/signup.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
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
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
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
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up', style: TextStyle(color: newBlue))),
                FlatButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: newBlue),
                  ),
                  onPressed: () {
                    _passwordController.clear();
                    _usernameController.clear();
                  },
                ),
                RaisedButton(
                  elevation: 8.0,
                  child: Text('Next'),
                  textColor: Colors.white,
                  color: newBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
