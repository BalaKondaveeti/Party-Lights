import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  final double height;
  final List<AnimatedText> texts;
  final Widget screen;
  final BoxDecoration boxDecoration;
  const HomeScreenWidget({
    required this.height,
    required this.texts,
    required this.screen,
    required this.boxDecoration,
    Key? key,
  }) : super(key: key);

  screenNavigator(context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => screenNavigator(context),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        constraints: BoxConstraints(minWidth: 50),
        height: height,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: FittedBox(
            child: AnimatedTextKit(
              onTap: () => screenNavigator(context),
              repeatForever: true,
              pause: Duration.zero,
              animatedTexts: texts,
            ),
          ),
        ),
        decoration: boxDecoration,
      ),
    );
  }
}
