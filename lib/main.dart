/*
*  main.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopie/sampleCard.dart';
import 'package:shopie/login_widget/login_widget.dart';
import 'package:shopie/onboarding1_widget/onboarding1_widget.dart';
import 'package:shopie/start_page_widget/start_page_widget.dart';
import 'package:shopie/tracking_widget/tracking_widget.dart';

import 'package:shopie/pay_for_order_widget/pay_for_order_widget.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  void checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (!prefs.getBool('firstTime')) {
        firstTime = false;
        if (prefs.getString('user') != null) {
          loggedIn = true;

          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => TrackingWidget()));
        } else {
          loggedIn = false;
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => StartPageWidget()));
        }
      }
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  bool firstTime = true;
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstTime
          ? Onboarding1Widget()
          : (loggedIn ? TrackingWidget() : StartPageWidget()),

      // home: PayForOrderWidget("Ocholi Francis", "080234923492323", '52 Kg', '1' , '09 am - 10 am', '1600', '1400', '', 'Online Payment'),
      // home: SampleCard(),
    );
  }
}
