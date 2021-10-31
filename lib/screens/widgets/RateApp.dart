import 'package:flutter/material.dart';
import 'package:partylights/ImpStrings.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'drawerWidgetItem.dart';

class RateApp extends StatefulWidget {
  RateApp();

  @override
  _RateAppState createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  RateMyApp? rateMyApp;

  @override
  Widget build(BuildContext context) {
    return RateMyAppBuilder(
      rateMyApp: RateMyApp(googlePlayIdentifier: ImpStrings.packageName),
      onInitialized: (context, rateMyApp) {
        setState(() {
          this.rateMyApp = rateMyApp;
        });
      },
      builder: (context) => (rateMyApp == null)
          ? Center(
              child: Container(
                  height: 80,
                  child: const Center(child: CircularProgressIndicator())),
            )
          : Flexible(
              child: DrawerWidgetItem(
                name: "Rate this app",
                icon: Icons.star,
                color: Colors.yellow[700],
                width: double.infinity,
                onClicked: () {
                  rateMyApp!.showStarRateDialog(context,
                      title: "Thankyou for rating",
                      starRatingOptions: StarRatingOptions(initialRating: 4),
                      actionsBuilder: (context, stars) {
                    return (stars! < 4)
                        ? [
                            RateMyAppNoButton(
                              rateMyApp as RateMyApp,
                              text: 'Cancel',
                            ),
                            RateMyAppNoButton(
                              rateMyApp as RateMyApp,
                              text: 'Ok',
                            )
                          ]
                        : [
                            RateMyAppNoButton(
                              rateMyApp as RateMyApp,
                              text: 'Cancel',
                            ),
                            RateMyAppRateButton(
                              rateMyApp as RateMyApp,
                              text: 'Ok',
                            )
                          ];
                  });
                },
              ),
            ),
    );
  }
}
