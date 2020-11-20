import 'package:flutter/material.dart';


import 'package:tracker/Controllers/LoginController.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/HomePageScreen.dart';


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
          style: TextStyle(color: backBlue),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: newBlue,
      ),
      bottomNavigationBar: BottomAppBar(
        color: backBlue,
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomePage()),
              );
            },
            child:
            Text('Continue As Guest', style: TextStyle(color: newBlue))),
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
                            forgotPasswordPressed(context);
                          },
                        ),
                        FlatButton(
                            onPressed: () {
                              signupPressed(context);
                            },
                            child:
                            Text('Sign Up', style: TextStyle(color: newBlue))),
                        RaisedButton(
                          elevation: 8.0,
                          child: Text('Next'),
                          textColor: Colors.white,
                          color: newBlue,
                          onPressed: () {
                            login(context,_usernameController.text, _passwordController.text);
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
}
