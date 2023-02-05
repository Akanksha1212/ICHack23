import 'package:flutter/material.dart';
class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        ElevatedButton(
        onPressed: null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(
                  'assets/images/logo.png'), // or AssetImage('assets/image.jpg') for local images
              height: 100,
              width: 100,
            ),
            SizedBox(height: 10),
            Text(
              'Button with Image',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
              ElevatedButton(
                onPressed: null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/images/logo.png'), // or AssetImage('assets/image.jpg') for local images
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Button with Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              ElevatedButton(
                onPressed: null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/images/logo.png'), // or AssetImage('assets/image.jpg') for local images
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Button with Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
            ],
          ),
    );
  }
}
