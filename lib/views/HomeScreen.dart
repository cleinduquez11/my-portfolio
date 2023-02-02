// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:clein_portfolio/Provider/animation.dart';
import 'package:clein_portfolio/Provider/overview.dart';
import 'package:clein_portfolio/Provider/video.dart';
import 'package:clein_portfolio/consts.dart';
import 'package:clein_portfolio/views/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../Provider/video_player_widget.dart';

final Uri _url = Uri.parse(
    'https://www.credly.com/badges/68658595-8959-42da-9df7-9c0bc153772e/public_url');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? vidController;
  PageController? pagecontroller;
  @override
  void initState() {
    vidController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/test-785c9.appspot.com/o/lv_0_20230120001220%5B1%5D.mp4?alt=media&token=d53d744f-ad2a-4f30-b091-4677d97da655')
      ..addListener(() => setState(() {}))
      ..initialize().then((value) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    vidController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OverviewProvider overview = Provider.of<OverviewProvider>(context);
    AnimationProvider animate = Provider.of<AnimationProvider>(context);
    VideoProvider video = Provider.of<VideoProvider>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(),
              //Intro and Overview Page
              Stack(
                clipBehavior: Clip.none,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 600,

                        // color: bgColor,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              left: 200,
                              bottom: animate.ontap ? 40 : 200,
                              child: InkWell(
                                onHover: (value) {
                                  animate.hoveredProfile(value);
                                },
                                onTap: () {},
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: animate.onHoveredColor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(10, 10),
                                            color: Colors.black38,
                                            blurRadius: 20),
                                        BoxShadow(
                                            offset: Offset(-10, -10),
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            spreadRadius: 20,
                                            blurRadius: 20)
                                      ]),
                                  width: 150,
                                  height: animate.ontap ? 160 : 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Badge',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await _launchUrl();
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Container(
                                                width: 100,
                                                height: 100,
                                                child: Text(''),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      image: AssetImage(
                                                          'lib/models/Assets/awsbadge.png'),
                                                      fit: BoxFit.contain),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150),
                                                  color: primaryColor,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              left: 400,
                              bottom: animate.ontap ? 40 : 200,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: bgColor,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(10, 10),
                                          color: Colors.black38,
                                          blurRadius: 20),
                                      BoxShadow(
                                          offset: Offset(-10, -10),
                                          color: Colors.white.withOpacity(0.85),
                                          spreadRadius: 20,
                                          blurRadius: 20)
                                    ]),
                                width: animate.ontap ? 260 : 150,
                                height: animate.ontap ? 160 : 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Programming Language',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: primaryColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          child: Text(
                                            'C, Java, PHP, Dart, Python, Javascript, HTML, CSS',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: animate.ontap ? 60 : 100,
                              child: InkWell(
                                onTap: () {
                                  animate.ontap = !animate.ontap;
                                },
                                onHover: (value) {
                                  animate.hoveredBadge(value);
                                },
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: animate.onHoveredBadgeColor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(10, 10),
                                            color: Colors.black38,
                                            blurRadius: 20),
                                        BoxShadow(
                                            offset: Offset(-10, -10),
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            spreadRadius: 20,
                                            blurRadius: 20)
                                      ]),
                                  width: animate.ontap ? 400 : 450,
                                  height: animate.ontap ? 300 : 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Container(
                                              width: 150,
                                              height: 150,
                                              child: Text(''),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    image: AssetImage(
                                                        'lib/models/Assets/CLEIN.png'),
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                                color: lightColor,
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Clein Winslee Duquez',
                                          style: TextStyle(
                                              fontSize: 36,
                                              color: primaryColor),
                                        ),
                                      ),
                                      AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            'Computer Engineer',
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                color: primaryColor),
                                            speed: const Duration(
                                                milliseconds: 30),
                                          ),
                                          TypewriterAnimatedText(
                                            'Flutter Developer',
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                color: primaryColor),
                                            speed: const Duration(
                                                milliseconds: 30),
                                          ),
                                          TypewriterAnimatedText(
                                            'Systems Engineer',
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                color: primaryColor),
                                            speed: const Duration(
                                                milliseconds: 30),
                                          ),
                                        ],
                                        repeatForever: true,
                                        onNext: (p0, p1) {
                                          overview
                                              .changeOverview(p0.toString());
                                          // print(p0);
                                        },

                                        //totalRepeatCount: 2,
                                        pause: const Duration(seconds: 5),
                                        displayFullTextOnTap: true,
                                        stopPauseOnTap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 600,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 200,
                              top: 100,
                              child: Container(
                                width: 600,
                                height: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: bgColor,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(10, 10),
                                          color: Colors.black38,
                                          blurRadius: 20),
                                      BoxShadow(
                                          offset: Offset(-10, -10),
                                          color: Colors.white.withOpacity(0.85),
                                          spreadRadius: 20,
                                          blurRadius: 20)
                                    ]),
                                child: Text(''),
                              ),
                            ),
                            Positioned(
                              right: 525,
                              top: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: bgColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(10, 10),
                                                color: Colors.black38,
                                                blurRadius: 20),
                                            BoxShadow(
                                                offset: Offset(-10, -10),
                                                color: Colors.white
                                                    .withOpacity(0.85),
                                                spreadRadius: 20,
                                                blurRadius: 20)
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            overview.ov1Title.toString(),
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: smalltitleSize),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: GFProgressBar(
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              type: GFProgressType.linear,
                                              animation: true,
                                              circleWidth: 30,
                                              radius: 100,
                                              percentage: double.parse(overview
                                                  .ov1LinePercent
                                                  .toString()),
                                              lineHeight: 30,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  overview.ov1Percent
                                                      .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              backgroundColor: Colors.black26,
                                              progressBarColor: lightColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 525,
                              top: 340,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: bgColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(10, 10),
                                                color: Colors.black38,
                                                blurRadius: 20),
                                            BoxShadow(
                                                offset: Offset(-10, -10),
                                                color: Colors.white
                                                    .withOpacity(0.85),
                                                spreadRadius: 20,
                                                blurRadius: 20)
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            overview.ov2Title.toString(),
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: smalltitleSize),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: GFProgressBar(
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              type: GFProgressType.linear,
                                              animation: true,
                                              circleWidth: 30,
                                              radius: 100,
                                              percentage: double.parse(overview
                                                  .ov2LinePercent
                                                  .toString()),
                                              lineHeight: 30,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  overview.ov2Percent
                                                      .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              backgroundColor: Colors.black26,
                                              progressBarColor: lightColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 275,
                              top: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: bgColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(10, 10),
                                                color: Colors.black38,
                                                blurRadius: 20),
                                            BoxShadow(
                                                offset: Offset(-10, -10),
                                                color: Colors.white
                                                    .withOpacity(0.85),
                                                spreadRadius: 20,
                                                blurRadius: 20)
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            overview.ov3Title.toString(),
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: smalltitleSize),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: GFProgressBar(
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              type: GFProgressType.linear,
                                              animation: true,
                                              circleWidth: 30,
                                              radius: 100,
                                              percentage: double.parse(overview
                                                  .ov3LinePercent
                                                  .toString()),
                                              lineHeight: 30,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  overview.ov3Percent
                                                      .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              backgroundColor: Colors.black26,
                                              progressBarColor: lightColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 275,
                              top: 340,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: bgColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(10, 10),
                                                color: Colors.black38,
                                                blurRadius: 20),
                                            BoxShadow(
                                                offset: Offset(-10, -10),
                                                color: Colors.white
                                                    .withOpacity(0.85),
                                                spreadRadius: 20,
                                                blurRadius: 20)
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            overview.ov4Title.toString(),
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: smalltitleSize),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: GFProgressBar(
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12),
                                              type: GFProgressType.linear,
                                              animation: true,
                                              circleWidth: 30,
                                              radius: 100,
                                              percentage: double.parse(overview
                                                  .ov4LinePercent
                                                  .toString()),
                                              lineHeight: 30,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  overview.ov4Percent
                                                      .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              backgroundColor: Colors.black26,
                                              progressBarColor: lightColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 100,
                              right: 550,
                              child: Text(
                                'Overview',
                                style: TextStyle(
                                    fontSize: 48,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1050,
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.black38,
                          blurRadius: 20),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.white.withOpacity(0.85),
                          spreadRadius: 20,
                          blurRadius: 20)
                    ]),

                // color: bgColor,

                ///Start of Featured Skills
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Featured Skills',
                      style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/circuit.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Internet of Things',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- MQTT library',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- Embedded Systems',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- Electronic Circuits',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- ESP32 and Arduino Prototyping',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredIot(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.only(bottom: animate.xposIot),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthIot,
                            height: animate.heightIot,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/iot.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Internet of Things',
                                    style: TextStyle(
                                        fontSize: 36, color: primaryColor),
                                  ),
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Networks and Security',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Hardware and Software',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Application Development',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  repeatForever: true,
                                  onNext: (p0, p1) {},

                                  //totalRepeatCount: 2,
                                  pause: const Duration(milliseconds: 1000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/Cross.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'X-Platform Development',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- Flutter Framework',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- Firebase',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- AWS cloud computing',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredXPlatform(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.only(bottom: animate.xposXplat),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthXplat,
                            height: animate.heightXplat,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/Cross.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'X-Platform development',
                                      style: TextStyle(
                                          fontSize: 32, color: primaryColor),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Android',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Web',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'IOS',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Linux',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'MAC',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Windows',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                    ],

                                    repeatForever: true,
                                    onNext: (p0, p1) {},

                                    //totalRepeatCount: 2,
                                    pause: const Duration(milliseconds: 1000),
                                    displayFullTextOnTap: true,
                                    stopPauseOnTap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/webrtc.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'WebRTC',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- Realtime Communication',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- WebSockets',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- One to Many',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredWebRTC(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding:
                                EdgeInsets.only(bottom: animate.xposWebRtc),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthwebRtc,
                            height: animate.heightWebRtc,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/webrtc.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'WebRTC',
                                    style: TextStyle(
                                        fontSize: 36, color: primaryColor),
                                  ),
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Realtime Communication',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Socket programming',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Peer to Peer',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'One to Many',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  repeatForever: true,
                                  onNext: (p0, p1) {},

                                  //totalRepeatCount: 2,
                                  pause: const Duration(milliseconds: 1000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/web.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Web development',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- Vanilla PHP and Javascript',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- MERN stack(MongoDB,Express,React and NodeJS',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- Laravel Framework',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredWeb(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.only(bottom: animate.xposWeb),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthWeb,
                            height: animate.heightWeb,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/web.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Web development',
                                    style: TextStyle(
                                        fontSize: 36, color: primaryColor),
                                  ),
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Vanilla HTML/PHP',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'React Native',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Flutter Web',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Laravel Framework',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  repeatForever: true,
                                  onNext: (p0, p1) {},

                                  //totalRepeatCount: 2,
                                  pause: const Duration(milliseconds: 1000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/automation.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Automation',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- Web Automation',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- API integration(REST and GraphQL)',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- RaspberryPi automation',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredAutomation(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.only(bottom: animate.xposAuto),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthAuto,
                            height: animate.heightAuto,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/automation.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Automation',
                                      style: TextStyle(
                                          fontSize: 32, color: primaryColor),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Web Automation',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Scripting(Python, Php, JavaScript)',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Arduino',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                      TypewriterAnimatedText(
                                        'Raspberry Pi',
                                        textStyle: TextStyle(
                                            fontSize: 24, color: primaryColor),
                                        speed: const Duration(milliseconds: 30),
                                      ),
                                    ],

                                    repeatForever: true,
                                    onNext: (p0, p1) {},

                                    //totalRepeatCount: 2,
                                    pause: const Duration(milliseconds: 1000),
                                    displayFullTextOnTap: true,
                                    stopPauseOnTap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/datascience.jpg'),
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: bgColor.withOpacity(0.50),
                                            ),
                                            width: 600,
                                            height: 400,
                                            child: Text('')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    bgColor.withOpacity(0.86),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 600,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Data Science',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: titleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '- Machine Learning',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Text(
                                                  '- OPENCV deep learning',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: smalltitleSize,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ));
                          },
                          onHover: (value) {
                            animate.hoveredDataScience(value);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.only(bottom: animate.xposData),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      spreadRadius: 20,
                                      blurRadius: 20)
                                ]),
                            width: animate.widthData,
                            height: animate.heightData,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Container(
                                            width: 360,
                                            height: 200,
                                            child: Text(''),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/models/Assets/datascience.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Data Science',
                                    style: TextStyle(
                                        fontSize: 36, color: primaryColor),
                                  ),
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Machine Learning',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Algorithmn testing',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'Data Analytics',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TypewriterAnimatedText(
                                      'One to Many',
                                      textStyle: TextStyle(
                                          fontSize: 24, color: primaryColor),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  repeatForever: true,
                                  onNext: (p0, p1) {},

                                  //totalRepeatCount: 2,
                                  pause: const Duration(milliseconds: 1000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              //Start of Experiences
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2200,
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.black38,
                          blurRadius: 20),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.white.withOpacity(0.85),
                          spreadRadius: 20,
                          blurRadius: 20)
                    ]),

                // color: bgColor,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'IOT based Emergency Notification System',
                      style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      padding: EdgeInsets.only(bottom: animate.xposIot),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                spreadRadius: 20,
                                blurRadius: 20)
                          ]),
                      width: 1200,
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Container(
                                      margin: EdgeInsets.all(20),
                                      width: 900,
                                      height: 500,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: video_player_widget(
                                          controller: vidController,
                                          thumbnail:
                                              "lib/models/Assets/iot.jpg",
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: lightColor,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Digital Clock',
                      style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      padding: EdgeInsets.only(bottom: animate.xposIot),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                spreadRadius: 20,
                                blurRadius: 20)
                          ]),
                      width: 1200,
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Container(
                                      margin: EdgeInsets.all(20),
                                      width: 900,
                                      height: 500,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'lib/models/Assets/clock.jpg')),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: lightColor,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Document Tracker System',
                      style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      padding: EdgeInsets.only(bottom: animate.xposIot),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                spreadRadius: 20,
                                blurRadius: 20)
                          ]),
                      width: 1200,
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Container(
                                      margin: EdgeInsets.all(20),
                                      width: 900,
                                      height: 500,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'lib/models/Assets/incoming.png')),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: lightColor,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
