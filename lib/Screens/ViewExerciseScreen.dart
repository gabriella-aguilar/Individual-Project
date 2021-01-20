import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Context.dart';
import 'package:tracker/DataAccess.dart';
import '../colors.dart';

class ViewExerciseScreen extends StatefulWidget {
  @override
  _ViewExerciseScreenState createState() => _ViewExerciseScreenState();
}

class _ViewExerciseScreenState extends State<ViewExerciseScreen> {
  Activity exercise;
  _getData(String date) async{
    Activity logged = await DataAccess.instance.getExerciseByDate(date);

    setState(() {
      exercise = logged;
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
        children:

        details(),


      ),
    );
  }

  List<Widget> details(){
    List<Widget> view = new List<Widget>();
    view.add( new Text(exercise.getTitle(),style: basicText),);
    view.add( new Text(exercise.getDate().substring(0,16),style: basicText),);
    view.add( new Text("Duration: "+exercise.getDuration().toString(),style: basicText),);
    view.add( new Text("Comments: "+exercise.getComments(),style: basicText),);

    return view;
  }
}
