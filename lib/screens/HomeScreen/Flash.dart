import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '/screens/HomeScreen/HomeScreenWidget.dart';
import '/screens/LightsScreens/ScreenWidget.dart';

class Flash extends StatelessWidget {
  final double height;
  const Flash(
    this.height, {
    Key? key,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return HomeScreenWidget(
      height: height,
      texts: [
        FadeAnimatedText(
          "Flash",
        ),
        FadeAnimatedText(
          "Flash",
        ),
      ],
      screen: ScreenWidget(isFlash: true,),
      boxDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
