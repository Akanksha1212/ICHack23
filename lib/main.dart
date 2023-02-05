import 'package:flutter/material.dart';
import 'package:terrafire/screeens/Games.dart';
import 'package:terrafire/screeens/HomePage.dart';
import 'package:terrafire/screeens/Third.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => MyApp());
        case '/home':
          return MaterialPageRoute(builder: (context) => HomePage());
        case '/stats':
          return MaterialPageRoute(builder: (context) => Third());
        case '/games':
          return MaterialPageRoute(builder: (context) => Games());
        // case '/talktodoctor':
        //   return MaterialPageRoute(builder: (context) => Practice());
      }
    },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
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
