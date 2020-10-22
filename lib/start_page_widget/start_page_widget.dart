/*
*  start_page_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/share_location_widget/share_location_widget.dart';
import 'package:shopie/values/values.dart';


class StartPageWidget extends StatelessWidget {
  
  void onGroup1Pressed(BuildContext context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShareLocationWidget()));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 66, 9, 99),
        ),
        child: Column(
          children: [


            Container(
              width: 105,
              height: 130,
              margin: EdgeInsets.only(top: 63),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 102,
                    child: Text(
                      "Gas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'SFNS',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        letterSpacing: 0.48,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    width: 100,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 1,
                          child: Text(
                            " Shopie",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SFNS',
                              fontSize: 20,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 10,
                          child: Container(
                            width: 74,
                            height: 74,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 249, 171),
                              borderRadius: BorderRadius.all(Radius.circular(36.07603)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          top: 7,
                          right: 25,
                          child: Image.asset(
                            "assets/images/path-3.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 38,
                          child: Image.asset(
                            "assets/images/path-4.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 36,
                          child: Image.asset(
                            "assets/images/path-5.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),







            Container(
              width: 281,
              height: 321,
              margin: EdgeInsets.only(top: 71),
              child: Image.asset(
                "assets/images/gas-intro-1.png",
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Container(
              width: 324,
              height: 45,
              margin: EdgeInsets.only(bottom: 33),
              child: FlatButton(
                onPressed: () => this.onGroup1Pressed(context),
                color: AppColors.primaryElement,
                shape: RoundedRectangleBorder(
                  borderRadius: Radii.k7pxRadius,
                ),
                textColor: Color.fromARGB(255, 66, 9, 99),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 9, 99),
                    fontFamily: 'SFNS',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}