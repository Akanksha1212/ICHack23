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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
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
                    SizedBox(
                      child: Countdown(),
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
