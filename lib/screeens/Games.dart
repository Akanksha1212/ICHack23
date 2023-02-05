import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class ImageList {
  late final String title;
  late final Image image;
  late final String content;

  ImageList({
    required this.title,
    required this.image,
    required this.content,
  });
}

final List<ImageList> listofimages = [
  ImageList(
      title: "Tongue Push Up",
      image: Image.asset(
        "assets/images/TongueUp.GIF",
      ),
      content:
          "Open your mouth slightly and suck your tongue upwards.\nPress your entire tongue into the roof of your mouth."),
  ImageList(
      title: "Tongue Curler",
      image: Image.asset("assets/images/TongueCurler.GIF"),
      content:
          "Open your mouth slightly and push the tip of your tongue against the roof of your mouth.\nSlide your tongue as far back as it will go.\nHold your tonque in this position for 1 second and then slide it back towards the front of your mouth."),
  ImageList(
      title: "Soft Palate Raise",
      image: Image.asset("assets/images/Mouth.GIF"),
      content:
          "Open your mouth wide and contract the muscles at the back of your throat.\nTry to create lots of space in your mouth by lifting your soft palate.\nHold your soft palate in this raised position for 1 second."),
  ImageList(
      title: "Chewing",
      image: Image.asset("assets/images/Chew.GIF"),
      content:
          "Close your mouth and slightly suck in your cheeks.\nImagine you are eating something chewy and work on it for 30 seconds on your right side.\nMove the imaginary food over to the left with your tongue and repeat for another 30 seconds."),
  ImageList(
      title: "Tongue Press Down",
      image: Image.asset("assets/images/TongueDown.GIF"),
      content:
          "Open your mouth and press the tip of your tongue against the back of your bottom teeth.\nPush your entire tongue down into the floor of your mouth."),
];
var index = 0;

class _GamesState extends State<Games> {
  CountDownController _controller = CountDownController();
  bool _isPause = false;
  bool _isReset = true;
  PageController controller = PageController();

  List<Widget> _list = <Widget>[
    new Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              listofimages[0].image,
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[0].title,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[0].content,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    new Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              listofimages[1].image,
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[1].title,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[1].content,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              listofimages[2].image,
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[2].title,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[2].content,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    new Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              listofimages[3].image,
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[3].title,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[3].content,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    new Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              listofimages[4].image,
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[4].title,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                listofimages[4].content,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    )
  ];
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff8d1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              // decoration: BoxDecoration(
              //     color: const Color(0xff5964b3),
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(35),
              //         bottomRight: Radius.circular(35))),
              child: PageView(
                children: _list,
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (num) {
                  setState(() {
                    _curr = num;
                    index++;
                    if (index > 3) index = 0;
                    _controller.start();
                  });
                },
              ),
            ),
            Center(
              child: Column(
                children: [
                  CircularCountDownTimer(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 3.5,
                    duration: 14,
                    fillColor: Colors.amber,
                    controller: _controller,
                    backgroundColor: Colors.white54,
                    strokeWidth: 15.0,
                    strokeCap: StrokeCap.round,
                    isTimerTextShown: true,
                    isReverse: false,
                    textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
                    ringColor: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_isPause) {
                                _isPause = false;
                                _controller.resume();
                              } else {
                                _isPause = true;
                                _controller.pause();
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(_isPause ? Icons.play_arrow : Icons.pause),
                              Text(_isPause ? 'Resume' : 'Pause')
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_isReset) {
                                _isReset = false;
                                _controller.start();
                              } else {
                                _controller.start();
                              }
                            });
                          },
                          child: Row(
                            children: [Icon(Icons.repeat), Text("Restart")],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
