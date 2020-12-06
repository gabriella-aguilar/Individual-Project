import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:tracker/Screens/ForgotPasswordScreen.dart';
import 'package:tracker/Screens/HomePageScreen.dart';
import 'package:tracker/Screens/SignUpScreen.dart';
import 'package:tracker/dummyDate.dart';
import 'package:tracker/Context.dart';

void login(BuildContext context,String email, String password){
  // for(User u in sampleU){
  //   if(email.trim() == u.getEmail() && password.trim() == u.getPassword()){
  //     Provider.of<UserInfo>(context, listen: false).setcurrentUser(u);
  //     Provider.of<UserInfo>(context, listen: false).setloggedIn(true);
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage()),
      );

  //   }else {
  //     showInvalidLogin(context);
  //   }
  // }

}

Future<void> showInvalidLogin(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Invalid Credentials'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Your username or password is incorrect.'),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            elevation: 8,
            child: Text('Try Again'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void signupPressed(BuildContext context){
  Navigator.push(
    context,
    PageRouteBuilder(
        pageBuilder: (_, __, ___) => SignUpPage()),
  );
}

void forgotPasswordPressed(BuildContext context){
  Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => ForgotPasswordPage())
  );
}