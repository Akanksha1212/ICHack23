import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Wrap the widget in a Container for padding and margin
      child: Row(
        // Use a Row to arrange the widgets in two columns
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            // Create a container for the image with a fixed size
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/your_image.png'),
                // Replace 'images/your_image.png' with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                // The title text
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                // The description text
                'Description',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
