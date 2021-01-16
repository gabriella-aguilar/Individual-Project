import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/DailySymptoms.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Screens/StatsScreen.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Controllers/CalendarController.dart';
import 'package:tracker/dummyDate.dart';
import 'package:tracker/DataAccess.dart';
import '../Context.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  Map<DateTime, List> events = new Map();
  List selectedEvents;
  bool hasLogged;
  bool hasMeals;
  bool hasActivities;

  CalendarController calendarController;
  void setUpCalendar() async{

    final selectedDay = DateTime.now();
    calendarController = CalendarController();


    Map<DateTime,List<LoggedSymptom>> days = await DataAccess.instance.getLoggedForCalendar();
    Map<DateTime,List<Meal>> meals = await DataAccess.instance.getMealsForCalendar();
    Map<DateTime,List<Activity>> activities = await DataAccess.instance.getActivitiesForCalendar();

    if(days.isEmpty || days == null){
      print("logged in Empty");
      hasLogged = false;
    }else {
      days.forEach((key, value) {
        print(value.first.getSymptom());
        events[key] = value;
      });
      hasLogged = true;
    }

    if(meals.isEmpty || meals == null){
      hasMeals = false;
    }
    else {
      hasMeals = true;
      meals.forEach((key, value) {
        if (events.containsKey(key)) {
          List cur = events[key];
          cur.addAll(value);
          events[key] = cur;
        }
        else {
          events[key] = value;
        }
        meals[key].forEach((row) => print("Meal: " + row.getName()));
      });
    }

    if(activities.isEmpty || activities == null){
      hasActivities = false;
    }
    else {
      hasActivities = true;
      activities.forEach((key, value) {
        if (events.containsKey(key)) {
          List cur = events[key];
          cur.addAll(value);
          events[key] = cur;
        }
        else {
          events[key] = value;
        }
        activities[key].forEach((row) => print("Activity: " + row.getTitle()));
      });
    }
    setState(() {
      selectedEvents = events[selectedDay] ?? [];
      calendarController = CalendarController();
    });
  }


  void dispose() {
    calendarController.dispose();
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

  Widget build(BuildContext context) {
    setUpCalendar();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            // return IconButton(
            //   icon: const Icon(
            //     Icons.arrow_back,
            //     color: backBlue,
            //   ),
            //   onPressed: () {
            //     Provider.of<UserInfo>(context, listen: false)
            //         .setloggedIn(false);
            //     Navigator.pop(context);
            //   },
            // );
            return Container();
          },
        ),
        backgroundColor: newBlue,
        title: Text(
          'Calendar Page',
          style: TextStyle(color: backBlue),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendar(),
            Column(
              children: _eventsList(),

            )
          ],
        ),
      ),
    );
  }

  TableCalendar _calendar() {
    return TableCalendar(
      calendarController: calendarController,
      events: events,
      //holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        weekendStyle:
        TextStyle().copyWith(color: darkBlueAccent, fontSize: 15.0),
        selectedColor: darkBlueAccent,
        todayColor: newBlue,
        markersColor: newBlue2,
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle:
          TextStyle().copyWith(color: darkBlueAccent, fontSize: 15.0),
          weekendStyle:
          TextStyle().copyWith(color: darkBlueAccent, fontSize: 15.0)),
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

  List<Widget> _eventsList() {
    List<Widget> view = new List<Widget>();
    if(events.isEmpty || events == null){return [new Container()];}
    for(Object event in selectedEvents){
      if(event is LoggedSymptom){
        LoggedSymptom ls = event;

        Container c = Container(
          decoration: BoxDecoration(

            border: Border.all(width: 1,color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(ls.getSymptom(),style: basicText,),
            subtitle: Text(ls.getComment()),
            trailing: Text(ls.getDate()),
          ),
        );
        view.add(c);
      }
      else if(event is Meal){
        Meal ls = event;
        Container c = Container(
          decoration: BoxDecoration(

            border: Border.all(width: 1,color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(ls.getName(),style: basicText,),
            //subtitle: Text(ls.g),
            trailing: Text(ls.getDate()),
          ),
        );
        view.add(c);
      }
      else if(event is Activity){
        Activity ls = event;
        Container c = Container(
          decoration: BoxDecoration(

            border: Border.all(width: 1,color: darkBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(ls.getTitle(),style: basicText,),
            subtitle: Text(ls.getComments()),
            trailing: Text(ls.getDate()),
          ),
        );
        view.add(c);
      }
    }
    return view;
  }
}

