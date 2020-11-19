import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/MealClass.dart';
class LogMeal extends StatefulWidget {
  @override
  _LogMealState createState() => _LogMealState();
}

class _LogMealState extends State<LogMeal> {
  final _nameController = TextEditingController();
  bool _glutenController = false;
  bool _alcoholController = false;
  bool _sugarController = false;
  bool _meatController = false;
  bool _dairyController = false;
  Widget build(BuildContext context) {
    var sDate = '';
    sDate = DateTime.now().day.toString() +
        ' - ' +
        DateTime.now().month.toString() +
        ' - ' +
        DateTime.now().year.toString();
    return Scaffold(
        backgroundColor: backBlue,
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
            'Log a Meal',
            style: TextStyle(color: backBlue),
          ),
        ),
        body:ListView(children:[ Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Meal Name',
                ),
                cursorColor: newBlueAccent,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gluten',style: basicText,),
                  Checkbox(
                    value: _glutenController,
                    activeColor: newBlueAccent,
                    checkColor: newBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        _glutenController = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sugar',style: basicText,),
                  Checkbox(
                    value: _sugarController,
                    activeColor: newBlueAccent,
                    checkColor: newBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        _sugarController = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Alcohol',style: basicText,),
                  Checkbox(
                    value: _alcoholController,
                    activeColor: newBlueAccent,
                    checkColor: newBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        _alcoholController = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Meat',style: basicText,),
                  Checkbox(
                    value: _meatController,
                    activeColor: newBlueAccent,
                    checkColor: newBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        _meatController = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dairy',style: basicText,),
                  Checkbox(
                    value: _dairyController,
                    activeColor: newBlueAccent,
                    checkColor: newBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        _dairyController = value;
                      });
                    },
                  )
                ],
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
                      textColor: Colors.white,
                      color: newBlue,
                      onPressed: () {
                        Meal m = new Meal(_nameController.text,_glutenController,_alcoholController,_sugarController,_meatController,_dairyController);
                        Navigator.pop(context);
                      }),
                  //SizedBox(width: 10,)
                ],
              )
            ],
          ),
        )]));
  }
}
