import 'package:flutter/material.dart';
import 'package:call/Home.dart';
import 'package:provider/provider.dart';
import 'package:call/backend.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreen createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  @override
  void initState() {
    Provider.of<Db>(context, listen: false).initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff2d2d2d),
        title: Text('Safety '),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_police,
                  size: 90,
                  color: Color(0xff3fc56b),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 23,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  color: Color(0xffff6480),
                  child: Text('Start Application'),
                ),
              ]),
        ),
      ),
    );
  }
}
