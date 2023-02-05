import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'CountDown.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class ImageList {
  late final String title;
  late final Image image;

  ImageList({
    required this.title,
    required this.image,
  });
}

final List<ImageList> listofimages = [
  ImageList(title: "title", image: Image.asset("assets/images/excercise1.gif")),
  ImageList(
      title: "title1", image: Image.asset("assets/images/excercise2.gif")),
  ImageList(
      title: "title2", image: Image.asset("assets/images/excercise1.gif")),
  ImageList(
      title: "title3", image: Image.asset("assets/images/excercise2.gif")),
  ImageList(
      title: "title4", image: Image.asset("assets/images/excercise2.gif")),
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
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: listofimages[0].image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    ),
    new Center(
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: listofimages[1].image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    ),
    Center(
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: listofimages[2].image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    ),
    new Center(
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: listofimages[3].image,
                height: 100,
                width: 100,
              ),
              title: Text(listofimages[index].title),
            ),
          ],
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
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  color: const Color(0xff5964b3),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
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
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    duration: 14,
                    fillColor: Colors.amber,
                    controller: _controller,
                    backgroundColor: Colors.white54,
                    strokeWidth: 10.0,
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
