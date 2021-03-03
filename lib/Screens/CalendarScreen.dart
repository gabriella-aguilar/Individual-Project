import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/CommentsClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Controllers/CalendarController.dart';
import 'package:tracker/Screens/ViewLoggedSymptomScreen.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Context.dart';
import '../DataAccess.dart';
import '../colors.dart';
import 'HomePageScreen.dart';
import 'ProfileScreen.dart';
import 'StatsScreen.dart';
import 'package:tracker/Screens/ViewMealScreen.dart';
import 'package:tracker/Screens/ViewExerciseScreen.dart';



//TODO: Subtitles for Logged Symptoms aren't efficient

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  Map<DateTime, List> events;
  //List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    print("inside initstate calendar");
    super.initState();


    setUpCalendar();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {

            return Container();
          },
        ),
        backgroundColor: newBlue,
        title: Text(
          'Calendar Page',
          style: TextStyle(color: backBlue),
        ),
        centerTitle: true,
      ),
      backgroundColor: backBlue,
      bottomNavigationBar: BottomAppBar(
        color: newBlue,
        elevation: 2,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: EdgeInsets.only(bottom: 15, top: 15),
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.home,
                size: 35,
                color: darkBlueAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage()),
                );
              },
            ),
            FlatButton(
              child: Icon(Icons.calendar_today, size: 35, color: backBlue),
              onPressed: () {},
            ),
            FlatButton(
              child: Icon(Icons.equalizer, size: 35, color: darkBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => StatsPage()),
                );
              },
            ),
            FlatButton(
              child: Icon(Icons.account_circle, size: 35, color: darkBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          _buildTableCalendar(),

          const SizedBox(height: 8.0),

          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),

        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: darkBlueAccent,
        weekendStyle: TextStyle().copyWith(color: newBlue2),
        todayColor: darkBlueAccent2,
        markersColor: newBlue2,
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: darkBlueAccent2),
        weekdayStyle: TextStyle().copyWith(color: darkBlueAccent2),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: backBlue, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: darkBlueAccent,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)





  Widget _buildEventList() {
    if (selectedEvents == null || selectedEvents.isEmpty) {
      return new Container(height: 0,);
    }
    return Container(
      decoration: BoxDecoration(
        color: backBlue,
        border: Border.all(width: 1, color: darkBlueAccent),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListView(
        children: eventsList(),
      ),
    );
  }



  List<Widget> eventsList() {
    List<Widget> view = new List<Widget>();

    for (Object event in selectedEvents) {
      if (event is LoggedSymptom) {
        LoggedSymptom ls = event;
        String subtitle = ls.getComment();
        if(ls.getSymptom() == "Joint Pain"){
          subtitle = ls.getLocation() + " " + subtitle;
        }
        Container c = Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              ls.getSymptom(),
              style: basicText,
            ),
            subtitle: Text(subtitle),
            trailing: Text(ls.getDate().substring(0,16)),
            onTap: (){
              Provider.of<UserInfo>(context, listen: false).setDate(ls.getDate());
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => ViewLoggedSymptomScreen()),
              );
            },
          ),
        );
        view.add(c);
      } else if (event is Meal) {
        Meal ls = event;
        Container c = Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              ls.getName(),
              style: basicText,
            ),
            //subtitle: Text(ls.g),
            trailing: Text(ls.getDate().substring(0,16)),
            onTap: (){
              Provider.of<UserInfo>(context, listen: false).setDate(ls.getDate());
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => ViewMealScreen()),
              );
            },
          ),
        );
        view.add(c);
      } else if (event is Activity) {
        Activity ls = event;
        Container c = Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              ls.getTitle(),
              style: basicText,
            ),
            subtitle: Text(ls.getComments()),
            trailing: Text(ls.getDate().substring(0,16)),
            onTap: (){
              Provider.of<UserInfo>(context, listen: false).setDate(ls.getDate());
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => ViewExerciseScreen()),
              );
            },
          ),
        );
        view.add(c);
      } else if(event is Comments){
        Comments ls = event;
        Container c = Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              ls.getComment(),
              style: basicText,
            ),
            trailing: Text(ls.getDate().substring(0,16)),
            onTap: (){
              Provider.of<UserInfo>(context, listen: false).setDate(ls.getDate());
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(pageBuilder: (_, __, ___) => ViewExerciseScreen()),
              // );
            },
          ),
        );
        view.add(c);
      }
    }
    // print("events size: " + events.length.toString());
    // // print("events size" + events.length.toString());
    // print("view size: " + view.length.toString());
    return view;
  }

  void setUpCalendar() async {
   // print("INSIDE SET UP");

    events = new Map<DateTime, List>();
    final _selectedDay = DateTime.now();

    days = await DataAccess.instance.getLoggedForCalendar();
    meals = await DataAccess.instance.getMealsForCalendar();
    activities = await DataAccess.instance.getActivitiesForCalendar();
    comments = await DataAccess.instance.getCommentsForCalendar();

    setState(() {
      if (days.isEmpty || days == null) {
        print("logged in Empty or null");
      } else {
        days.forEach((key, value) {
          events[key] = value;
          //print("first in logged" + value.first.getSymptom());
        });
      }

      if (meals == null) {
        print("meals null");
      } else if (meals.isEmpty) {
        print("meals empty");
      } else {
        meals.forEach((key, value) {
          bool found = false;
          events.forEach((k, v) {
            if (key.day == k.day &&
                key.month == k.month &&
                key.year == k.year) {
              found = true;
              List cur = new List();
              cur.addAll(events[k]);
              cur.addAll(value);
              events[k] = cur;
            }
          });

          if (!found) {
            events[key] = value;
          }
          //meals[key].forEach((row) => print("Meal: " + row.getName()));
        });
      }

      if (activities == null) {
        print("exercise null");
      } else if (activities.isEmpty) {
        print("exercise empty");
      } else {
        activities.forEach((key, value) {
          bool found = false;
          events.forEach((k, v) {
            if (key.day == k.day &&
                key.month == k.month &&
                key.year == k.year) {
              found = true;
              List cur =  new List();
              cur.addAll(events[k]);
              cur.addAll(value);
              events[k] = cur;
            }
          });

          if (!found) {
            events[key] = value;
          }
          //activities[key].forEach((row) => print("Activity: " + row.getTitle()));
        });
      }

      if (comments != null && comments.isNotEmpty) {
        comments.forEach((key, value) {
          bool found = false;
          events.forEach((k, v) {
            if (key.day == k.day &&
                key.month == k.month &&
                key.year == k.year) {
              found = true;
              List cur =  new List();
              cur.addAll(events[k]);
              cur.addAll(value);
              events[k] = cur;
            }
          });

          if (!found) {
            events[key] = value;
          }
          //activities[key].forEach((row) => print("Activity: " + row.getTitle()));
        });
      }


      if (events.isNotEmpty && events != null) {
        events.forEach((key, value) {
          print("key: " + key.toString() + "  value: " + value.toString());
        });
      } else if (events == null) {
        print("events is null");
      } else {
        print("EVENTS IS EMPTY");
      }

      selectedEvents = events[_selectedDay] ?? [];
    });
  }
}
