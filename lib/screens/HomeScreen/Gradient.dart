import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '/screens/HomeScreen/HomeScreenWidget.dart';
import '/screens/LightsScreens/GradientScreen.dart';

class GradientWidget extends StatelessWidget {
  final double height;
  const GradientWidget(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenWidget(
      height: height,
      texts: [
            WavyAnimatedText(
              "Gradient",
              textStyle: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            WavyAnimatedText(
              "Gradient",
              textStyle: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
      screen: GradientScreen(),
      boxDecoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple])
      ),
    );
  }
}
