import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'dart:async';

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
                cursorColor: newBlueAccent,

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
                      activeColor: newBlueAccent,
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
                      activeColor: newBlueAccent,
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
                      activeColor: newBlueAccent,
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
                      activeColor: newBlueAccent,
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
                  Symptom s = new Symptom(_name.text, _intensity, _location, _duration, _intensity);

                  Navigator.pop(context,s);
                },
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}
