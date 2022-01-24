import 'package:call/Update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shake/shake.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'backend.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  void _callNumber(String number) async {
    
     await FlutterPhoneDirectCaller.callNumber(number);
    String message = "This is a test message!";
    List<String> recipents = ["1234567890", "5556787676"];

    sendSMS(message: message, recipients: recipents);
  }

  @override
  void initState() {
     Provider.of<Db>(context,listen: false).getData();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _callNumber(Provider.of<Db>(context).user.phone);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Women Saftey"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white70,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateScreen()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetCircularAnimator(
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.trip_origin,
                    color: Colors.redAccent[200],
                    size: 60,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('App is Running....',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
