import 'dart:async';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/TrackingClass.dart';

import 'Context.dart';

class DataAccess{
  DataAccess._privateConstructor();
  static final DataAccess instance = DataAccess._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await dataAccess();
    return _database;
  }

  dataAccess () async{
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(

      join(await getDatabasesPath(), 'tracking_database.db'),

      onCreate: (db, version) {
        db.execute("CREATE TABLE loggedSymptoms(date TEXT PRIMARY KEY, name TEXT FOREIGN KEY, comments TEXT, intensity INTEGER, location TEXT, duration INTEGER, intervention TEXT)");
        db.execute("CREATE TABLE meals(date TEXT PRIMARY KEY, name TEXT, gluten INTEGER, alcohol INTEGER, sugar INTEGER, meat INTEGER, dairy INTEGER)");
        db.execute("CREATE TABLE exercise(date TEXT PRIMARY KEY, title TEXT, duration INTEGER, comments TEXT)");
        db.execute("CREATE TABLE symptoms(name PRIMARY KEY, intensity INTEGER, location INTEGER, duration INTEGER, intervention INTEGER)");
        db.execute("CREATE TABLE tracking(name PRIMARY KEY)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Joint Pain',true,true,true,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Headache',true,false,true,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Menstruation',true,false,false,true)");
        db.execute( "INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Fatigue',true,false,false,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Nausea',true,true,false,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Dizziness',true,true,false,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Swelling',true,true,true,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Cramp',true,true,false,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Fog',true,true,true,true)");
        db.execute("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Bloating',false,false,false,false)");
        db.execute( "INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Stomach Cramping',true,false,true,true)");
      },

      version: 1,
    );
  }

  Future<void> insertExercise(Activity activity) async {
    final Database db = await database;
    await db.insert(
      'exercise',
      activity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMeal(Meal meal) async {
    final Database db =await database;
    await db.insert(
      'meals',
      meal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLogged(LoggedSymptom loggedSymptom) async {
    final Database db =await database;
    await db.insert(
      'loggedSymptoms',
      loggedSymptom.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTracking(Tracking tracking) async {
    final Database db =await database;
    await db.insert(
      'tracking',
      tracking.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSymptom(Symptom symptom) async {
    final Database db = await database;
    await db.insert(
      'symptoms',
      symptom.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Activity>> getAllExercise() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('exercise');
    return List.generate(maps.length, (i) {
      return Activity(
          date: maps[i]['date'],
          title: maps[i]['title'],
          duration: maps[i]['duration'],
          comments: maps[i]['comments']
      );
    });
  }

  Future<List<Meal>> getAllMeals() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meals');
    return List.generate(maps.length, (i) {
      return Meal(
          date: maps[i]['date'],
          name: maps[i]['name'],
          gluten: maps[i]['gluten'],
          alcohol: maps[i]['alcohol'],
          sugar: maps[i]['sugar'],
          meat: maps[i]['meat'],
          dairy: maps[i]['dairy']
      );
    });
  }

  Future<List<Symptom>> getAllSymptoms() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('symptoms');
    return List.generate(maps.length, (i) {
      return Symptom(
          name: maps[i]['name'],
          intensity: maps[i]['intensity'],
          duration: maps[i]['duration'],
          location: maps[i]['location'],
          intervention: maps[i]['intervention']
      );
    });
  }

  Future<List<Tracking>> getAllTracking() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tracking');
    return List.generate(maps.length, (i) {
      return Tracking(
        name: maps[i]['name'],
      );
    });
  }

  Future<List<LoggedSymptom>> getAllLoggedSymptoms() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('loggedSymptoms');
    return List.generate(maps.length, (i) {
      return LoggedSymptom(
          name: maps[i]['name'],
          date: maps[i]['date'],
          intensity: maps[i]['intensity'],
          duration: maps[i]['duration'],
          location: maps[i]['location'],
          intervention: maps[i]['intervention'],
          comments: maps[i]['comments']
      );
    });
  }

  Future<List<Symptom>> getTrackedSymptoms(List<Tracking> tracking) async{
    final Database db = await database;
    String query ='SELECT * FROM Symptom WHERE name=?';
    List<String> names = new List<String>();
    for(Tracking track in tracking){
      query += ' OR name=?';
      names.add(track.getName());
    }
    final List<Map<String, dynamic>> maps =  await db.rawQuery(query,names);
    return List.generate(maps.length, (i) {
      return Symptom(
          name: maps[i]['name'],
          intensity: maps[i]['intensity'],
          duration: maps[i]['duration'],
          location: maps[i]['location'],
          intervention: maps[i]['intervention']
      );
    });
  }

  Future<Map<DateTime,List<LoggedSymptom>>> getLoggedForCalendar() async{
    final Database db = await database;
    List<LoggedSymptom> logged = await getAllLoggedSymptoms();
    Map<DateTime,List<LoggedSymptom>> map = new Map();
    for(LoggedSymptom loggedSymptom in logged){
      DateTime date = DateTime.parse(loggedSymptom.getDate());
      if(map.containsKey(date)){
        List<LoggedSymptom> cur = map[date];
        cur.add(loggedSymptom);
        map[date] = cur;
      }
      else{
        map[date] = [loggedSymptom];
      }
    }

    return map;

  }

  Future<Map<DateTime,List<Meal>>> getMealsForCalendar() async{
    final Database db = await database;
    List<Meal> logged = await getAllMeals();
    Map<DateTime,List<Meal>> map = new Map();
    for(Meal loggedMeal in logged){
      DateTime date = DateTime.parse(loggedMeal.getDate());
      if(map.containsKey(date)){
        List<Meal> cur = map[date];
        cur.add(loggedMeal);
        map[date] = cur;
      }
      else{
        map[date] = [loggedMeal];
      }
    }

    return map;

  }

  Future<Map<DateTime,List<Activity>>> getActivitiesForCalendar() async{
    final Database db = await database;
    List<Activity> logged = await getAllExercise();
    Map<DateTime,List<Activity>> map = new Map();
    for(Activity loggedActivity in logged){
      DateTime date = DateTime.parse(loggedActivity.getDate());
      if(map.containsKey(date)){
        List<Activity> cur = map[date];
        cur.add(loggedActivity);
        map[date] = cur;
      }
      else{
        map[date] = [loggedActivity];
      }
    }

    return map;

  }

}

