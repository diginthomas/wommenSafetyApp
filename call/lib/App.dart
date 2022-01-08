import 'package:flutter/material.dart';


import 'Home.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  // _callNumber() async{
  //   const number = '9745973368'; //set the number here
  //   var res = await FlutterPhoneDirectCaller.callNumber(number);
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: HomeScreen());
  }
}
