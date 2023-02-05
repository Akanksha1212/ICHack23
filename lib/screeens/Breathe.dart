import 'package:animated_button/animated_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:noise_meter/noise_meter.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool _isRecording = false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;
  int score = 0;
  @override
  void initState() {
    _controller = VideoPlayerController.asset(asset);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
    _noiseMeter = new NoiseMeter(onError);
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void onData(NoiseReading noiseReading) {
    this.setState(() {
      if (!this._isRecording) {
        this._isRecording = true;
        Future.delayed(Duration(seconds: 10), () {
          score += 10;
        });
      }
    });

    print(noiseReading.maxDecibel);
  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() async {
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription!.cancel();
        _noiseSubscription = null;
      }
      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final asset = "assets/images/animation1.mp4";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: Stack(children: [
                VideoPlayer(_controller),
                Positioned(
                  // top: 20,
                  // left: 660,
                  child: AnimatedButton(
                    child:
                        // Image(
                        //   image: AssetImage("assets/trophy.png"),
                        //   height: 40,
                        //   width: 40,
                        // ),
                        Container(
                      child: Text(
                        '$score',
                        style: GoogleFonts.odibeeSans(
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height: 70,
                    width: 90,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, '/result');
                    },
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    duration: 400,
                    shape: BoxShape.rectangle,
                  ), //Icon
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  child: FloatingActionButton(
                      backgroundColor: _isRecording ? Colors.red : Colors.blue,
                      onPressed: _isRecording ? stop : start,
                      child: _isRecording ? Icon(Icons.stop) : Icon(Icons.mic)),
                ),
                Positioned(
                  top: 160,
                  left: 380,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Wrap the play or pause in a call to `setState`. This ensures the
                      // correct icon is shown.
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ]),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
