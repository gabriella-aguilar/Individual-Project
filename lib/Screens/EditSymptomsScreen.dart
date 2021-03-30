import 'package:flutter/material.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/CustomSymptomScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/Classes/SymptomClass.dart';


import '../DataAccess.dart';

class EditSymptomsPage extends StatefulWidget {
  @override
  _EditSymptomsPageState createState() => _EditSymptomsPageState();
}

class _EditSymptomsPageState extends State<EditSymptomsPage> {
  Symptom cust;
  List<Symptom> symptoms =  new List<Symptom>();
  List<Symptom> tracking;
  List<Tracking> preTracking;




  @override
  void initState() {
    super.initState();
    tracking = new List<Symptom>();
    // preTracking =  new List<Symptom>();
    setUpSymptomPicker();

  }

  @override
  Widget build(BuildContext context) {

    List tiles =  _listBuilder();
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
            'Pick Your Symptoms',
            style: TextStyle(color: backBlue),
          ),
          //automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: newBlue,
        ),
        bottomNavigationBar: BottomAppBar(
            color: newBlue,
            child:Container(
              padding: EdgeInsets.only(bottom: 5,top: 5),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    RaisedButton(
                      elevation: 8.0,
                      child: Text('Custom Symptom'),
                      textColor: darkBlueAccent,
                      color: backBlue,
                      onPressed: () {
                        _customS(context);
                      },
                    ),
                    RaisedButton(
                      elevation: 8.0,
                      child: Text('Save'),
                      textColor: darkBlueAccent,
                      color: backBlue,
                      onPressed: () {
                        _finish();
                        //checkOnInserts(); //prints out all tracking
                        Navigator.push(context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => ProfilePage()));
                      },
                    ),
                  ]),
            )),
        body: SafeArea(
            child: ListView(
                children: tiles
            )
        ));
  }

  _finish() async{

    for(Symptom symptom in tracking){
      bool found = false;
      for(Tracking s in preTracking) {
        if (symptom.getName() == s.getName()) {
          found = true;
        }
      }
      if(!found){
        Tracking tracking = new Tracking(
            name: symptom.getName()
        );
        DataAccess.instance.insertTracking(tracking);
      }
    }

    for(Tracking symptom in preTracking){
      bool found = false;
      for(Symptom s in tracking){
        if(symptom.getName() == s.getName()){
          found = true;
        }
      }
      if(!found) {
        //print(symptom.getName() + " no longer tracked");
        DataAccess.instance.deleteTracking(symptom.getName());
      }
    }
  }

  checkOnInserts() async{
    List<Tracking> list = await DataAccess.instance.getAllTracking();
    list.forEach((element) {print(element.getName());});
  }

  _customS (BuildContext context) async {
    cust = await Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => CustomSymptomPage()),
    );
    if(cust != null){
      setState(() {
        symptoms.add(cust);
        tracking.add(cust);
      });
      cust = null;
    }


  }


  List _listBuilder(){
    List <ListTile> tiles = new List<ListTile>();
    for(Symptom s in symptoms){
      tiles.add(_buildRow(s));
    }
    return tiles;
  }

  void _buildTracking() async{
    for(Symptom s in symptoms) {
      bool found = false;
      for (Tracking t in preTracking) {
        if (s.getName() == t.getName()) {
          found = true;
        }
      }
      if (found) {
        setState(() {
          tracking.add(s);
        });
      }
    }
  }

  Widget _buildRow(Symptom s) {
    bool alreadySaved = false;//= tracking.contains(s);
    for(Symptom symptom in tracking){
      if(s.getName() == symptom.getName()){
        alreadySaved = true;
      }
    }
    //print("Already Tracking " + s.getName() +" "+ alreadySaved.toString());
    return ListTile(
      title: Text(s.getName()),
      trailing: Icon(
        alreadySaved ? Icons.check_box_rounded : Icons.check_box_outline_blank,
        color: darkBlueAccent ,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            tracking.remove(s);
          }else{
            tracking.add(s);
          }
        });
      },
    );
  }

  void setUpSymptomPicker() async{
    List<Symptom> test = await DataAccess.instance.getAllSymptoms().catchError((onError) {print("problem");});
    List<Tracking> tracks = await DataAccess.instance.getAllTracking().catchError((onError) {print("problem");});
    List<Symptom> t = new List<Symptom>();
    for(Tracking tr in tracks){
      t.addAll(await DataAccess.instance.getSpecificSymptom(tr.getName()));
    }
    //print("tracks length: " + t.length.toString());
    setState(() {
      symptoms= test;

      preTracking =tracks;
     // print("tracking length: " + tracking.length.toString());
    });
    _buildTracking();
  }
}
