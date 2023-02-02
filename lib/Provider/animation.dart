import 'package:clein_portfolio/consts.dart';
import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  bool onHover = false;
  Color onHoveredColor = bgColor;
  Color onHoveredBadgeColor = bgColor;
  bool ontap = false;
  double xposIot = 0;
  double? ypos;
  double heightIot = 400;
  double widthIot = 400;

  double xposXplat = 0;
  double? yposXplat;
  double heightXplat = 400;
  double widthXplat = 400;

  double xposWebRtc = 0;
  double? yposWebrtc;
  double heightWebRtc = 400;
  double widthwebRtc = 400;

  double xposWeb = 0;
  double? yposWeb;
  double heightWeb = 400;
  double widthWeb = 400;

  double xposAuto = 0;
  double? yposAuto;
  double heightAuto = 400;
  double widthAuto = 400;

  double xposData = 0;
  double? yposData;
  double heightData = 400;
  double widthData = 400;

  hoveredProfile(bool hover) {
    if (hover) {
      onHoveredColor = Color.fromARGB(255, 205, 226, 239);
      notifyListeners();
    } else {
      onHoveredColor = bgColor;
      notifyListeners();
    }
  }

  hoveredBadge(bool hover) {
    if (hover) {
      onHoveredBadgeColor = Color.fromARGB(255, 205, 226, 239);
      notifyListeners();
    } else {
      onHoveredBadgeColor = bgColor;
      notifyListeners();
    }
  }

  hoveredIot(bool hover) {
    if (hover) {
      xposIot = 50;
      widthIot = 500;
      heightIot = 500;

      notifyListeners();
    } else {
      xposIot = 0;
      widthIot = 400;
      heightIot = 400;

      notifyListeners();
    }
  }

  hoveredXPlatform(bool hover) {
    if (hover) {
      xposXplat = 50;
      widthXplat = 500;
      heightXplat = 500;

      notifyListeners();
    } else {
      xposXplat = 0;
      widthXplat = 400;
      heightXplat = 400;

      notifyListeners();
    }
  }

  hoveredWebRTC(bool hover) {
    if (hover) {
      xposWebRtc = 50;
      widthwebRtc = 500;
      heightWebRtc = 500;

      notifyListeners();
    } else {
      xposWebRtc = 0;
      widthwebRtc = 400;
      heightWebRtc = 400;

      notifyListeners();
    }
  }

  hoveredWeb(bool hover) {
    if (hover) {
      xposWeb = 50;
      widthWeb = 500;
      heightWeb = 500;

      notifyListeners();
    } else {
      xposWeb = 0;
      widthWeb = 400;
      heightWeb = 400;

      notifyListeners();
    }
  }

  hoveredAutomation(bool hover) {
    if (hover) {
      xposAuto = 50;
      widthAuto = 500;
      heightAuto = 500;

      notifyListeners();
    } else {
      xposAuto = 0;
      widthAuto = 400;
      heightAuto = 400;

      notifyListeners();
    }
  }

  hoveredDataScience(bool hover) {
    if (hover) {
      xposData = 50;
      widthData = 500;
      heightData = 500;

      notifyListeners();
    } else {
      xposData = 0;
      widthData = 400;
      heightData = 400;

      notifyListeners();
    }
  }

  animatedClick() {
    ontap = !ontap;

    notifyListeners();
  }
}
