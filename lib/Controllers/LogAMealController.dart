import 'package:tracker/DataAccess.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Classes/MealClass.dart';

void mealSubmitted(BuildContext context, String name, bool  gluten, bool alcohol, bool sugar, bool meat, bool dairy) async{
  if(MediaQuery.of(context).viewInsets.bottom != 0){
    FocusScope.of(context).unfocus();
  }

  Meal m = new Meal(
      date: DateTime.now().toString(),
      name: name,
      gluten: gluten ? 1 : 0,
      alcohol: alcohol ? 1 : 0,
      sugar: sugar ? 1 : 0,
      meat: meat ? 1 : 0,
      dairy: dairy? 1 : 0
  );

  DataAccess.instance.insertMeal(m);
  Navigator.pop(context);
}