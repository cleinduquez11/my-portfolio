import 'package:clein_portfolio/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFf5f5f5),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10), color: Colors.black38, blurRadius: 20),
            BoxShadow(
                offset: Offset(-10, -10),
                color: Colors.white.withOpacity(0.85),
                spreadRadius: 20,
                blurRadius: 20)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Color(0xFFf5f5f5),
            //     boxShadow: [
            //       BoxShadow(
            //           offset: Offset(10, 10),
            //           color: Colors.black38,
            //           blurRadius: 20),
            //       BoxShadow(
            //           offset: Offset(-10, -10),
            //           color: Colors.white.withOpacity(0.85),
            //           spreadRadius: 20,
            //           blurRadius: 20)
            //     ]),
            child: Tooltip(
              message: "follow me on Instagram",
              child: MediaQuery.of(context).size.width <= 500
                  ? Text('@C7EIN',
                      style: TextStyle(
                          fontSize: 24,
                          color: primaryColor,
                          fontWeight: FontWeight.w700))
                  : Text('@C7EIN',
                      style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width <= 500 ? 10 : 400,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFf5f5f5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Colors.black38,
                      blurRadius: 20),
                  BoxShadow(
                      offset: Offset(-10, -10),
                      color: Colors.white.withOpacity(0.85),
                      //      spreadRadius: 20,
                      blurRadius: 20)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Tooltip(
                message: "In progress..",
                triggerMode: TooltipTriggerMode.tap,
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width <= 500 ? 14 : 24,
                      color: primaryColor),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFf5f5f5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Colors.black38,
                      blurRadius: 20),
                  BoxShadow(
                      offset: Offset(-10, -10),
                      color: Colors.white.withOpacity(0.85),
                      //  spreadRadius: 20,
                      blurRadius: 20)
                ]),
            child: Tooltip(
              message: "In progress..",
              triggerMode: TooltipTriggerMode.tap,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width <= 500 ? 14 : 24,
                      color: primaryColor),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFf5f5f5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Colors.black38,
                      blurRadius: 20),
                  BoxShadow(
                      offset: Offset(-10, -10),
                      color: Colors.white.withOpacity(0.85),
                      //  spreadRadius: 20,
                      blurRadius: 20)
                ]),
            child: Tooltip(
              message: "In progress..",
              triggerMode: TooltipTriggerMode.tap,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  'Gallery',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width <= 500 ? 14 : 24,
                      color: primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
