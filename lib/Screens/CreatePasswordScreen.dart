// import 'package:flutter/material.dart';
// import 'package:tracker/colors.dart';
// import 'package:tracker/DataAccess.dart';
//
// import 'HomePageScreen.dart';
// class CreatePasswordScreen extends StatefulWidget{
//   @override
//   _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
// }
//
// class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
//   String _passwordController;
//   String _passwordConfirmController;
//   bool _error;
//
//   @override
//   void initState() {
//     _passwordController = "";
//     _passwordConfirmController = "";
//     _error = false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: backBlue,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//         backgroundColor: newBlue,
//         centerTitle: true,
//         title: Text(
//           'Create Password',
//           style: TextStyle(color: backBlue),
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
//         children: [
//           Text("Select a password. You'll need this if you'd like to export your data.",style: basicText,),
//           _getErrorText(),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Password',
//             ),
//             cursorColor: darkBlueAccent,
//             obscureText: true,
//             onChanged: (value){
//               setState(() {
//                 _passwordController = value;
//               });
//             },
//           ),
//           SizedBox(height: 12.0),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Confirm Password',
//             ),
//             cursorColor: darkBlueAccent,
//             obscureText: true,
//             onChanged: (value){
//               setState(() {
//                 _passwordConfirmController = value;
//               });
//             },
//           ),
//           SizedBox(height: 12.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               RaisedButton(
//                   elevation: 8.0,
//                   child: Text('Submit'),
//                   textColor: backBlue,
//                   color: newBlue,
//                   onPressed: () {
//                     _submit();
//                   }),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   _submit() async{
//     if(_passwordController == _passwordConfirmController && _passwordController != ""){
//       DataAccess.instance.insertPassword(_passwordController);
//       Navigator.push(context,
//           PageRouteBuilder(
//               pageBuilder: (_, __, ___) => HomePage()));
//     }
//     else{
//       setState(() {
//         _error = true;
//       });
//     }
//   }
//
//   Widget _getErrorText(){
//     if(_error){
//       return Text("Passwords don't match",style: errorText,);
//     }
//     return Container();
//   }
//
// }