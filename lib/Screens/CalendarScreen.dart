import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/DailySymptoms.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Screens/StatsScreen.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tracker/dummyDate.dart';
import '../Context.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<DateTime, List> _events = new Map();
  List _selectedEvents;
  //AnimationController _animationController;
  CalendarController _calendarController;
  void dispose() {
    //_animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    setUp(context);
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    // _events = {
    //   _selectedDay.subtract(Duration(days: 30)): [
    //     'Event A0',
    //     'Event B0',
    //     'Event C0'
    //   ],
    // };

    Map<DateTime,List<LoggedSymptom>> days = Provider.of<UserInfo>(context, listen: false).getcurrentUser().getDailies();

    // for(DailySymptoms d in days){
    //   _events[d.getDate()] = [d];
    // }
    days.forEach((key, value) {
      _events[key] = value;
    });

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400),
    // );

    //_animationController.forward();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
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
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: backBlue,
              ),
              onPressed: () {
                Provider.of<UserInfo>(context, listen: false)
                    .setloggedIn(false);
                Navigator.pop(context);
              },
            );
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
                color: newBlueAccent,
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
              child: Icon(Icons.equalizer, size: 35, color: newBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => StatsPage()),
                );
              },
            ),
            FlatButton(
              child: Icon(Icons.account_circle, size: 35, color: newBlueAccent),
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
      calendarController: _calendarController,
      events: _events,
      //holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        weekendStyle:
        TextStyle().copyWith(color: newBlueAccent, fontSize: 15.0),
        selectedColor: newBlueAccent,
        todayColor: newBlue,
        markersColor: blue3,
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle:
          TextStyle().copyWith(color: newBlueAccent, fontSize: 15.0),
          weekendStyle:
          TextStyle().copyWith(color: newBlueAccent, fontSize: 15.0)),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
        TextStyle().copyWith(color: backBlue, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: newBlueAccent,
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
    // for (Object event in _selectedEvents) {
    //   if(event is DailySymptoms){
    //     DailySymptoms d = event;
    //     List<LoggedSymptom> log = d.getLogged();
    //     for(LoggedSymptom l in log){
    //       Container c = Container(
    //         decoration: BoxDecoration(
    //           border: Border.all(width: 0.8),
    //           borderRadius: BorderRadius.circular(12.0),
    //         ),
    //         margin:
    //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    //         child: Column(
    //           children: [
    //             Text(l.getSymptom().getName(),style: basicText,),
    //
    //           ],
    //         ),
    //       );
    //       view.add(c);
    //     }
    //     view.add(new Text(log.length.toString()));
    //   }
    //
    // }
    for(Object event in _selectedEvents){
      if(event is LoggedSymptom){
        LoggedSymptom ls = event;
        Container c = Container(
          decoration: BoxDecoration(

            border: Border.all(width: 1,color: newBlueAccent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(ls.getSymptom().getName(),style: basicText,),
            subtitle: Text(ls.getComment()),
            trailing: Text(ls.getDate().hour.toString() + ":"+ ls.getDate().minute.toString()),
          ),
        );
        view.add(c);
      }
    }
    return view;
  }
}

