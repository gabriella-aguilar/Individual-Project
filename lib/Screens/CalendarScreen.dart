import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Controllers/CalendarController.dart';

import '../DataAccess.dart';
import '../colors.dart';
import 'HomePageScreen.dart';
import 'ProfileScreen.dart';
import 'StatsScreen.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

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

    // events = {
    //   _selectedDay.subtract(Duration(days: 30)): [
    //     'Event A0',
    //     'Event B0',
    //     'Event C0'
    //   ],
    //   _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
    //   _selectedDay.subtract(Duration(days: 20)): [
    //     'Event A2',
    //     'Event B2',
    //     'Event C2',
    //     'Event D2'
    //   ],
    //   _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
    //   _selectedDay.subtract(Duration(days: 10)): [
    //     'Event A4',
    //     'Event B4',
    //     'Event C4'
    //   ],
    //   _selectedDay.subtract(Duration(days: 4)): [
    //     'Event A5',
    //     'Event B5',
    //     'Event C5'
    //   ],
    //   _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
    //   _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
    //   _selectedDay.add(Duration(days: 1)): [
    //     'Event A8',
    //     'Event B8',
    //     'Event C8',
    //     'Event D8'
    //   ],
    //   _selectedDay.add(Duration(days: 3)):
    //   Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
    //   _selectedDay.add(Duration(days: 7)): [
    //     'Event A10',
    //     'Event B10',
    //     'Event C10'
    //   ],
    //   _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
    //   _selectedDay.add(Duration(days: 17)): [
    //     'Event A12',
    //     'Event B12',
    //     'Event C12',
    //     'Event D12'
    //   ],
    //   _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
    //   _selectedDay.add(Duration(days: 26)): [
    //     'Event A14',
    //     'Event B14',
    //     'Event C14'
    //   ],
    // };
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

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          //_buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
          // Expanded(child: Column(children: eventsList(),))
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: events,
      holidays: _holidays,
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

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : newBlue,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = events.keys.elementAt(events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: eventsList(),
      // children: _selectedEvents
      //     .map((event) => Container(
      //   decoration: BoxDecoration(
      //     border: Border.all(width: 0.8),
      //     borderRadius: BorderRadius.circular(12.0),
      //   ),
      //   margin:
      //   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      //   child: ListTile(
      //     title: Text(event.toString()),
      //     onTap: () => print('$event tapped!'),
      //   ),
      // ))
      //     .toList(),
    );
  }

  List<Widget> eList() {
    List<Widget> view = new List<Widget>();
    if (events == null || events.isEmpty) {
      print("events empty or null");
      return view;
    }
    events.forEach((key, value) {
      view.add(new Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: darkBlueAccent),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(title: Text("booox")),
      ));
    });
    return view;
  }

  List<Widget> eventsList() {
    List<Widget> view = new List<Widget>();
    if (events == null || events.isEmpty) {
      return [new Container()];
    }
    for (Object event in selectedEvents) {
      if (event is LoggedSymptom) {
        LoggedSymptom ls = event;

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
            subtitle: Text(ls.getComment()),
            trailing: Text(ls.getDate()),
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
            trailing: Text(ls.getDate()),
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
            trailing: Text(ls.getDate()),
          ),
        );
        view.add(c);
      }
    }
    print("events size: " + events.length.toString());
    // print("events size" + events.length.toString());
    print("view size: " + view.length.toString());
    return view;
  }

  void setUpCalendar() async {
    print("INSIDE SET UP");

    events = new Map<DateTime, List>();
    final _selectedDay = DateTime.now();

    days = await DataAccess.instance.getLoggedForCalendar();
    meals = await DataAccess.instance.getMealsForCalendar();
    activities = await DataAccess.instance.getActivitiesForCalendar();
    setState(() {
      if (days.isEmpty || days == null) {
        print("logged in Empty or null");
      } else {
        days.forEach((key, value) {
          events[key] = value;
          print("first in logged" + value.first.getSymptom());
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
              List cur = events[k];
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
              List cur = events[k];
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
