import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/CustomSymptomScreen.dart';
import 'package:tracker/Screens/ProfileScreen.dart';
import 'package:tracker/dummyDate.dart';
import 'package:tracker/Controllers/EditSymptomsController.dart';
import 'package:tracker/Classes/SymptomClass.dart';

import '../Context.dart';


class EditSymptomsPage extends StatefulWidget {
  @override
  _EditSymptomsPageState createState() => _EditSymptomsPageState();
}

class _EditSymptomsPageState extends State<EditSymptomsPage> {

  Symptom cust;

  void initState() {
    super.initState();
    setUp(context);
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
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ProfilePage()
                  );
                },
              );
            },
          ),
          title: const Text(
            'Edit Your Symptoms',
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
                      textColor: newBlueAccent,
                      color: backBlue,
                      onPressed: () {
                        _customS(context);
                      },
                    ),
                    RaisedButton(
                      elevation: 8.0,
                      child: Text('Save Symptoms'),
                      textColor: newBlueAccent,
                      color: backBlue,
                      onPressed: () {


                        Navigator.pop(context,tracking);

                      },
                    ),
                  ]),
            )),
        body: SafeArea(
            child: ListView(
                children: _listBuilder()
            )
        ));
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
        color: newBlueAccent ,
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
}
