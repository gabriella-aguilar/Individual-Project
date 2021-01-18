import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';

import '../Context.dart';
import '../DataAccess.dart';

class StatsPage extends StatefulWidget {

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;

  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    _setUpStats();
  }

  _setUpStats() async{
    Map <DateTime,List> events = new Map<DateTime, List>();
    final _today = DateTime.now();

    Map <DateTime,List>days = await DataAccess.instance.getLoggedForCalendar();
    Map <DateTime,List>meals = await DataAccess.instance.getMealsForCalendar();
    Map <DateTime,List>activities = await DataAccess.instance.getActivitiesForCalendar();

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
    




    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    setState(() {
      rawBarGroups = items;

      showingBarGroups = rawBarGroups;
    });

  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [newBlue],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [darkBlueAccent],
        width: width,
      ),
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            // return IconButton(
            //   icon: const Icon(Icons.arrow_back,color: backBlue,),
            //   onPressed: () {
            //     Provider.of<UserInfo>(context, listen: false).setloggedIn(false);
            //     Navigator.pop(context); },
            //
            // );
            return Container();
          },
        ),
        backgroundColor: newBlue,
        title: Text('Stats Page',style: TextStyle(color: backBlue),),
      ),
      bottomNavigationBar: BottomAppBar(
        color: newBlue,
        elevation: 2,
        child:ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: EdgeInsets.only(bottom: 15,top: 15),
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
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomePage()),
                );
              },
            ),
            FlatButton(
              child: Icon(Icons.calendar_today, size: 35, color: darkBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => CalendarPage()),
                );
              },
            ),
            FlatButton(
              child: Icon(Icons.equalizer, size: 35, color: backBlue),
              onPressed: () {

              },
            ),
            FlatButton(
              child: Icon(Icons.account_circle,
                  size: 35, color: darkBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ProfilePage()),
                );
              },
            ),
          ],
        ),

      ),
      backgroundColor: backBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          AspectRatio(
            aspectRatio: 1,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              color: backBlue2,//const Color(0xff2c4260),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        makeTransactionsIcon(),
                        const SizedBox(
                          width: 38,
                        ),
                        const Text(
                          'Transactions',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'state',
                          style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BarChart(
                          BarChartData(
                            maxY: 20,
                            barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  getTooltipItem: (_a, _b, _c, _d) => null,
                                ),
                                touchCallback: (response) {
                                  if (response.spot == null) {
                                    setState(() {
                                      touchedGroupIndex = -1;
                                      showingBarGroups = List.of(rawBarGroups);
                                    });
                                    return;
                                  }

                                  touchedGroupIndex = response.spot.touchedBarGroupIndex;

                                  setState(() {
                                    if (response.touchInput is FlLongPressEnd ||
                                        response.touchInput is FlPanEnd) {
                                      touchedGroupIndex = -1;
                                      showingBarGroups = List.of(rawBarGroups);
                                    } else {
                                      showingBarGroups = List.of(rawBarGroups);
                                      if (touchedGroupIndex != -1) {
                                        double sum = 0;
                                        for (BarChartRodData rod
                                        in showingBarGroups[touchedGroupIndex].barRods) {
                                          sum += rod.y;
                                        }
                                        final avg =
                                            sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                        showingBarGroups[touchedGroupIndex] =
                                            showingBarGroups[touchedGroupIndex].copyWith(
                                              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                                return rod.copyWith(y: avg);
                                              }).toList(),
                                            );
                                      }
                                    }
                                  });
                                }),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                                margin: 20,
                                getTitles: (double value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return 'Mn';
                                    case 1:
                                      return 'Te';
                                    case 2:
                                      return 'Wd';
                                    case 3:
                                      return 'Tu';
                                    case 4:
                                      return 'Fr';
                                    case 5:
                                      return 'St';
                                    case 6:
                                      return 'Sn';
                                    default:
                                      return '';
                                  }
                                },
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                                margin: 32,
                                reservedSize: 14,
                                getTitles: (value) {
                                  if (value == 0) {
                                    return '1K';
                                  } else if (value == 10) {
                                    return '5K';
                                  } else if (value == 19) {
                                    return '10K';
                                  } else {
                                    return '';
                                  }
                                },
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget makeTransactionsIcon() {
    const double width = 4.5;
    const double space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
