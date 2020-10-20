/*
*  onboarding2_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/onboarding3_widget/onboarding3_widget.dart';
import 'package:shopie/start_page_widget/start_page_widget.dart';
import 'package:shopie/values/values.dart';


class Onboarding2Widget extends StatelessWidget {
  
  void onButtonTextTwoPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding3Widget()));
  
  void onButtonTextPressed(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPageWidget()));

  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 249, 171),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 41,
                height: 24,
                margin: EdgeInsets.only(top: 49, right: 32),
                child: FlatButton(
                  onPressed: () => this.onButtonTextPressed(context),
                  color: Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  textColor: Color.fromARGB(255, 151, 96, 183),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 96, 183),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 232,
              margin: EdgeInsets.only(left: 72, top: 130, right: 64),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 21,
                    right: 0,
                    child: Image.asset(
                      "assets/images/path-44.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 0,
                    child: Image.asset(
                      "assets/images/path-45-3.png",
                      fit: BoxFit.none,
                    ),
                  ),
                  Positioned(
                    top: 42,
                    child: Image.asset(
                      "assets/images/undraw-on-the-way-ldaq.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 38),
                child: Text(
                  "Order for Gas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  "We deliver on time, our trucks are readily\navailable to deliver at your doorstep",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 119, 119, 119),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 309,
                height: 24,
                margin: EdgeInsets.only(bottom: 88),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.only(top: 11),
                      decoration: BoxDecoration(
                        color: AppColors.accentElement,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Container(),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.only(left: 9, top: 11),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryElement,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Container(),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.only(left: 9, top: 11),
                      decoration: BoxDecoration(
                        color: AppColors.accentElement,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Container(),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.only(left: 9, top: 11),
                      decoration: BoxDecoration(
                        color: AppColors.accentElement,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Container(),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 44,
                        height: 24,
                        child: FlatButton(
                          onPressed: () => this.onButtonTextTwoPressed(context),
                          color: Color.fromARGB(0, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          textColor: Color.fromARGB(255, 66, 9, 99),
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 66, 9, 99),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}