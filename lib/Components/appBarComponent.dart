import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class AppBarComponent{

  Widget build(BuildContext context,String title,){
    return AppBar(
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
        title,
        style: TextStyle(color: backBlue),
      ),
    );
  }
}