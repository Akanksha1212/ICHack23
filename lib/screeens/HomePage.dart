import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff8d1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Color.fromARGB(255, 58, 108, 139).withOpacity(0.9),
                  //     BlendMode.dstATop),
                  image: AssetImage(
                    'assets/images/Background.jpg',
                  ),
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(58, 255, 255, 255),
                            radius: 35,
                            child: Text(
                              'Vi',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ), //Text
                          ),
                          //CircleAva
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/profile");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: GestureDetector(
                    child: Card(
                      color: Color(0xffddeafb),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/dashboard.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Dashboard",
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/stats");
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: GestureDetector(
                    child: Card(
                      color: Color(0xffddeafb),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/doctor.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Talk to Doctor",
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/stats");
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Card(
                  color: Color(0xffddeafb),
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/meditation.png",
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Excercise",
                        style: GoogleFonts.comfortaa(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 47, 47, 47),
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/gamehome");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
