import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:partylights/screens/LightsScreens/ScreenWidget.dart';

import 'HomeScreenWidget.dart';

class Fast extends StatelessWidget {
  final double height;
  const Fast(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenWidget(
      height: height,
      texts: [
        RotateAnimatedText(
          "S U P E R",
          duration: Duration(milliseconds: 200),
          textStyle: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        RotateAnimatedText(
          "F A S T",
          duration: Duration(milliseconds: 200),
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      screen: ScreenWidget(isFast: true),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.red[300]!,
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

