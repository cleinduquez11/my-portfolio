// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  final String? thumbnail;
  const BasicOverlayWidget({Key? key, this.controller, this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller!.value.isPlaying
          ? controller!.pause()
          : controller!.play(),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildIndicator(),
          ),
          buildPlay(),
          //  buildStandby()
        ],
      ),
    );
  }

  Widget buildIndicator() => VideoProgressIndicator(controller!,
      colors: VideoProgressColors(playedColor: Colors.white),
      allowScrubbing: true);

  Widget buildPlay() => controller!.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Stack(children: [
            Image.asset(thumbnail.toString()),
            Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 60)),
          ]));

  Widget buildStandby() => controller!.value.isInitialized
      ? Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Stack(children: [
            Icon(Icons.play_arrow, color: Colors.white, size: 60),
            Image.asset('lib/models/Assets/iot.jpg')
          ]))
      : Container();
}
