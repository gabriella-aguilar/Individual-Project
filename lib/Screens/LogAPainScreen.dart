import 'package:flutter/material.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/SymptomClass.dart';
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
  String _locationController;
  String _interventionController;
  String _commentController;
  String sDate;


  void submitPressed(){
    if(MediaQuery.of(context).viewInsets.bottom != 0){
      FocusScope.of(context).unfocus();
    }
    String name = Provider.of<UserInfo>(context, listen: false).getSymptom();
    Provider.of<UserInfo>(context, listen: false).setSymptomName("");
    LoggedSymptom ls = LoggedSymptom(
        name: name,
        date: DateTime.now().toString(),
        intensity: _intensityController.round(),
        duration: _durationController.round(),
        location: _locationController,
        intervention: _interventionController,
        comments: _commentController);
    DataAccess.instance.insertLogged(ls);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    String name = Provider.of<UserInfo>(context, listen: false).getSymptom();
    _intensityController = 0;
    _durationController = 0;
    _locationController = "";
    _interventionController ="";
    _commentController = "";
    sDate = dateFormat(DateTime.now());
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
                         // controller: _interventionController,
                          //keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          onChanged: (value){
                            setState(() {
                              _interventionController = value;
                            });
                          },
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
                          //controller: _locationController,
                          //keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          onChanged: (value){
                            setState(() {
                              _locationController = value;
                            });
                          },
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
                       // controller: _commentController,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        onChanged: (value){
                          setState(() {
                            _commentController = value;
                          });
                        },
                        minLines: 6,
                        maxLines: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sDate,
                        style: TextStyle(fontSize: 14),
                      ),
                      RaisedButton(
                          elevation: 8.0,
                          child: Text('Submit'),
                          textColor: backBlue,
                          color: newBlue,
                          onPressed: () {


                            submitPressed();
                          }),
                    ],
                  ),
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
