import 'package:flutter/material.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/colors.dart';


class LogPain extends StatefulWidget {
  @override
  _LogPainState createState() => _LogPainState();
}

class _LogPainState extends State<LogPain> {
  double _durationController;

  double _intensityController;

  TextEditingController _locationController;

  TextEditingController _interventionController;

  TextEditingController _commentController;

  Widget build(BuildContext context) {
    Symptom symptom = ModalRoute.of(context).settings.arguments;
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
              children: _listBuilder(symptom)
          )
      )

    );
  }

  List _listBuilder(Symptom s) {
    List<ListTile> tiles = new List<ListTile>();

    if (s.getDuration()) {
      if (_durationController == null) {
        _durationController = 0;
      }
      ListTile duration = new ListTile(
        title: Text("Duration"),
        trailing: Slider(
          value: _durationController,
          activeColor: newBlueAccent,
          inactiveColor: newBlue,
          min: 0,
          max: 120,
          divisions: 5,
          label: _durationController.round().toString() + ' minutes',
          onChanged: (double value) {
            setState(() {
              _durationController = value;
            });
          },
        ),
      );
      tiles.add(duration);
    }
    if (s.getIntensity()) {
      if (_intensityController == null) {
        _intensityController = 0;
      }
      ListTile intensity = new ListTile(
        title: Text("Intensity"),
        trailing: Slider(
          value: _intensityController,
          activeColor: newBlueAccent,
          inactiveColor: newBlue,
          min: 0,
          max: 120,
          divisions: 5,
          label: _intensityController.round().toString(),
          onChanged: (double value) {
            setState(() {
              _intensityController = value;
            });
          },
        ),
      );
      tiles.add(intensity);
    }
    if (s.getIntervention()) {
      ListTile intervention = new ListTile(
        title: Text("Intervention"),
        trailing: TextField(
          controller: _interventionController,
          //keyboardType: TextInputType.multiline,
          style: TextStyle(
            fontSize: 18,
          ),
          //minLines: 6,
         // maxLines: 10,
        ),
      );
      tiles.add(intervention);
    }
    if (s.getLocation()) {
      ListTile location = new ListTile(
        title: Text("Location"),
        trailing: TextField(
          controller: _locationController,
          //keyboardType: TextInputType.multiline,
          style: TextStyle(
            fontSize: 18,
          ),
          minLines: 1,
          //maxLines: 10,
        ),
      );
      tiles.add(location);
    }
    ListTile comment = new ListTile(
      title: Text('Comments'),
      trailing: TextField(
        controller: _commentController,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontSize: 18,
        ),
        minLines: 6,
        maxLines: 10,
      ),
    );
    tiles.add(comment);
    return tiles;
  }
}
