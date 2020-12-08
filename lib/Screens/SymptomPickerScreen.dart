import 'package:flutter/material.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/CustomSymptomScreen.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Controllers/SymptomPickerController.dart';

import '../DataAccess.dart';

class SymptomPickerPage extends StatefulWidget {
  @override
  _SymptomPickerPageState createState() => _SymptomPickerPageState();
}

class _SymptomPickerPageState extends State<SymptomPickerPage> {
  Symptom cust;
  List<Symptom>symptoms =  new List<Symptom>();
  List<Symptom> tracking;

  @override
  void initState() {
    super.initState();
    tracking = new List<Symptom>();
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
              child: Text('Start'),
              textColor: darkBlueAccent,
              color: backBlue,
              onPressed: () {
                _finish();
                checkOnInserts();
                Navigator.push(context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomePage()));
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
      Tracking tracking = new Tracking(
        name: symptom.getName()
      );
      DataAccess.instance.insertTracking(tracking);
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

     setState(() {
       symptoms.add(cust);
       tracking.add(cust);
     });
     cust = null;

  }


  List _listBuilder(){
    List <ListTile> tiles = new List<ListTile>();
    for(Symptom s in symptoms){
      tiles.add(_buildRow(s));
    }
    return tiles;
  }

  Widget _buildRow(Symptom s) {
    final alreadySaved = tracking.contains(s);
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
    setState(() {
      symptoms= test;
    });

  }
}
