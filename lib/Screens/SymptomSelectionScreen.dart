import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Screens/CustomSymptomScreen.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/dummyDate.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Controllers/SymptomSelectionController.dart';
import 'package:tracker/Screens/LogAPainScreen.dart';

class SymptomSelectionPage extends StatefulWidget {
  @override
  _SymptomSelectionPageState createState() => _SymptomSelectionPageState();
}

class _SymptomSelectionPageState extends State<SymptomSelectionPage> {
  Symptom cust;
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
                      textColor: newBlueAccent,
                      color: backBlue,
                      onPressed: () {
                        _customS(context);
                      },
                    ),
                    RaisedButton(
                      elevation: 8.0,
                      child: Text('Sign Up'),
                      textColor: newBlueAccent,
                      color: backBlue,
                      onPressed: () {
                        Navigator.push(context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => HomePage()));
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

    return ListTile(
      title: Text(s.getName()),
      trailing: Icon(
        Icons.add,
        color: newBlueAccent ,
      ),
      onTap: (){
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => LogPain())
        );
      },
    );
  }
}
