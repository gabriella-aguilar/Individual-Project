import 'package:flutter/material.dart';

const newBlue =  Colors.blue;
const newBlue2 =  Colors.blueAccent;
const darkBlueAccent = const Color(0xFF000080);
const darkBlueAccent2 = Colors.black;
const backBlue = Colors.white;
const backBlue2 = const Color(4293516493);



const basicText = TextStyle(
  fontSize: 18,
  color: darkBlueAccent
);

const errorText = TextStyle(
    fontSize: 18,
    color: Colors.red,
    fontWeight: FontWeight.bold
);

String dateFormat(DateTime d) {
  String sDate = d.day.toString() +
      '-' +
      d.month.toString() +
      '-' +
      d.year.toString();
  return sDate;
}

String fullDateFormat(DateTime d){
  String sDate = d.day.toString() +
      '-' +
      d.month.toString() +
      '-' +
      d.year.toString() +
      ' ' +
      d.hour.toString() +
      ':' ;
  if(d.minute < 10){
    sDate += '0';
  }
  sDate += d.minute.toString();
  return sDate;
}