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
                child: Text('Button 1'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                  minimumSize: Size(200, 100),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('Button 2'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(200, 100),
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Text('Button 3'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(400, 100),
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
