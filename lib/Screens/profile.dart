import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/user.dart';
import 'package:tracker/Screens/home.dart';
import 'package:tracker/Screens/stats.dart';
import 'package:tracker/Screens/calendar.dart';
import 'package:tracker/Screens/editDetails.dart';

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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back,color: backBlue,),
                onPressed: () { Navigator.pop(context); },

              );
            },
          ),
          backgroundColor: newBlue,
          title: Text(
            'Profile Page',
            style: TextStyle(color: backBlue),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: newBlue,
          elevation: 2,
          child:ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonPadding: EdgeInsets.only(bottom: 15,top: 15),
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.home,
                  size: 35,
                  color: newBlueAccent,
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
                child: Icon(Icons.calendar_today, size: 35, color: newBlueAccent),
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
                child: Icon(Icons.equalizer, size: 35, color: newBlueAccent),
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
                    size: 35, color: backBlue),
                onPressed: () {},
              ),
            ],
          ),

        ),
        backgroundColor: backBlue,
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
            children:  <Widget>[
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
                  textColor: backBlue,
                  color: newBlue,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => EditDetailsPage()),
                    );
                  }),
              RaisedButton(
                  elevation: 8.0,
                  child: Text('Edit Tracked Symptoms'),
                  textColor: backBlue,
                  color: newBlue,
                  onPressed: (){

                  }
              ),

            ]),



        );
  }


}
