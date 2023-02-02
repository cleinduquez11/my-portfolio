// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'BasicOverlayWidget.dart';

class video_player_widget extends StatelessWidget {
  final VideoPlayerController? controller;
  final String? thumbnail;

  const video_player_widget({Key? key, this.controller, this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller != null && controller!.value.isInitialized
        ? Container(alignment: Alignment.center, child: buildVideo())
        :
        // Container(alignment: Alignment.center, child: buildVideo());
        Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() => Stack(
        children: [
          buildVideoPLayer(),
          Positioned.fill(
              child: BasicOverlayWidget(
            controller: controller,
            thumbnail: thumbnail,
          )),
        ],
      );

  Widget buildVideoPLayer() => AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: VideoPlayer(controller!));
}
