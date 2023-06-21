import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {Key? key,
      required this.theWidth,
      required this.theHeight,
      required this.theBorderColor,
      required this.theGradientColor,
      required this.theChild})
      : super(key: key);

  final theWidth;
  final theHeight;
  final theChild;
  final List<Color> theGradientColor;
  final theBorderColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(),
            ),
            //gradient effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    // color: Colors.white.withOpacity(0.13),
                    color: theBorderColor),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: theGradientColor),
                // Colors.white.withOpacity(0.15),
                // Colors.white.withOpacity(0.05)
              ),
            ),
            //child
            Center(
              child: theChild,
            ),
          ],
        ),
      ),
    );
  }
}