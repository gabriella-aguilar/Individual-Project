import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/user.dart';
import 'package:tracker/home.dart';
import 'package:tracker/stats.dart';
import 'package:tracker/calendar.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final _currentUser = sampleU;
    var dateNow = _currentUser.getDob();
    String sDate = dateNow.day.toString() +
        ' - ' +
        dateNow.month.toString() +
        ' - ' +
        dateNow.year.toString();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: newBlue,
          title: Text(
            'Profile Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: backBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 100,
                            color: newBlueAccent,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Name: ' +
                            _currentUser.getFirstName() +
                            ' ' +
                            _currentUser.getLastName(),
                        style: basicText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email: ' + _currentUser.getEmail(),
                        style: basicText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'DOB: ' + sDate,
                        style: basicText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                          elevation: 8.0,
                          child: Text('Edit Details'),
                          textColor: Colors.white,
                          color: newBlue,
                          onPressed: () {}),
                      RaisedButton(
                          elevation: 8.0,
                          child: Text('Edit Tracked Symptoms'),
                          textColor: Colors.white,
                          color: newBlue,
                          onPressed: (){

                          }
                      ),
                      RaisedButton(
                          elevation: 8.0,
                          child: Text('Change Password'),
                          textColor: Colors.white,
                          color: newBlue,
                          onPressed: () {}),
                    ])),
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
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => HomePage()),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
