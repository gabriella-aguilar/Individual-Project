import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/SymptomClass.dart';

import '../DataAccess.dart';


class CustomSymptomPage extends StatefulWidget {
  @override
  _CustomSymptomPageState createState() => _CustomSymptomPageState();
}

class _CustomSymptomPageState extends State<CustomSymptomPage> {
  bool _intensity = false;
  bool _duration = false;
  bool _location = false;
  bool _intervention = false;
  final _name = TextEditingController();
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
            'What would you like to track?',
            style: TextStyle(color: backBlue),
          ),
          //automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: newBlue,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Symptom Name',
                ),
                cursorColor: darkBlueAccent,

              ),
              SizedBox(height:30),
              Text('What information would you like to track?',style: basicText),
              SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Intensity',style: basicText,),
                  Switch(
                      value: _intensity,
                      activeColor: darkBlueAccent,
                      activeTrackColor: newBlue,
                      onChanged: (bool n){
                        setState(() {
                          _intensity= n;
                        });

                      }
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location',style: basicText),
                  Switch(
                      value: _location,
                      activeColor: darkBlueAccent,
                      activeTrackColor: newBlue,
                      onChanged: (bool n){
                        setState(() {
                          _location= n;
                        });

                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Duration',style: basicText),
                  Switch(
                    value: _duration,
                      activeColor: darkBlueAccent,
                      activeTrackColor: newBlue,
                      onChanged: (bool n){
                        setState(() {
                          _duration= n;
                        });

                      }
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Intervention',style: basicText),
                  Switch(
                      value: _intervention,
                      activeColor: darkBlueAccent,
                      activeTrackColor: newBlue,
                      onChanged: (bool n){
                        setState(() {
                          _intervention= n;
                        });

                      }
                  )
                ],
              ),
              RaisedButton(
                elevation: 8.0,
                child: Text('Submit'),
                textColor: backBlue,
                color: newBlue,
                onPressed: () {
                  int inten= 0;
                  int dur = 0;
                  int inter = 0;
                  int loc = 0;
                  //this.name,this.intensity,this.duration,this.intervention,this.location
                  if(_intensity){inten = 1;}
                  if(_duration){dur = 1;}
                  if(_intervention){inter = 1;}
                  if(_location){loc = 1;}
                  Symptom s = new Symptom(
                      name: _name.text,
                      intensity: inten,
                      duration: dur,
                      location: loc,
                      intervention: inter
                  );
                  DataAccess.instance.insertSymptom(s);
                  Navigator.pop(context,s);
                },
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}
