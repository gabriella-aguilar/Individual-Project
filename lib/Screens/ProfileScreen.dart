import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/StatsScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';
import 'package:tracker/Screens/EditDetailsScreen.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:tracker/Screens/EditSymptomsScreen.dart';

//TO DO: Symptoms editing add to the list for some reason
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Symptom> _symptomController;
  void initState(){
    super.initState();
    _symptomController = Provider.of<UserInfo>(context, listen: false).getcurrentUser().getSymptoms();
  }
  Widget build(BuildContext context) {
    Widget log = _checkIfLoggedIn(context);

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
          'Profile Page',
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
              child: Icon(Icons.calendar_today, size: 35, color: newBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => CalendarPage()),
                );
              },
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
              child: Icon(Icons.account_circle, size: 35, color: backBlue),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: backBlue,
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: newBlueAccent,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            log,
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                elevation: 8.0,
                child: Text('Edit Tracked Symptoms'),
                textColor: backBlue,
                color: newBlue,
                onPressed: () {
                  //Navigator.pop(context);
                  _editS(context);
                }),
          ]),
    );
  }

  Widget _checkIfLoggedIn(BuildContext context) {
    bool logged = Provider.of<UserInfo>(context, listen: false).getloggedIn();
    if (logged) {
      return Consumer<UserInfo>(
        builder: (context, user, child) {
          User _currentUser = user.getcurrentUser();
          var dateNow = _currentUser.getDob();
          String sDate = dateNow.day.toString() +
              ' - ' +
              dateNow.month.toString() +
              ' - ' +
              dateNow.year.toString();
          return Column(
            children: [
              Text(
                'Name: ' +
                    _currentUser.getFirstName() +
                    ' ' +
                    _currentUser.getLastName(),
                style: basicText,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email: ' + _currentUser.getEmail(),
                style: basicText,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'DOB: ' + sDate,
                style: basicText,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Symptoms Tracking:" + _symptomDisplay(_symptomController),
                style: basicText,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  elevation: 8.0,
                  child: Text('Edit Details'),
                  textColor: backBlue,
                  color: newBlue,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => EditDetailsPage()),
                    );
                  }),
            ],
          );
        },
      );
    } else {
      List<Symptom> symptoms = Provider.of<UserInfo>(context, listen: false).getSymptoms();

      return Column(
        children: [
          Text("Your not currently logged in."),
          SizedBox(
            height: 10,
          ),
          Text(
            "Symptoms Tracking:" + _symptomDisplay(symptoms),
            style: basicText,
          )
        ],
      );
    }
  }

  String _symptomDisplay(List<Symptom> sy) {
    String syms = "";
    if (sy != null && sy.isNotEmpty) {
      for (Symptom s in sy) {
        syms += " " + s.getName() + ",";
      }
      syms = syms.substring(0, syms.length - 1);
      return syms;
    }
    if(sy.isEmpty){return 'empty';}
    return "whoopsies";
  }

  _editS (BuildContext context) async {
    Object symptoms = Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => EditSymptomsPage()),
    );

    setState(() {
      Provider.of<UserInfo>(context, listen: false).getcurrentUser().setSymptoms(symptoms);

    });

  }
}
