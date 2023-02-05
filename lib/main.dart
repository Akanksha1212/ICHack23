import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terrafire/screeens/Breathe.dart';
import 'package:terrafire/screeens/Dashboard.dart';
import 'package:terrafire/screeens/GameHome.dart';
import 'package:terrafire/screeens/Games.dart';
import 'package:terrafire/screeens/HomePage.dart';
import 'package:terrafire/screeens/Profile.dart';
import 'package:terrafire/screeens/Report.dart';
import 'package:terrafire/screeens/Result.dart';
import 'package:terrafire/screeens/Third.dart';
import 'package:terrafire/screeens/ChatBot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => MyApp());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/stats':
            return MaterialPageRoute(builder: (context) => HealthReport());
          case '/games':
            return MaterialPageRoute(builder: (context) => Games());
          case '/profile':
            return MaterialPageRoute(builder: (context) => Profile());
          case '/gamehome':
            return MaterialPageRoute(builder: (context) => GameHome());
          case '/breathe':
            return MaterialPageRoute(builder: (context) => VideoPlayerScreen());
          case '/result':
            return MaterialPageRoute(builder: (context) => Result());
          case '/talktodoctor':
            return MaterialPageRoute(builder: (context) => Chatbot());
        }
      },
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),

        // decoration: BoxDecoration(color: Color(0xffFBFFE2)),
        // child: Image.asset('assets/images/logo.png'),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Image(
            //   image: AssetImage("assets/"),
            // ),
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 370,
              height: 370,
            ),
          ],
        ),
      ),
    );
  }
}
