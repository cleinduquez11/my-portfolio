import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController earthquakeController = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=1696pO0ClAg');

  init() async {
    await earthquakeController.initialize();

    return earthquakeController;
  }
}
