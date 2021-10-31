import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:screen/screen.dart';

class SOSScreenFull extends StatefulWidget {
  const SOSScreenFull({Key? key}) : super(key: key);

  @override
  _SOSScreenFullState createState() => _SOSScreenFullState();
}

class _SOSScreenFullState extends State<SOSScreenFull> {
  Color color = Colors.white;
  bool disposer = false;
  bool hasFlashLight = true;
  double previousBrightness = 1;
  @override
  void initState() {
    super.initState();
    sosFullScreenCallBack();
    Screen.brightness.then((value) => previousBrightness = value);
    Screen.keepOn(true);
    Screen.setBrightness(1);
    hasFlashLight = Provider.of<bool>(context, listen: false);
  }

  Future<void> sosFullScreenCallBack() async {
    await partOne();
    await partOne();
    await partOne();
    await partTwo();
    await partTwo();
    await partTwo();

    sosFullScreenCallBack();
  }

  Future<void> partOne() async {
    if (!disposer)
      setState(() {
        color = Colors.white;
        if (hasFlashLight) Flashlight.lightOn();
      });
    await Future.delayed(Duration(milliseconds: 200));
    if (!disposer)
      setState(() {
        color = Colors.black;
        if (hasFlashLight) Flashlight.lightOff();
      });
    await Future.delayed(Duration(milliseconds: 200));
  }

  Future<void> partTwo() async {
    if (!disposer)
      setState(() {
        color = Colors.white;
        if (hasFlashLight) Flashlight.lightOn();
      });
    await Future.delayed(Duration(milliseconds: 700));
    if (!disposer)
      setState(() {
        color = Colors.black;
        if (hasFlashLight) Flashlight.lightOff();
      });
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
    );
  }

  @override
  void dispose() {
    Screen.keepOn(false);
    Screen.setBrightness(previousBrightness);
    if (hasFlashLight) Flashlight.lightOff();
    disposer = true;
    super.dispose();
  }
}
