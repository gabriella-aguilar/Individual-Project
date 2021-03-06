import 'package:flutter/material.dart';
import 'package:tracker/Classes/CommentsClass.dart';
import 'package:tracker/colors.dart';


import '../DataAccess.dart';
class LogComment extends StatefulWidget {
  LogComment({Key key}) : super(key: key);

  @override
  _LogCommentState createState() => _LogCommentState();
}

class _LogCommentState extends State<LogComment> {
  final _commentController = TextEditingController();
  final dateNow = new DateTime.now();
  var sDate = '';

  void commentSubmitted(BuildContext context,DateTime date, String comment){
    if(MediaQuery.of(context).viewInsets.bottom != 0){
      FocusScope.of(context).unfocus();
    }

    Comments c = new Comments(
        date: DateTime.now().toString(),
        comment: comment
    );

    DataAccess.instance.insertComment(c);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {

    sDate = dateFormat(DateTime.now());
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
        body: ListView(
          children: [
            Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(sDate, style: TextStyle(fontSize: 14),),
                      RaisedButton(
                          elevation: 8.0,
                          child: Text('Submit'),
                          textColor: backBlue,
                          color: newBlue,
                          onPressed: (){
                            commentSubmitted(context,dateNow,_commentController.text);
                          }
                      ),
                      //SizedBox(width: 10,)
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
