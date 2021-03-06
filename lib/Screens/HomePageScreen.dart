import 'package:flutter/material.dart';
import 'package:tracker/Screens/SymptomSelectionScreen.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/LogAMealScreen.dart';
import 'package:tracker/Screens/LogAnActivityScreen.dart';
import 'package:tracker/Screens/LogACommentScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/Screens/StatsScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if(MediaQuery.of(context).viewInsets.bottom != 0){
      FocusScope.of(context).unfocus();
    }


    AppBar a = AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container();

        },
      ),
      centerTitle: true,
      backgroundColor: newBlue,
      title: Text(
        'Home Page',
        style: TextStyle(color: backBlue),
      ),
    );


    double heightAB = a.preferredSize.height * 2;
    final double height = MediaQuery.of(context).size.height - heightAB ;
    final double cHeight = height * 0.25 - 5;
    BottomAppBar b = BottomAppBar (

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
              color: backBlue,
            ),
            onPressed: null,
          ),
          FlatButton(
            child: Icon(Icons.calendar_today, size: 35, color: darkBlueAccent),
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
            child: Icon(Icons.equalizer, size: 35, color: darkBlueAccent),
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
                size: 35, color: darkBlueAccent),
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

    );



    return Scaffold(
      backgroundColor: backBlue,
      bottomNavigationBar: b,
      appBar: a,
      body: ListView(
        //padding: EdgeInsets.symmetric( vertical: 24),
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LogMeal()),
                );
              },
              child:Container(
                  height: cHeight,
                  decoration: BoxDecoration(
                    color: backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: darkBlueAccent),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  //color: Colors.white,
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.fastfood,
                        size: cHeight-20,
                        color: darkBlueAccent,
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
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LogActivity())
                );
              },
              child:Container(
                  height: cHeight,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: darkBlueAccent),
                    ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.fitness_center,
                        size: cHeight-20,
                        color: darkBlueAccent,
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
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SymptomSelectionPage())
                );
              },
              child:Container(
                  height: cHeight,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: backBlue,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: darkBlueAccent),
                    ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.healing,
                        size: cHeight-20,
                        color: darkBlueAccent,
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
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LogComment()),
                );
              },
              child:Container(
                  height: cHeight,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: backBlue,
                    // border: Border(
                    //   bottom: BorderSide(width: 1.0, color: newBlueAccent),
                    // ),
                  ),
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.insert_comment,
                        size: cHeight-20,
                        color: darkBlueAccent,
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