import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen(
      {super.key,
      required this.title,
      required this.stream,
      required this.stream2});
  final String title;
  final String stream;
  final String stream2;
  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late VideoPlayerController _videoControl;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoControl = VideoPlayerController.network(widget.stream);
    _initializeVideoPlayerFuture = _videoControl.initialize();
    _videoControl.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(99, 158, 158, 158),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(232, 0, 0, 0),
        title: Text(widget.title, style: const TextStyle(color: Colors.orange)),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _videoControl.value.aspectRatio,
                  child: Chewie(
                      controller: ChewieController(
                          videoPlayerController: _videoControl,
                          autoPlay: true,
                          autoInitialize: true,
                          looping: false,
                          aspectRatio: _videoControl.value.aspectRatio,
                          allowedScreenSleep: false,
                          showOptions: false,
                          isLive: true)),
                );
              } else {
                return Column(
                  children: const [
                    SizedBox(
                      height: 150.0,
                    ),
                    CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Loading")
                  ],
                );
              }
            })),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text("OPCION 1"),
              onPressed: () {},
            ),
            TextButton(
              child: Text("OPCION 2"),
              onPressed: () {},
            )
          ],
        )
      ]),
    );
  }
}
