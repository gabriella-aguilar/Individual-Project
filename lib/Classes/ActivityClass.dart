import 'package:sqflite/sqflite.dart';
import 'package:tracker/DataAccess.dart';

class Activity {
  // String _title;
  // int _duration;
  // String _comments;
  //
  // Activity(String t, int d, String c){
  //   _title=t;
  //   _duration=d;
  //   _comments=c;
  // }
  //
  // String getTitle(){return _title;}
  // void setTitle(String t){_title = t;}
  //
  // int getDuration(){return _duration;}
  // void setDuration(int d){_duration=d;}
  //
  // String getComments(){return _comments;}
  // void setComments(String c){_comments=c;}

  final String date;
  final String title;
  final int duration;
  final String comments;

  Activity({this.date, this.title, this.duration, this.comments});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
      'duration': duration,
      'comments': comments
    };
  }

  String getTitle(){return title;}

  int getDuration(){return duration;}

  String getDate(){return date;}

  String getComments(){return comments;}


}