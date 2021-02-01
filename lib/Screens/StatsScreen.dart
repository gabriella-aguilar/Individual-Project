import 'package:flutter/material.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/DataAccess.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';
import 'package:tracker/colors.dart';

import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget{
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  List<Tracking> _trackingList;
  List<LoggedSymptom> _loggedSymptoms;

  @override
  void initState() {
    super.initState();
    _trackingList = new List<Tracking>();
    _loggedSymptoms = new List<LoggedSymptom>();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        children: [
          getCardColumn()
        ],
      ),
    );
  }

  _setUp() async{
    List<Tracking> list = await DataAccess.instance.getAllTracking();
    List<LoggedSymptom> l1  = await DataAccess.instance.getAllLoggedSymptoms();
    if(list != null && list.isNotEmpty){
      setState(() {
        _trackingList.addAll(list);
        _loggedSymptoms.addAll(l1);
      });
    }
  }

  Widget getCardColumn(){
    List<Widget> children = new List<Widget>();
    _trackingList.forEach((element) {
      Widget w = getGraphCard(element);
      children.add(w);
      children.add(SizedBox(height:5));
    });

    return Column(
      children: children,
    );
  }

  Widget getGraphCard(Tracking tracking) {
    String name = tracking.getName();
    List<DateTime> days = [
      //DateTime.now().subtract(Duration(days: 7)),
      DateTime.now().subtract(Duration(days: 6)),
      DateTime.now().subtract(Duration(days: 5)),
      DateTime.now().subtract(Duration(days: 4)),
      DateTime.now().subtract(Duration(days: 3)),
      DateTime.now().subtract(Duration(days: 2)),
      DateTime.now().subtract(Duration(days: 1)),
      DateTime.now()
    ];
    Map<int,int> countByDay = new Map<int,int>();
    bool tracked = false; //check if tracked during time period
    for(int i = 0; i < days.length; i++){

      int count = 0;

      _loggedSymptoms.forEach((element) {
        DateTime date = DateTime.parse(element.getDate());
        if(days[i].day == date.day && days[i].month == date.month && days[i].year == date.year && name == element.getSymptom()){
          tracked = true;
          count++;
        }
      });
      countByDay[i] = count;
    }
    if(tracked == false){
      return Container(height:0);
    }

    List<BarChartGroupData> barChartGroupData = new List<BarChartGroupData>();
    for(int i = 0; i < days.length; i++){
      barChartGroupData.add( BarChartGroupData(
        x: i,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: countByDay[i].toDouble(),
              rodStackItems: [
                BarChartRodStackItem(0, countByDay[i].toDouble(), darkBlueAccent),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),

        ],
      ),);
    }

    List<String> titles = new List<String>();
    int start = days[0].weekday;
    for(int i = 0; i < days.length; i++){
      switch(start){
        case 1:
          titles.add("Mn");
          break;
        case 2:
          titles.add("Tu");
          break;
        case 3:
          titles.add("We");
          break;
        case 4:
          titles.add("Th");
          break;
        case 5:
          titles.add("Fr");
          break;
        case 6:
          titles.add("Sa");
          break;
        case 7:
          titles.add("Su");
          break;
      }
      if(start == 7){
        start = 0;
      }
      start++;
    }


    return AspectRatio(
      aspectRatio: 1.15,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: darkBlueAccent),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //
          ),
        ),
        child: Column(
          children: [
            Text(name,style: basicText,),
            BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(color: Color(0xff939393), fontSize: 10),
                    margin: 10,
                    getTitles: (double value) {
                      return titles[value.toInt()];
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
                groupsSpace: 10,
                barGroups: barChartGroupData,
              ),
            ),
          ],
        ),
      ),
    );

  }
}