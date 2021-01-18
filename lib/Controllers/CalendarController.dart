import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/DataAccess.dart';
Map<DateTime, List> events;
void setUpCalendar() async{
  print("INSIDE SET UP");
  events = new Map<DateTime,List>();

  Map<DateTime,List<LoggedSymptom>> days = await DataAccess.instance.getLoggedForCalendar();
  Map<DateTime,List<Meal>> meals = await DataAccess.instance.getMealsForCalendar();
  Map<DateTime,List<Activity>> activities = await DataAccess.instance.getActivitiesForCalendar();

  if(days.isEmpty || days == null){
    print("logged in Empty or null");

  }else {
    days.forEach((key, value) {

      events[key] = value;
      print("first in logged" +value.first.getSymptom());
    });

  }

  if( meals == null){
    print("meals null");
  }
  else if(meals.isEmpty ){
    print ("meals empty");
  }
  else {

    meals.forEach((key, value) {
      bool found = false;
      events.forEach((k, v) {
        if (key.day == k.day && key.month == k.month && key.year == k.year) {
          found = true;
          List cur = events[k];
          cur.addAll(value);
          events[k] = cur;
        }
      });

      if(!found) {
        events[key] = value;
      }
      //meals[key].forEach((row) => print("Meal: " + row.getName()));
    });
  }

  if(activities == null){
      print("exercise null");
  }
  else if(activities.isEmpty ){
    print("exercise empty");
  }
  else {

    activities.forEach((key, value) {
      bool found = false;
      events.forEach((k, v) {
        if (key.day == k.day && key.month == k.month && key.year == k.year) {
          found = true;
          List cur = events[k];
          cur.addAll(value);
          events[k] = cur;
        }
      });

      if(!found) {
        events[key] = value;
      }
      //activities[key].forEach((row) => print("Activity: " + row.getTitle()));
    });
  }

  if(events.isNotEmpty && events != null){
    events.forEach((key, value) {
      print("key: " + key.toString() + "  value: " + value.toString());});

  }
  else if(events == null){
    print("events is null");
  }
  else {
    print("EVENTS IS EMPTY");
  }

}


