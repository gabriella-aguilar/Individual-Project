import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/ActivityClass.dart';

import '../Context.dart';

void submitPressed(BuildContext context,String title,int slider, String comment){
  Activity a = new Activity(title, slider, comment);
  Provider.of<UserInfo>(context, listen: false).getcurrentUser().getActivities().add(a);
  Navigator.pop(context);
}