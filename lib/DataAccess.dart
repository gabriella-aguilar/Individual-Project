import 'dart:async';
import 'dart:io' show Directory;
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Classes/CommentsClass.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;


class DataAccess{
  int _version = 2;

  DataAccess._privateConstructor();
  static final DataAccess instance = DataAccess._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
   // _create(_database, _version);
    populateSymptoms();

    return _database;
  }

  _initDatabase () async{
    WidgetsFlutterBinding.ensureInitialized();

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tracking.db");
    return await openDatabase(path,
        version: _version,
        onCreate: _create);
  }

  Future _create(Database db, int version) async {

        db.execute("CREATE TABLE loggedSymptoms(date TEXT PRIMARY KEY, name TEXT, comments TEXT, intensity INTEGER, location TEXT, duration INTEGER, intervention TEXT)");
        db.execute("CREATE TABLE meals(date TEXT PRIMARY KEY, name TEXT, gluten INTEGER, alcohol INTEGER, sugar INTEGER, meat INTEGER, dairy INTEGER)");
        db.execute("CREATE TABLE exercise(date TEXT PRIMARY KEY, title TEXT, duration INTEGER, comments TEXT)");
        db.execute("CREATE TABLE symptoms(name PRIMARY KEY, intensity INTEGER, location INTEGER, duration INTEGER, intervention INTEGER)");
        db.execute("CREATE TABLE tracking(name PRIMARY KEY)");
        db.execute("CREATE TABLE comments(date TEXT PRIMARY KEY, comment TEXT)");
      // populateSymptoms();

  }



  Future<void> insertMeal(Meal meal) async {
    final Database db =await database;
    await db.insert(
      'meals',
      meal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).catchError((error) {
      print("Something went wrong: ${error.message}");
    });
  }

  Future<void> insertComment(Comments comment) async {
    print("Inserting Comment*********************************************************");
    final Database db =await database;
    //db.execute("CREATE TABLE comments(date TEXT PRIMARY KEY, comment TEXT)");
    await db.insert(
      'comments',
      comment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).catchError((error) {
      print("Something went wrong: ${error.message}");
    });
    List result = await getAllComments();
    result.forEach((row) => print(row));
  }

  Future<void> insertLogged(LoggedSymptom loggedSymptom) async {
    final Database db =await database;
    await db.insert(
      'loggedSymptoms',
      loggedSymptom.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Adding ${loggedSymptom.getSymptom()}");
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

  Future<void> insertExercise(Activity activity) async {

    final Database db = await database;

    await db.insert(
      'exercise',
      activity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).catchError((error) {
      print("Something went wrong: ${error.message}");
    });
    print("inserting " +activity.getTitle());
    List result = await getAllExercise();
    result.forEach((row) => print(row));
  }

  void populateSymptoms() async{
    final Database db = await database;
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Joint Pain',1,1,1,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Headache',1,0,1,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Menstruation',1,0,0,1)");
    db.rawInsert( "INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Fatigue',1,0,0,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Nausea',1,0,0,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Dizziness',1,1,0,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Swelling',1,1,1,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Cramp',1,1,0,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Fog',1,1,1,1)");
    db.rawInsert("INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Bloating',0,0,0,0)");
    db.rawInsert( "INSERT INTO symptoms(name,intensity,location,duration,intervention) VALUES ('Stomach Cramping',1,0,1,1)");
  }
  
  void fix() async{
    final Database db = await database;
    db.rawUpdate("UPDATE symptoms SET location = 0 WHERE name = Nausea");
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

  Future<List<Comments>> getAllComments() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('comments');
    return List.generate(maps.length, (i) {
      return Comments(
        comment: maps[i]['comment'],
        date: maps[i]['date']
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

  Future<List<Symptom>> getTrackedSymptoms() async{
    final Database db = await database;
    List<Tracking> tracking = await getAllTracking();
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

  Future<List<Symptom>> getSpecificSymptom(String name) async {
    final Database db = await database;
   // final List<Map<String, dynamic>> maps =  await db.rawQuery('SELECT * FROM Symptom WHERE name=?',[name]);
    final List<Map<String, dynamic>> maps = await db.query("symptoms",where: "name = ?",whereArgs: [name]);
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

  void deleteTracking(String tracking) async{
    print("Deleting "+tracking);
    final Database db = await database;
    db.delete('tracking',where: "name = ?" ,whereArgs: [tracking]);
  }

  Future<Map<DateTime,List<LoggedSymptom>>> getLoggedForCalendar() async{
    final Database db = await database;
    List<LoggedSymptom> logged = await getAllLoggedSymptoms();
    Map<DateTime,List<LoggedSymptom>> map = new Map();
    if(logged.isEmpty || logged == null){
      return null;
    }
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
    if(logged.isEmpty || logged == null){
      return null;
    }
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
    if(logged.isEmpty || logged == null){
      return null;
    }
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

