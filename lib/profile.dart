import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/stats.dart';
import 'package:tracker/calendar.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBar(
            backgroundColor: newBlue,
            title: Text(
              'Profile Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Column(children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
              color: newBlueAccent,
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Birthday:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '00/00/0000',
                style: TextStyle(fontSize: 20),
              )
            ]),
          ]),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 15),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonPadding: EdgeInsets.only(bottom: 25),
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.home,
                    size: 35,
                    color: newBlue,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage()),
                    );
                  },
                ),
                FlatButton(
                  child: Icon(Icons.calendar_today, size: 35, color: newBlue),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CalendarPage()),
                    );
                  },
                ),
                FlatButton(
                  child: Icon(Icons.equalizer, size: 35, color: newBlue),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => StatsPage()),
                    );
                  },
                ),
                FlatButton(
                  child: Icon(Icons.account_circle,
                      size: 35, color: newBlueAccent),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
