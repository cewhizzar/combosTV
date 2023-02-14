import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key, required this.title, required this.stream});
  final String title;
  final String stream;
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
      body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _videoControl.value.aspectRatio,
                child: VideoPlayer(_videoControl),
              );
            } else {
              return const Center(
                child:
                    Text("Loading...", style: TextStyle(color: Colors.white)),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(
          _videoControl.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {
          print("Tap en reproducir matchpage");
          setState(() {
            if (_videoControl.value.isPlaying) {
              _videoControl.pause();
            } else {
              _videoControl.play();
            }
          });
        },
      ),
    );
  }
}
