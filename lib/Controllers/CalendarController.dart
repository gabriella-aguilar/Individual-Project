import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/CommentsClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/DataAccess.dart';
Map<DateTime, List> events;
Map<DateTime,List<LoggedSymptom>> days;
Map<DateTime,List<Meal>> meals;
Map<DateTime,List<Activity>> activities;
Map<DateTime,List<Comments>> comments;
List selectedEvents;



