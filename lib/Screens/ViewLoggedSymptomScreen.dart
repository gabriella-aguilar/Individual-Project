import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/DataAccess.dart';

import '../colors.dart';

class ViewLoggedSymptomScreen extends StatefulWidget {
  @override
  _ViewLoggedSymptomScreenState createState() => _ViewLoggedSymptomScreenState();
}

class _ViewLoggedSymptomScreenState extends State<ViewLoggedSymptomScreen> {
  LoggedSymptom loggedSymptom;

  Symptom symptom;
  String title;
  _getData(String date) async{
    LoggedSymptom logged = await DataAccess.instance.getLoggedSymptomByDate(date);
    var sy = await DataAccess.instance.getSpecificSymptom(logged.getSymptom());
    setState(() {
      loggedSymptom = logged;
      symptom = sy[0];
    });
  }
  @override
  void initState() {
    super.initState();
    String date = Provider.of<UserInfo>(context, listen: false).getLoggedDate();
    _getData(date);
  }
  @override
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
                Navigator.pop(context);

              },
            );
          },
        ),
        title: const Text(
          "Logged Symptom",
          style: TextStyle(color: backBlue),
        ),
        //automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: newBlue,
      ),
      body: ListView(
        children:

          details(),


      ),
    );
  }

  List<Widget> details(){
    List<Widget> view = new List<Widget>();
    view.add( new Text(loggedSymptom.getSymptom(),style: basicText),);
    view.add( new Text(loggedSymptom.getDate().substring(0,16),style: basicText),);
    if(symptom.getLocation() == 1){
      view.add(new Text("Location: "+loggedSymptom.getLocation()));
      print(loggedSymptom.getLocation());
    }
    if(symptom.getIntervention() == 1){
      view.add(new Text("Intervention: "+loggedSymptom.getIntervention()));
    }
    if(symptom.getIntensity() == 1){
      view.add(new Text("Intensity: "+loggedSymptom.getIntensity().toString()));
    }
    if(symptom.getDuration() == 1){
      view.add(new Text("Duration: "+loggedSymptom.getDuration().toString()));
    }
    view.add(new Text("Comments: " + loggedSymptom.getComment()));

    return view;
  }
}
