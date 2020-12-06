import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/DataAccess.dart';
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
    setUp(context);
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
            'What Symptom are you experiencing?',
            style: TextStyle(color: backBlue),
          ),
          //automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: newBlue,
        ),

        body: SafeArea(
            child: ListView(
                children: _listBuilder()
            )
        ));
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
            PageRouteBuilder(pageBuilder: (_, __, ___) => LogPain(),settings: RouteSettings(arguments: s))
        );
      },
    );
  }
}
