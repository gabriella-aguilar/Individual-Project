import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/DataAccess.dart';
import '../colors.dart';

class ViewMealScreen extends StatefulWidget {
  @override
  _ViewMealScreenState createState() => _ViewMealScreenState();
}

class _ViewMealScreenState extends State<ViewMealScreen> {
  Meal meal;
  _getData(String date) async{
    Meal logged = await DataAccess.instance.getMealByDate(date);

    setState(() {
      meal = logged;
    });
  }
  @override
  void initState() {
    super.initState();
    String date = Provider.of<UserInfo>(context, listen: false).getLoggedDate();
    _getData(date);
  }
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "Logged Meal",
          style: TextStyle(color: backBlue),
        ),
        //automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: newBlue,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          children:[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: darkBlueAccent),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: details(),
              ),
            )
          ]
      ),
    );
  }

  List<Widget> details(){
    List<Widget> view = new List<Widget>();
    view.add( new Text(meal.getName(),style: basicText),);
    view.add( new Text(meal.getDate().substring(0,16),style: basicText),);
    String contains = "";

    if(meal.getAlcohol() == 1){
      contains += " Alcohol,";
    }
    if(meal.getDairy() == 1){
      contains += " Dairy,";
    }
    if(meal.getGluten() == 1){
      contains += " Gluten,";
    }
    if(meal.getMeat() == 1){
      contains += " Meat,";
    }
    if(meal.getSugar() == 1){
      contains += " Sugar,";
    }
    contains = contains.substring(0,contains.length-1);
    view.add(new Text("Contains:" + contains));

    return view;
  }
}
