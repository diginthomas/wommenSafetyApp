import 'package:flutter/material.dart';
import 'package:call/Home.dart';
import 'package:call/backend.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Db(),
      child: MaterialApp(theme: ThemeData.dark(), home: const HomeScreen()),
    );
  }
}
