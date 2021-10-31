import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:partylights/screens/LightsScreens/ScreenWidget.dart';
import 'HomeScreenWidget.dart';

class DiscoLights extends StatelessWidget {
  final double height;
  const DiscoLights(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenWidget(
      height: height,
      texts: [
        ColorizeAnimatedText(
          "DISCO LIGHTS",
          speed: const Duration(milliseconds: 300),
          colors: [
            Colors.white,
            Colors.red,
            Colors.indigo,
            Colors.blue,
            Colors.green,
            Colors.white,
            Colors.purple,
            Colors.red,
            Colors.orange,
            Colors.white,
          ],
          textStyle: TextStyle(
            fontFamily: "Disco",
            fontSize: 500,
          ),
        ),
      ],
      screen: ScreenWidget(),
      boxDecoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
        gradient: SweepGradient(
          colors: [
            Colors.pink,
            Colors.orange,
            Colors.red,
            Colors.green,
            Colors.amber,
            Colors.indigoAccent[700]!,
            Colors.blue,
            Colors.pink,
          ],
          stops: [
            0.0,
            0.1428571428571429,
            0.1428571428571429 * 2,
            0.1428571428571429 * 3,
            0.1428571428571429 * 4,
            0.1428571428571429 * 5,
            0.1428571428571429 * 6,
            0.1428571428571429 * 7,
          ],
          startAngle: 0.25,
          endAngle: 2.75,
        ),
      ),
    );
  }
}




