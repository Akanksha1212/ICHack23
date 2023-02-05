import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: glassmorphismWindow(size),
        ),
      ),
    );
  }

  Container glassmorphismWindow(Size size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("assets/images/great.gif"),
              height: 200,
              width: 200,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'You completed 2 rounds of Box Breathing \nand after analysing your breathing pattern \nwe\'d like to recommend you to repeat this \nprocess 3 times a day. ',
                  style: GoogleFonts.odibeeSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  child: Text(
                    'Details',
                    style: GoogleFonts.odibeeSans(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  height: 50,
                  width: 150,
                  color: Color(0xffC7C5FD),
                  onPressed: () {},
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  duration: 400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
