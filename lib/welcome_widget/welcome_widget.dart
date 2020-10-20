/*
*  welcome_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/login_widget/login_widget.dart';
import 'package:shopie/values/values.dart';

class WelcomeWidget extends StatelessWidget {
  void onGroup7Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginWidget()));

  void onGroup5Pressed(BuildContext context) {}

  void onGroup5TwoPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 152,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 152,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 66, 9, 99),
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 34,
                    height: 100,
                    right: 27,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Text(
                              "Welcome to\nShopie Gas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w400,
                                fontSize: 27,
                                letterSpacing: 0.54,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 99,
                            height: 107,
                            child: Image.asset(
                              "assets/images/undraw-gardening-eaf3.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 324,
                height: 45,
                margin: EdgeInsets.only(top: 77),
                child: FlatButton(
                  onPressed: () => this.onGroup5Pressed(context),
                  color: Color.fromARGB(255, 62, 78, 187),
                  shape: RoundedRectangleBorder(
                    borderRadius: Radii.k7pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/layer-1-2.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Facebook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 324,
                height: 45,
                margin: EdgeInsets.only(top: 19),
                child: FlatButton(
                  onPressed: () => this.onGroup5TwoPressed(context),
                  color: Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 77, 77, 77),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: Radii.k7pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 16, 16, 16),
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/layer-1-7.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 16, 16, 16),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 325,
                height: 17,
                margin: EdgeInsets.only(top: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Text(
                        "Or",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 119, 119, 119),
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      height: 10,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 140,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 171, 171, 171),
                              ),
                              child: Container(),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 140,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 171, 171, 171),
                              ),
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 324,
                height: 45,
                margin: EdgeInsets.only(top: 22),
                child: FlatButton(
                  onPressed: () => this.onGroup7Pressed(context),
                  color: AppColors.secondaryElement,
                  shape: RoundedRectangleBorder(
                    borderRadius: Radii.k7pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon-zocial-email.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "By continuing you agree to our T&Cs. Please also check out our\nPrivate Policy. \n\nWe use your data to offer you a personalized experience and\nto better understand and improve our services.\nFor more information see here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 119, 119, 119),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
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
