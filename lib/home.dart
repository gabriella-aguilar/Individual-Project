import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/meal.dart';
import 'package:tracker/activity.dart';
import 'package:tracker/comment.dart';
import 'package:tracker/pain.dart';
import 'package:tracker/profile.dart';
import 'package:tracker/stats.dart';
import 'package:tracker/calendar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backBlue,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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
              onPressed: () {},
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
                  size: 35, color: newBlue),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ProfilePage()),
                );
              },
            ),
          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: newBlue,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        //padding: EdgeInsets.symmetric( vertical: 24),
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogMeal()),
              );
            },
            child:Container(
              decoration: BoxDecoration(
                color: backBlue,
                border: Border(
                  bottom: BorderSide(width: 1.0, color: newBlueAccent),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //color: Colors.white,
              child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Icon(
                  Icons.fastfood,
                  size: 75,
                  color: newBlueAccent,
                  semanticLabel: 'food',
                ),
                Text(
                  'Log A Meal',
                  style: TextStyle(fontSize: 20),
                )
              ],)
            )
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogActivity()),
                );
              },
              child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color:backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: newBlueAccent),
                    ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.fitness_center,
                        size: 100,
                        color: newBlueAccent,
                        semanticLabel: 'exercise',
                      ),
                      Text(
                        'Log An Activity',
                        style: TextStyle(fontSize: 20),
                      )
                    ],)
              )
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogPain()),
                );
              },
              child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: newBlueAccent),
                    ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.healing,
                        size: 100,
                        color: newBlueAccent,
                        semanticLabel: 'pain',
                      ),
                      Text(
                        'Log A Pain',
                        style: TextStyle(fontSize: 20),
                      )
                    ],)
              )
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogComment()),
                );
              },
              child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: newBlueAccent),
                    ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.insert_comment,
                        size: 100,
                        color: newBlueAccent,
                        semanticLabel: 'comment',
                      ),
                      Text(
                        'Log A Comment',
                        style: TextStyle(fontSize: 20),
                      )
                    ],)
              )
          )
        ],
      ),
    );
  }
}