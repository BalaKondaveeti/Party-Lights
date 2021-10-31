import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:partylights/screens/HomeScreen/HomeScreenWidget.dart';
import 'package:partylights/screens/LightsScreens/ScreenWidget.dart';

class Flicker extends StatelessWidget {
  final double height;
  const Flicker(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenWidget(
      height: height,
      texts: [
            FlickerAnimatedText(
              "Flicker",
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
            FlickerAnimatedText(
              "Flicker",
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
      screen: ScreenWidget(isFlicker:true),
      boxDecoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
