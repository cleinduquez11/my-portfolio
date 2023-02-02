// ignore_for_file: prefer_const_constructors

import 'package:clein_portfolio/Provider/animation.dart';
import 'package:clein_portfolio/Provider/overview.dart';
import 'package:clein_portfolio/Provider/video.dart';
import 'package:clein_portfolio/consts.dart';
import 'package:clein_portfolio/responsive.dart';
import 'package:clein_portfolio/responsiveViews/mobile.dart';
import 'package:clein_portfolio/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OverviewProvider>(
          create: (context) => OverviewProvider(),
        ),
        ChangeNotifierProvider<AnimationProvider>(
          create: (context) => AnimationProvider(),
        ),
        ChangeNotifierProvider<VideoProvider>(
          create: (context) => VideoProvider(),
        ),
      ],
      child: MaterialApp(
        //debugShowMaterialGrid: true,
        //showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        title: 'Clein\'s Portfolio',
        theme: ThemeData.dark().copyWith(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: bgColor,
            canvasColor: bgColor,
            textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: bodyTextColor)
                .copyWith(
                  bodyLarge: TextStyle(fontSize: titleSize),
                  titleLarge: const TextStyle(color: bodyTextColor),
                  titleSmall: const TextStyle(color: bodyTextColor),
                  titleMedium: const TextStyle(color: bodyTextColor),
                )),
        // home: HomeScreen(),
        home: Responsive(mobile: Mobile(), desktop: HomeScreen()),
      ),
    );
  }
}
