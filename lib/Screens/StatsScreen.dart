import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';

import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../DataAccess.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);
  List<ChartData> chartData;
  var symptomMaps;
  Map<String, Color> colorMap;

  @override
  void initState() {
    super.initState();
    chartData = new List<ChartData>();
    _setUpStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backBlue,
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
          title: Text(
            'Stats Page',
            style: TextStyle(color: backBlue),
          ),
        ),
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
                child:
                    Icon(Icons.calendar_today, size: 35, color: darkBlueAccent),
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
                onPressed: () {},
              ),
              FlatButton(
                child:
                    Icon(Icons.account_circle, size: 35, color: darkBlueAccent),
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
        body: ListView(
          children: [_getGraphCard(), _getGraph()],
        ));
  }

  Widget _getGraph() {
    return Container(
      child: AspectRatio(
        aspectRatio: 1.66,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                        const TextStyle(color: Color(0xff939393), fontSize: 10),
                    margin: 10,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Sun';
                        case 1:
                          return 'Mon';
                        case 2:
                          return 'Tues';
                        case 3:
                          return 'Wed';
                        case 4:
                          return 'Thur';
                        case 5:
                          return 'Fri';
                        case 6:
                          return 'Sat';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(
                          0xff939393,
                        ),
                        fontSize: 10),
                    margin: 0,
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xffe7e8ec),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: 4,
                barGroups: getData(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    List<BarChartGroupData> data = List<BarChartGroupData>();
    for (int i = 0; i < 7; i++) {
      data.add(BarChartGroupData(x: i, barsSpace: 4, barRods: [getRods(i)]));
    }
    return data;
    // return [
    //   BarChartGroupData(
    //     x: 0,
    //     barsSpace: 4,
    //     barRods: [
    //       BarChartRodData(
    //           y: 250,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 20, dark),
    //             BarChartRodStackItem(20, 120, normal),
    //             BarChartRodStackItem(120, 170, light),
    //             BarChartRodStackItem(170, 250, darkBlueAccent),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 1,
    //     barsSpace: 4,
    //     barRods: [
    //       BarChartRodData(
    //           y: 310,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 110, dark),
    //             BarChartRodStackItem(110, 180, normal),
    //             BarChartRodStackItem(180, 310, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 2,
    //     barsSpace: 4,
    //     barRods: [
    //       BarChartRodData(
    //           y: 340,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 60, dark),
    //             BarChartRodStackItem(60, 230, normal),
    //             BarChartRodStackItem(230, 340, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 3,
    //     barsSpace: 4,
    //     barRods: [
    //       BarChartRodData(
    //           y: 140,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 10.5, dark),
    //             BarChartRodStackItem(10.5, 120, normal),
    //             BarChartRodStackItem(120, 140, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 4,
    //     barsSpace: 4,
    //     barRods: [
    //
    //       BarChartRodData(
    //           y: 270,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 70, dark),
    //             BarChartRodStackItem(70, 250, normal),
    //             BarChartRodStackItem(250, 270, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 5,
    //     barsSpace: 4,
    //     barRods: [
    //
    //       BarChartRodData(
    //           y: 290,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 60, dark),
    //             BarChartRodStackItem(60, 230, normal),
    //             BarChartRodStackItem(230, 290, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    //   BarChartGroupData(
    //     x: 6,
    //     barsSpace: 4,
    //     barRods: [
    //
    //       BarChartRodData(
    //           y: 160.5,
    //           rodStackItems: [
    //             BarChartRodStackItem(0, 90, dark),
    //             BarChartRodStackItem(90, 150, normal),
    //             BarChartRodStackItem(150, 160.5, light),
    //           ],
    //           borderRadius: const BorderRadius.all(Radius.zero)),
    //
    //     ],
    //   ),
    // ];
  }

  BarChartRodData getRods(int i) {
    List<BarChartRodStackItem> rods = new List<BarChartRodStackItem>();
    Map<String, int> map = symptomMaps[i];
    double lower = 0;
    double upper = 0;
    map.forEach((key, value) {
      upper += value;
      Color c = colorMap[key];
      rods.add(BarChartRodStackItem(lower, upper, c));
      lower = upper;
    });

    return BarChartRodData(
      y: upper,
      rodStackItems: rods,
      borderRadius: const BorderRadius.all(Radius.zero),
    );
  }

  _setUpStats() async {
    Map<DateTime, List> events = new Map<DateTime, List>();
    //final _today = DateTime.now();

    Map<DateTime, List> days = await DataAccess.instance.getLoggedForCalendar();

    List<Tracking> tracking = await DataAccess.instance.getAllTracking();
    colorMap = new Map<String, Color>();
    //TODO: Needs to generate more colors if more tracked
    var colors = [
      newBlue,
      newBlue2,
      darkBlueAccent,
      darkBlueAccent2,
      backBlue2
    ];
    for (int i = 0; i < tracking.length; i++) {
      colorMap[tracking[i].getName()] = colors[i];
    }
    if (days.isEmpty || days == null) {
      print("logged in Empty or null");
    } else {
      days.forEach((key, value) {
        events[key] = value;
        //print("first in logged" + value.first.getSymptom());
      });

      var d = [
        DateTime.now().subtract(Duration(days: 7)),
        DateTime.now().subtract(Duration(days: 6)),
        DateTime.now().subtract(Duration(days: 5)),
        DateTime.now().subtract(Duration(days: 4)),
        DateTime.now().subtract(Duration(days: 3)),
        DateTime.now().subtract(Duration(days: 2)),
        DateTime.now().subtract(Duration(days: 1))
      ];
      var list = [
        //All logged for that day of week
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
        new List<LoggedSymptom>(),
      ];
      var maps = [
        //Maps logged for that day by symptom and the number of instances
        new Map<String, int>(),
        new Map<String, int>(),
        new Map<String, int>(),
        new Map<String, int>(),
        new Map<String, int>(),
        new Map<String, int>(),
        new Map<String, int>(),
      ];

      for (int i = 0; i < 7; i++) {
        //retrieves the events from the last seven days
        events.forEach((key, value) {
          if (d[i].day == key.day &&
              d[i].month == key.month &&
              d[i].year == key.year) {
            list[i] = value;
            chartData.add(ChartData(i.toDouble(), value.length.toDouble()));
          }
        });
      }

      for (int i = 0; i < list.length; i++) {
        list[i].forEach((element) {
          if (maps[i].containsKey(element.getSymptom())) {
            var temp = maps[i][element.getSymptom()];
            temp++;
            maps[i][element.getSymptom()] = temp;
          } else {
            maps[i][element.getSymptom()] = 1;
          }
        });
      }
      setState(() {
        symptomMaps = maps;
      });
    }
  }

  Widget _getGraphCard() {
    //List<ColumnSeries> columnList = List<ColumnSeries>();

    return Container(
        color: Colors.white,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ]));
  }
}

class ChartData {
  final double x;
  final double y;
  ChartData(this.x, this.y);
}
