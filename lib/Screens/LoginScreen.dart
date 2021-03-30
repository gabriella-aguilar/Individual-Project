import 'package:flutter/material.dart';

import 'package:tracker/Screens/SymptomPickerScreen.dart';

import 'package:tracker/colors.dart';

import '../DataAccess.dart';
import 'HomePageScreen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  initialChecks(BuildContext context) async {
    List list = await DataAccess.instance.getAllTracking();
    if(list.isNotEmpty && list != null){
      Navigator.pop(context);
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initialChecks(context);
  }

  @override
  Widget build(BuildContext context) {

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
                RaisedButton(
                  elevation: 8.0,
                  child: Text('Start Tracking'),
                  textColor: Colors.white,
                  color: newBlue,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => SymptomPickerPage()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
