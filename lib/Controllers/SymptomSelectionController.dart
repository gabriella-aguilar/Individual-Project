import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Context.dart';
import '../dummyDate.dart';

var symptoms;

void setUp(BuildContext context){
  symptoms = Provider.of<UserInfo>(context, listen: false).getcurrentUser().getSymptoms();
}
