import 'package:flutter/material.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/Controllers/LogAPainController.dart';
import 'package:tracker/DataAccess.dart';
import 'package:tracker/colors.dart';
import 'package:provider/provider.dart';

import '../Context.dart';

class LogPain extends StatefulWidget {
  @override
  _LogPainState createState() => _LogPainState();
}

class _LogPainState extends State<LogPain> {
  Symptom symptom;
  double _durationController;
  double _intensityController;
  TextEditingController _locationController;
  TextEditingController _interventionController;
  TextEditingController _commentController;


  @override
  void initState() {
    super.initState();
    String name = Provider.of<UserInfo>(context, listen: false).getSymptom();
    _intensityController = 0;
    _durationController = 0;
    getSymptom(name);
  }

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
          backgroundColor: newBlue,
          title: Text(
            symptom.getName(),
            style: TextStyle(color: backBlue),
          ),
        ),
        backgroundColor: backBlue,
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                children: [
                  // Text("Duration "+ symptom.getDuration().toString()),
                  // Text("Intensity "+ symptom.getIntensity().toString()),
                  // Text("Intervention "+ symptom.getIntervention().toString()),
                  // Text("Location "+ symptom.getLocation().toString()),
                  Container(
                    height: symptom.getDuration() == 1 ? 50 : 0,
                    child: Row(
                      children: [
                        Text(
                          "Duration",
                          style: basicText,
                        ),
                        Slider(
                          value: _durationController,
                          activeColor: darkBlueAccent,
                          inactiveColor: newBlue,
                          min: 0,
                          max: 120,
                          divisions: 120,
                          label:
                              _durationController.round().toString() + ' minutes',
                          onChanged: (double value) {
                            setState(() {
                              _durationController = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: symptom.getIntensity() == 1? 50 : 0,
                    child: Row(
                      children: [
                        Text("Intensity", style: basicText),
                        Slider(
                          value: _intensityController,
                          activeColor: darkBlueAccent,
                          inactiveColor: newBlue,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: _intensityController.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _intensityController = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: symptom.getIntervention()== 1 ? 90 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Intervention", style: basicText),
                        TextField(
                          controller: _interventionController,
                          //keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          //minLines: 6,
                          // maxLines: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: symptom.getLocation()== 1 ? 90 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location", style: basicText),
                        TextField(
                          controller: _locationController,
                          //keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          minLines: 1,
                          //maxLines: 10,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Comments', style: basicText),
                      TextField(
                        controller: _commentController,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        minLines: 6,
                        maxLines: 10,
                      ),
                    ],
                  ),
                  RaisedButton(
                      elevation: 8.0,
                      child: Text('Submit'),
                      textColor: backBlue,
                      color: newBlue,
                      onPressed: () {
                        String name = Provider.of<UserInfo>(context, listen: false).getSymptom();
                        Provider.of<UserInfo>(context, listen: false).setSymptomName("");
                        String loc = "";
                        String inter = "";
                        String comm = "";
                        if(_locationController != null){loc = _locationController.text.toString();}
                        if(_interventionController != null){inter = _interventionController.text.toString();}
                        if(_commentController != null){comm = _commentController.text.toString();}
                        submitPressed(context,name,_intensityController.round(),_durationController.round(),loc,inter,comm);
                      }),
            ])));
  }

  getSymptom(String name) async{
   List<Symptom> s = await DataAccess.instance.getSpecificSymptom(name);
   Symptom sym = s[0];
   setState(() {
     symptom = sym;
   });
  }


}
