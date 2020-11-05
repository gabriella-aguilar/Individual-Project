import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';
import 'package:tracker/Classes/user.dart';
import'package:tracker/Screens/profile.dart';
class EditDetailsPage extends StatefulWidget {
  @override
  _EditDetailsPageState createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  final _currentUser = sampleU;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailControllerConfirm = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();
  DateTime _dobDate = new DateTime.now();
  String _dob='';

  void initState() {
    super.initState();
    _dob = dateFormat(_currentUser.getDob());
    _dobDate = _currentUser.getDob();
    _firstNameController.text=_currentUser.getFirstName();
    _lastNameController.text=_currentUser.getLastName();
    _emailController.text=_currentUser.getEmail();
    _emailControllerConfirm.text=_currentUser.getEmail();
    _passwordController.text = _currentUser.getPassword();
    _passwordControllerConfirm.text=_currentUser.getPassword();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back,color: backBlue,),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ProfilePage()),
                    );
                  },

              );
            },
          ),
          title: const Text(
            'Edit Details',
            style: TextStyle(color: backBlue),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: newBlue,
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                    cursorColor: newBlueAccent,
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                    cursorColor: newBlueAccent,
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DOB'),
                      SizedBox(width: 10),
                      FlatButton(
                        //elevation: 8.0,
                          child: Text(_dob),
                          textColor: backBlue,
                          color: newBlue,
                          onPressed: () => _selectDate(context)
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    cursorColor: newBlueAccent,
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _emailControllerConfirm,
                    decoration: InputDecoration(
                      labelText: 'Confirm Email',
                    ),
                    cursorColor: newBlueAccent,
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    cursorColor: newBlueAccent,
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordControllerConfirm,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    cursorColor: newBlueAccent,
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    elevation: 8.0,
                    child: Text('Save'),
                    textColor: backBlue,
                    color: newBlue,
                    onPressed: () {
                      if (_emailControllerConfirm.text != _emailController.text) {
                        _poppin("Your emails don't match!");
                      } else if (_passwordControllerConfirm.text !=
                          _passwordController.text) {
                        _poppin("Your passwords don't match!");
                      } else {
                        _currentUser.setDob(_dobDate);
                        _currentUser.setEmail(_emailController.text);
                        _currentUser.setFirstName(_firstNameController.text);
                        _currentUser.setLastName(_lastNameController.text);
                        _currentUser.setPassword(_passwordController.text);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProfilePage()),
                        );
                      }}
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ]));
  }


  String dateFormat(DateTime d){
    String sDate = d.day.toString() +
        ' - ' +
        d.month.toString() +
        ' - ' +
        d.year.toString();
    return sDate;
  }

  Future<void> _poppin(String problem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error Editing Details"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(problem),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: 8,
              child: Text('Try Again'),
              onPressed: () {
                Navigator.pop(context);

              },
            ),
          ],
        );
      },
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dobDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != DateTime.now()){


      setState(() {
        // _dobController.text = sDate;
        _dobDate =picked;
        _dob = dateFormat(picked);
      });}
  }
}
