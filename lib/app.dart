import 'package:flutter/material.dart';


import 'Screens/home.dart';
import 'colors.dart';
import 'Screens/login.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: Column(
        children: <Widget>[
          Text('home page'),
        ],
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _trackData,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _trackData = _buildTrackTheme();

ThemeData _buildTrackTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // primaryColor: backBlue,
    // backgroundColor: backBlue,
    // accentColor: newBlueAccent,
    // cardColor: backBlue,
    // splashColor: newBlueAccent,
    // highlightColor: newBlueAccent,
    scaffoldBackgroundColor: backBlue,
    textTheme: _buildTrackTextTheme(base.textTheme),
    primaryTextTheme: _buildTrackTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTrackTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      //   fillColor: backBlue,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: newBlueAccent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: newBlueAccent),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: newBlueAccent),
        ),
        labelStyle: TextStyle(color: newBlueAccent)
    ),
  );
}


TextTheme _buildTrackTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline5: base.headline5.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6.copyWith(fontSize: 18.0),

    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: newBlueAccent,
    bodyColor: newBlueAccent,
  );
}
