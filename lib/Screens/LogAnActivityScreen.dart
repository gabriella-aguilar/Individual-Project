import 'package:flutter/material.dart';
import 'package:tracker/Controllers/LogActivityController.dart';
import 'package:tracker/colors.dart';



class LogActivity extends StatefulWidget {
  LogActivity({Key key}) : super(key: key);

  @override
  _LogActivityState createState() => _LogActivityState();
}

class _LogActivityState extends State<LogActivity> {
  final _titleController = TextEditingController();
  final _commentController = TextEditingController();
  final dateNow = new DateTime.now();

  double _currentSliderValue = 0;

  Widget build(BuildContext context) {
    var sDate = '';
    sDate = dateNow.day.toString() +
        ' - ' +
        dateNow.month.toString() +
        ' - ' +
        dateNow.year.toString();
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back,color: backBlue,),
                onPressed: () { Navigator.pop(context); },

              );
            },
          ),
          backgroundColor: newBlue,
          title: Text(
            'Log an Activity',
            style: TextStyle(color: backBlue),
          ),
        ),
        backgroundColor: backBlue,
        body: ListView(
          children:[ Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Text(sDate, style: basicText),
                Text(
                  'Activity Title:',
                  style: basicText,
                ),
                TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Duration:',
                  style: basicText,
                ),
                Slider(
                  value: _currentSliderValue,
                  activeColor: darkBlueAccent,
                  inactiveColor: newBlue,
                  min: 0,
                  max: 120,
                  divisions: 5,
                  label: _currentSliderValue.round().toString() + ' minutes',
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                //ToDo:slider still doesn't move
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Comments:',
                  style: basicText,
                ),
                TextField(
                  controller: _commentController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  minLines: 6,
                  //Normal textInputField will be displayed
                  maxLines: 10, // when user presses enter it will adapt to it
                ),
                SizedBox(
                  height: 10,
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
                          submitPressed(context,_titleController.text, _currentSliderValue.toInt(), _commentController.text);
                        }),
                    //SizedBox(width: 10,)
                  ],
                )
              ],
            ),
          )],
        ));
  }
}
