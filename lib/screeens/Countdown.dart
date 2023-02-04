import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularCountDownTimer(
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
          onComplete: () {
            Alert(
                    context: context,
                    title: 'Done',
                    style: AlertStyle(
                      isCloseButton: true,
                      isButtonVisible: false,
                      titleStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    type: AlertType.success)
                .show();
          },
          textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
          ringColor: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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
        icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
        label: Text(_isPause ? 'Resume' : 'Pause'),
      ),
    );
  }
}
