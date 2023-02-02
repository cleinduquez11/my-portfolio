// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage('lib/models/Assets/clein.jpg'),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
