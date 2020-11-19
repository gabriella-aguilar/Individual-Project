import 'package:flutter/material.dart';
import 'package:tracker/Classes/ActivityClass.dart';

void submitPressed(BuildContext context,String title,int slider, String comment){
  Activity a = new Activity(title, slider, comment);
  Navigator.pop(context);
}