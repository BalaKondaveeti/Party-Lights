import 'package:flutter/cupertino.dart';
import 'package:screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '/ImpStrings.dart';
import '../LightsScreens/SOSScreenFull.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:provider/provider.dart';

import '/Screens/widgets/logo.dart';
import '/Screens/widgets/RateApp.dart';
import 'drawerWidgetItem.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  final double width;
  DrawerWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: width,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Logo(),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Flash Light",
                    style: TextStyle(fontSize: 18),
                  ),
                  FlashSwitch()
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            Flexible(
              child: DrawerWidgetItem(
                name: "Start SOS",
                icon: Icons.warning,
                color: Colors.red,
                width: width,
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SOSScreenFull(),
                  ),
                ),
              ),
            ),
            RateApp(),
            const Spacer(),
            TextButton(
              onPressed: () async {
                print(await launch(
                    "https://nationriseinternational.blogspot.com/2021/06/privacy-policy-for-partylights-app.html"));
              },
              child: const Text("Privacy Policy"),
            ),
            const SizedBox(height: 10),
            Text(
              ImpStrings.version,
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class FlashSwitch extends StatefulWidget {
  const FlashSwitch({
    Key? key,
  }) : super(key: key);

  @override
  _FlashSwitchState createState() => _FlashSwitchState();
}

class _FlashSwitchState extends State<FlashSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: (value) {
        this.value = value;
        setState(() {
          if (Provider.of<bool>(context, listen: false))
            (value) ? Flashlight.lightOn() : Flashlight.lightOff();
          else {
            Screen.setBrightness(1);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Scaffold(
                      backgroundColor: Colors.white,
                    )));
          }
        });
      },
      activeColor: Colors.blue,
    );
  }
}
