import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogComment extends StatefulWidget {
  LogComment({Key key}) : super(key: key);

  @override
  _LogCommentState createState() => _LogCommentState();
}

class _LogCommentState extends State<LogComment> {
  final _commentController = TextEditingController();
  final dateNow = new DateTime.now();
  var sDate = '';

  Widget build(BuildContext context) {
    String _currentComment = '';
    sDate = dateNow.day.toString() + ' - ' + dateNow.month.toString() + ' - ' + dateNow.year.toString();
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
            'Log a Comment:',
            style: TextStyle(color: backBlue),
          ),
        ),
        backgroundColor: backBlue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              //Row(),
              TextField(
                controller: _commentController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 18,
                ),
                minLines: 6, //Normal textInputField will be displayed
                maxLines: 10, // when user presses enter it will adapt to it
                onChanged: (String value) {
                  _currentComment = value;
                },
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sDate, style: TextStyle(fontSize: 14),),
                  RaisedButton(
                      elevation: 8.0,
                      child: Text('Submit'),
                      textColor: backBlue,
                      color: newBlue,
                      onPressed: (){
                        
                      }
                  ),
                  //SizedBox(width: 10,)
                ],
              )
            ],
          ),
        )
    );
  }
}
