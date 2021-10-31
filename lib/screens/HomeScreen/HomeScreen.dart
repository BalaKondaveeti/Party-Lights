import '../LightsScreens/SOSScreenFull.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../widgets/Drawerwidget.dart';
import 'Disco.dart';
import 'Fast.dart';
import 'Flicker.dart';
import 'Flash.dart';
import 'Gradient.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.red,
      gradient: SweepGradient(
        colors: [
          Colors.purple,
          Colors.indigo,
          Colors.red,
          Colors.green,
          Colors.yellow,
          Colors.orange,
          Colors.blue,
          Colors.purple,
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
      ),
    );
  }

  late AppBar appBar;

  @override
  void initState() {
    super.initState();
    appBar = AppBar(
      title: Text(
        "P A R T Y  L I G H T S",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SOSScreenFull(),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "S O S",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.all(3),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<bool>(context, listen: false));

    var mediaQuery = MediaQuery.of(context);
    double height = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    return Container(
      decoration: boxDecoration(),
      child: Scaffold(
        appBar: appBar,
        drawer: DrawerWidget(
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: DiscoLights(height / 3),
                ),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: Flash(height / 3)),
                    Flexible(child: Fast(height / 3)),
                  ],
                )),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: Flicker(height / 3)),
                    Flexible(child: GradientWidget(height / 3)),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
