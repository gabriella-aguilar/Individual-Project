import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/home.dart';
import 'package:tracker/profile.dart';
import 'package:tracker/stats.dart';

class CalendarPage extends StatelessWidget {
  Widget build(BuildContext context) {
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
        title: Text('Calendar Page',style: TextStyle(color: backBlue),),
      ),
      backgroundColor: backBlue,
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
            child: Icon(Icons.calendar_today, size: 35, color: backBlue),
            onPressed: () {},
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
                size: 35, color: newBlueAccent),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Icon(
            Icons.calendar_today,
            size: 200,
            color: newBlueAccent,
          ),

        ],
      ),
    );
  }
}
