import 'package:flutter/material.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/DataAccess.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Screens/LogAPainScreen.dart';

import '../Context.dart';

class SymptomSelectionPage extends StatefulWidget {
  @override
  _SymptomSelectionPageState createState() => _SymptomSelectionPageState();
}
//Page is stepping to pick what pain you want to log
class _SymptomSelectionPageState extends State<SymptomSelectionPage> {

  List<Tracking>symptoms;

  void _setUp() async{
    List<Tracking> list = await DataAccess.instance.getAllTracking();
    setState(() {
      symptoms = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _setUp();
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
    for(Tracking s in symptoms){
      tiles.add(_buildRow(s));
    }
    return tiles;
  }

  Widget _buildRow(Tracking s) {

    return ListTile(
      title: Text(s.getName()),
      trailing: Icon(
        Icons.add,
        color: darkBlueAccent ,
      ),
      onTap: (){
        Provider.of<UserInfo>(context, listen: false).setSymptomName(s.getName());
        Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => LogPain())
        );
      },
    );
  }
}
