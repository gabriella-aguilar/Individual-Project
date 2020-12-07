
import 'package:flutter/material.dart';
import 'package:tracker/Classes/CommentsClass.dart';
import 'package:tracker/DataAccess.dart';


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