import 'package:flutter/material.dart';

import 'Countdown.dart';

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
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListTile(
                          leading: SizedBox(
                            child: listofimages[index].image,
                            height: 100,
                            width: 100,
                          ),
                          title: Text(listofimages[index].title),
                          onTap: () {
                            setState(() {
                              if (index <= 4) index++;
                              if (index > 4) index = 0;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                child: Countdown(),
                height: 200,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
