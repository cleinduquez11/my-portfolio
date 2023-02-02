import 'package:flutter/material.dart';

class OverviewProvider with ChangeNotifier {
  String? ov1Title = "Mathematics";
  String? ov2Title = "English";
  String? ov3Title = "Science";
  String? ov4Title = "Technology";

  String? ov1Percent = "90%";
  String? ov2Percent = "80%";
  String? ov3Percent = "85%";
  String? ov4Percent = "85%";

  String? ov1LinePercent = "0.90";
  String? ov2LinePercent = "0.80";
  String? ov3LinePercent = "0.85";
  String? ov4LinePercent = "0.85";

  final overview = {
    //Computer Engineering
    "overview1": [
      {
        "name": "Mathematics",
        "percent": "90%",
        "linepercent": 0.90,
      },
      {
        "name": "English",
        "percent": "80%",
        "linepercent": 0.80,
      },
      {
        "name": "Science",
        "percent": "85%",
        "linepercent": 0.85,
      },
      {
        "name": "Technology",
        "percent": "85%",
        "linepercent": 0.85,
      },
    ],
    //Systems Engineer
    "overview2": [
      {
        "name": "Operating Systems",
        "percent": "70%",
        "linepercent": 0.70,
      },
      {
        "name": "Microprocessors & Microcontrollers",
        "percent": "70%",
        "linepercent": 0.70,
      },
      {
        "name": "Networks",
        "percent": "79%",
        "linepercent": 0.79,
      },
      {
        "name": "Designs",
        "percent": "60%",
        "linepercent": 0.60,
      },
    ],
    //Flutter Developer
    "overview3": [
      {
        "name": "UI/UX design",
        "percent": "71%",
        "linepercent": 0.71,
      },
      {
        "name": "State Management",
        "percent": "90%",
        "linepercent": 0.90,
      },
      {
        "name": "API integration",
        "percent": "90%",
        "linepercent": 0.90,
      },
      {
        "name": "Development Platform",
        "percent": "67%",
        "linepercent": 0.67,
      },
    ],
  };

  changeOverview(String animation) {
    if (animation == '2') {
      ov1Title = overview['overview1']![0]['name'].toString();
      ov2Title = overview['overview1']![1]['name'].toString();
      ov3Title = overview['overview1']![2]['name'].toString();
      ov4Title = overview['overview1']![3]['name'].toString();

      ov1Percent = overview['overview1']![0]['percent'].toString();
      ov2Percent = overview['overview1']![1]['percent'].toString();
      ov3Percent = overview['overview1']![2]['percent'].toString();
      ov4Percent = overview['overview1']![3]['percent'].toString();

      ov1LinePercent = overview['overview1']![0]['linepercent'].toString();
      ov2LinePercent = overview['overview1']![1]['linepercent'].toString();
      ov3LinePercent = overview['overview1']![2]['linepercent'].toString();
      ov4LinePercent = overview['overview1']![3]['linepercent'].toString();

      // print(ov1Title);
      notifyListeners();
      // ov2 = overview1[1]['name'].toString();
      // ov3 = overview1[2]['name'].toString();
      // ov4 = overview1[3]['name'].toString();
    } else if (animation == '1') {
      ov1Title = overview['overview2']![0]['name'].toString();
      ov2Title = overview['overview2']![1]['name'].toString();
      ov3Title = overview['overview2']![2]['name'].toString();
      ov4Title = overview['overview2']![3]['name'].toString();

      ov1Percent = overview['overview2']![0]['percent'].toString();
      ov2Percent = overview['overview2']![1]['percent'].toString();
      ov3Percent = overview['overview2']![2]['percent'].toString();
      ov4Percent = overview['overview2']![3]['percent'].toString();

      ov1LinePercent = overview['overview2']![0]['linepercent'].toString();
      ov2LinePercent = overview['overview2']![1]['linepercent'].toString();
      ov3LinePercent = overview['overview2']![2]['linepercent'].toString();
      ov4LinePercent = overview['overview2']![3]['linepercent'].toString();
      // print(ov1Title);
      notifyListeners();
      // ov2 = overview1[1]['name'].toString();
      // ov3 = overview1[2]['name'].toString();
      // ov4 = overview1[3]['name'].toString();
    } else if (animation == '0') {
      ov1Title = overview['overview3']![0]['name'].toString();
      ov2Title = overview['overview3']![1]['name'].toString();
      ov3Title = overview['overview3']![2]['name'].toString();
      ov4Title = overview['overview3']![3]['name'].toString();

      ov1Percent = overview['overview3']![0]['percent'].toString();
      ov2Percent = overview['overview3']![1]['percent'].toString();
      ov3Percent = overview['overview3']![2]['percent'].toString();
      ov4Percent = overview['overview3']![3]['percent'].toString();

      ov1LinePercent = overview['overview3']![0]['linepercent'].toString();
      ov2LinePercent = overview['overview3']![1]['linepercent'].toString();
      ov3LinePercent = overview['overview3']![2]['linepercent'].toString();
      ov4LinePercent = overview['overview3']![3]['linepercent'].toString();
      // print(ov1Title);
      notifyListeners();
      // ov2 = overview1[1]['name'].toString();
      // ov3 = overview1[2]['name'].toString();
      // ov4 = overview1[3]['name'].toString();
    } else {
      ov1Title = "";
      ov2Title = "";
      ov3Title = "";
      ov4Title = "";
      notifyListeners();
    }
  }
}
