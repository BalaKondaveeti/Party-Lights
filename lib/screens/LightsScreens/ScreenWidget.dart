import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:partylights/ImpStrings.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:screen/screen.dart';

class ScreenWidget extends StatefulWidget {
  final bool isFast;
  final bool isFlicker;
  final bool isFlash;
  const ScreenWidget(
      {this.isFast = false,
      this.isFlicker = false,
      this.isFlash = false,
      Key? key})
      : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  Color color = Colors.red;
  bool disposed = false;
  bool onFlashLight = true;
  List<Color> colors = ImpStrings.colors;
  int listLength = ImpStrings.colors.length;
  Random random = Random();
  double flashSpeed = 1;
  double actualflashSpeed = 1.25;
  double brightness = 0.9;
  @override
  void initState() {
    if (widget.isFast) {
      actualflashSpeed = 0.25;
      flashSpeed = 2;
    }
    Screen.keepOn(true);
    Screen.brightness.then((value) {
      if (value < 90)
        Screen.setBrightness(brightness);
      else
        brightness = value;
    });

    super.initState();
    if (Provider.of<bool>(context, listen: false)) flashLight();
    if (widget.isFlash)
      flashColor();
    else
      screenColor();
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

  Future<void> screenColor() async {
    color = colors[random.nextInt(listLength)];
    if (!disposed) setState(() {});
    await Future.delayed(Duration(milliseconds: 200));
    if (widget.isFlicker) {
      if (!disposed)
        setState(() {
          color = Colors.black;
        });
      await Future.delayed(Duration(milliseconds: 100));
    }
    if (!disposed) screenColor();
  }

  Future<void> flashColor() async {
    color = Colors.white;
    if (!disposed) setState(() {});
    await Future.delayed(Duration(milliseconds: 300));
    color = Colors.black;
    if (!disposed) setState(() {});
    await Future.delayed(Duration(milliseconds: 150));

    if (!disposed) flashColor();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
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
                                onPressed: (widget.isFast)
                                    ? () {}
                                    : () {
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
                                child:
                                    Text("${flashSpeed.toStringAsFixed(2)} x")),
                            Flexible(
                              child: IconButton(
                                onPressed: (widget.isFast)
                                    ? () {}
                                    : () {
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
                                  if (brightness > 0)
                                    brightness = brightness - 0.01;
                                  Screen.setBrightness(brightness);
                                },
                                icon: const Icon(Icons.remove),
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Flexible(
                                child: Text(
                                    (brightness * 100).toStringAsFixed(0))),
                            Flexible(
                              child: IconButton(
                                onPressed: () {
                                  if (brightness < 1)
                                    brightness = brightness + 0.01;
                                  Screen.setBrightness(brightness);
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                        const Text("Screen Brightness")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
