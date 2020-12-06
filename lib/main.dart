import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/DataAccess.dart';
import 'app.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
        create: (context) => UserInfo(),
        child: MyApp()
    )
  );
}

