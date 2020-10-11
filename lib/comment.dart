import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogComment extends StatelessWidget {
  final _commentController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: newBlue,
          title: Text(
            'Log a Comment:',
            style: TextStyle(color: Colors.white),
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
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                      elevation: 8.0,
                      child: Text('Submit'),
                      textColor: Colors.white,
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
