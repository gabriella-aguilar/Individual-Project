import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/DataAccess.dart';

Map<DateTime, List> events = new Map();
List selectedEvents;


CalendarController calendarController;
void setUp() async{

  final selectedDay = DateTime.now();
  calendarController = CalendarController();


  Map<DateTime,List<LoggedSymptom>> days = await DataAccess.instance.getLoggedForCalendar();
  Map<DateTime,List<Meal>> meals = await DataAccess.instance.getMealsForCalendar();
  Map<DateTime,List<Activity>> activities = await DataAccess.instance.getActivitiesForCalendar();


  days.forEach((key, value) {
    events[key] = value;

  });

  meals.forEach((key, value) {

    if(events.containsKey(key)){
      List cur = events[key];
      cur.addAll(value);
      events[key] = cur;
    }
    else{events[key] = value;}
    meals[key].forEach((row) => print("Meal: "+row.getName()));
  });

  activities.forEach((key, value) {

    if(events.containsKey(key)){
      List cur = events[key];
      cur.addAll(value);
      events[key] = cur;
    }
    else{events[key] = value;}
    activities[key].forEach((row) => print("Activity: "+row.getTitle()));

  });


  selectedEvents = events[selectedDay] ?? [];
  calendarController = CalendarController();

}
