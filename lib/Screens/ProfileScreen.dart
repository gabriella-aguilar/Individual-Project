import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/StatsScreen.dart';
import 'package:tracker/Screens/CalendarScreen.dart';
import 'package:tracker/Screens/EditDetailsScreen.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/Screens/EditSymptomsScreen.dart';
import 'package:tracker/DataAccess.dart';
import 'package:url_launcher/url_launcher.dart';

//TO DO: Symptoms editing add to the list for some reason
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Tracking> _symptomController;
  bool _error;

  void initState(){
    _error = false;
    super.initState();
    _setUp();
  }

  void _setUp() async{
    List<Tracking> list =  await DataAccess.instance.getAllTracking();
    setState(() {
      _symptomController = list;
    });
  }


  Widget build(BuildContext context) {
    //Widget log = _checkIfLoggedIn(context);

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
              child: Icon(Icons.calendar_today, size: 35, color: darkBlueAccent),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => CalendarPage()),
                );
              },
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
                  color: darkBlueAccent,
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                child: Text('Edit Tracked Symptoms'),
                textColor: backBlue,
                color: newBlue,
                onPressed: () {
                  //Navigator.pop(context);
                  _editS(context);
                }),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                elevation: 8.0,
                child: Text('Export'),
                textColor: backBlue,
                color: newBlue,
                onPressed: () {
                  _showPasswordPopUp();
                }),
          ]),
    );
  }

  _showPasswordPopUp() async {
    String _password = "";
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          children: [
            Text(_error ? "Incorrect Password" : "", style: errorText,),
            TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Enter you export password:',),
              onChanged: (value){
                setState(() {
                  _password = value;
                });
              },
            ),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                setState(() {
                  _error = false;
                });
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('EXPORT'),
              onPressed: () {
                checkPass(_password);
              })
        ],
      ),
    );
  }

  checkPass(String p) async{
    String pass = await DataAccess.instance.getPassword();
    if(p == pass){
      Navigator.pop(context);
      setState(() {
        _error = false;
      });
      _export();
    }
    else{
      setState(() {
        _error = true;
      });
    }
  }

  Widget _getErrorText(){
    if(_error){
      return Text("Wrong Password",style: errorText,);
    }
    return Container();
  }

  _export() async {
    List<LoggedSymptom> logged = await DataAccess.instance.getAllLoggedSymptoms();
    String toMailId = '';
    String subject = 'Symptom Tracker Export';
    String body = '';

    logged.forEach((element) {
      DateTime date = DateTime.parse(element.getDate());
      body += "\n" + dateFormat(date) + " " + element.getSymptom();
      if(element.getLocation() != ""){
        body += "\nLocation: " + element.getLocation();
      }
      if(element.getIntervention() != ""){
        body += "\nIntervention: " + element.getIntervention();
      }
      if(element.getIntensity() != 0){
        body += "\nIntensity: " + element.getIntensity().toString();
      }
      if(element.getDuration() != 0){
        body += "\nDuration: " + element.getDuration().toString();
      }
      if(element.getComment() != ""){
        body += "\nComments: " + element.getComment();
      }
      body += "\n---------------------";
    });

    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

  }

  String _symptomDisplay(List<Tracking> sy) {
    String syms = "";
    if (sy != null ) {
      if(sy.isEmpty ){return 'empty';}
      for (Tracking s in sy) {
        syms += " " + s.getName() + ",";
      }
      syms = syms.substring(0, syms.length - 1);
      return syms;


    }

    return "whoopsies";
  }

  _editS (BuildContext context) async {
    Object symptoms = Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => EditSymptomsPage()),
    );

    _setUp();

  }
}
