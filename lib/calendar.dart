import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/profile.dart';
import 'package:tracker/stats.dart';

class CalendarPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBar(
            backgroundColor: newBlue,
            title: Text('Calendar Page',style: TextStyle(color: Colors.white),),
          ),
          Icon(
            Icons.calendar_today,
            size: 200,
            color: newBlueAccent,
          ),
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
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:(_, __, ___) => HomePage()),
                    );
                  },
                ),
                FlatButton(
                  child: Icon(Icons.calendar_today, size: 35, color: newBlueAccent),
                  onPressed: (){},
                ),
                FlatButton(
                  child: Icon(Icons.equalizer, size: 35, color: newBlue),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:(_, __, ___) => StatsPage()),
                    );
                  },
                ),
                FlatButton(
                  child: Icon(Icons.account_circle, size: 35, color: newBlue),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:(_, __, ___) => ProfilePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
