import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partylights/ImpStrings.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:screen/screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_flashlight/flutter_flashlight.dart';

class GradientScreen extends StatefulWidget {
  const GradientScreen({Key? key}) : super(key: key);

  @override
  _GradientScreenState createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  Color? color1;
  Color? color2;
  double gradientNumber = 0;
  Random random = Random();
  bool onFlashLight = true;
  double flashSpeed = 1;
  double actualflashSpeed = 1;
  double gradientSpeed = 1;
  double actualgradientSpeed = 1;
  bool disposed = false;

  @override
  void initState() {
    Screen.keepOn(true);
    Screen.setBrightness(1);
    super.initState();
    gradientColors();
    flashLight();
  }

  Future<void> flashLight() async {
    if (onFlashLight) {
      await Flashlight.lightOn();
      await Future.delayed(
          Duration(milliseconds: (400 * actualflashSpeed).toInt()));
      await Flashlight.lightOff();
      await Future.delayed(
          Duration(milliseconds: (400 * actualflashSpeed).toInt()));
      if (!disposed) flashLight();
    }
  }

  Future<void> gradientColors() async {
    var number = random.nextInt(ImpStrings.colors.length - 1);
    color2 = color1 ?? ImpStrings.colors[number + 1];
    setState(() {});
    color1 = color1 == ImpStrings.colors[number]
        ? ImpStrings.colors[random.nextInt(ImpStrings.colors.length - 1)]
        : ImpStrings.colors[number];
    setState(() {});

    while (gradientNumber < 1.0) {
      setState(() {});
      gradientNumber += 0.01;
      await Future.delayed(
          Duration(microseconds: (1200 * actualgradientSpeed).toInt()));
    }
    print("Im here");
    gradientNumber = 0;
    gradientColors();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1!, color2!],
        stops: [gradientNumber, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    if (flashSpeed > 0.25) {
                                      {
                                        flashSpeed = flashSpeed - 0.25;

                                        actualflashSpeed =
                                            actualflashSpeed + 0.25;
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              Flexible(
                                  child: Text(
                                      "${flashSpeed.toStringAsFixed(2)} x")),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    if (flashSpeed < 2) {
                                      flashSpeed = flashSpeed + 0.25;
                                      actualflashSpeed =
                                          actualflashSpeed - 0.25;
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                          const Text("FlashLight Speed")
                        ],
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          onFlashLight = !onFlashLight;
                          if (onFlashLight &&
                              Provider.of<bool>(context, listen: false))
                            flashLight();
                          setState(() {});
                        },
                        icon: Icon((onFlashLight)
                            ? Icons.flashlight_on
                            : Icons.flashlight_off),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    if (gradientSpeed > 0.25) {
                                      {
                                        gradientSpeed = gradientSpeed - 0.25;

                                        actualgradientSpeed =
                                            actualgradientSpeed + 0.25;
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              Flexible(
                                  child: Text(
                                      (gradientSpeed).toStringAsFixed(2) +
                                          " x")),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    if (gradientSpeed < 2) {
                                      gradientSpeed = gradientSpeed + 0.25;
                                      actualgradientSpeed =
                                          actualgradientSpeed - 0.25;
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                          const Text("Gradient Speed")
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
