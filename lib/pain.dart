import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class LogPain extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: backBlue,
      body: Column(
        children: <Widget>[
          AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back,color: backBlue,),
                  onPressed: () { Navigator.pop(context); },

                );
              },
            ),
            backgroundColor: newBlue,
            title: Text('Log a Pain',style: TextStyle(color: backBlue),),
          ),
        ],
      ),
    );
  }
}