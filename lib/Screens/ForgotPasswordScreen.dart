import 'package:flutter/material.dart';
import 'package:tracker/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
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
          title: const Text(
            'Symptom Tracker',
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
                children: [
                  //SizedBox(height: 80.0),
                  Text(
                    "Enter your email. If an account is currently associated with it we'll send you a link.",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextField(
                    controller: _usernameController,
                    cursorColor: darkBlueAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        elevation: 8.0,
                        child: Text('Done'),
                        textColor: Colors.white,
                        color: newBlue,
                        onPressed: () {
                          _poppin();
                          //Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              )
            ]));
  }

  Future<void> _poppin() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("We'll get back to you!"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Cross your fingers for an email!'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: 8,
              child: Text('Back to Login'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
