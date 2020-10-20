/*
*  tracking2_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/values/values.dart';


class Tracking2Widget extends StatelessWidget {
  
  void onIconAwesomeSearchPressed(BuildContext context) {
  
  }
  
  void onIconIonicMdMenuPressed(BuildContext context) {
  
  }
  
  void onGroup4Pressed(BuildContext context) {
  
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 57,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 57,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 29,
                          top: 20,
                          right: 28,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 21,
                                  height: 16,
                                  margin: EdgeInsets.only(top: 1),
                                  child: FlatButton(
                                    onPressed: () => this.onIconIonicMdMenuPressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/icon-ionic-md-menu.png",),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  child: FlatButton(
                                    onPressed: () => this.onIconAwesomeSearchPressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/icon-awesome-search.png",),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 504,
                    margin: EdgeInsets.only(left: 16, top: 23, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 504,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackground,
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 19,
                          top: 20,
                          right: 26,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 139,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 122,
                                        height: 132,
                                        margin: EdgeInsets.only(top: 4),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 7),
                                                child: Text(
                                                  "Lawrence A.",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.secondaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 24,
                                                    letterSpacing: -1.19879,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                margin: EdgeInsets.only(left: 3, top: 19),
                                                child: Image.asset(
                                                  "assets/images/icon-ionic-ios-checkmark-circle.png",
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                margin: EdgeInsets.only(top: 20),
                                                child: Image.asset(
                                                  "assets/images/group-39.png",
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 7,
                                                height: 7,
                                                margin: EdgeInsets.only(left: 7, top: 24),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 178, 178, 178),
                                                  borderRadius: BorderRadius.all(Radius.circular(3.5)),
                                                ),
                                                child: Container(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 100,
                                        height: 91,
                                        margin: EdgeInsets.only(top: 48),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Order received",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  letterSpacing: 0.28,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 19),
                                                child: Text(
                                                  "On the way",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.primaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 21),
                                                child: Text(
                                                  "Delivered",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.primaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 124,
                                        height: 124,
                                        child: Image.asset(
                                          "assets/images/icons8-paper-plane-125px.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 267,
                                  height: 1,
                                  margin: EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryElement,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Container(
                                height: 38,
                                margin: EdgeInsets.only(left: 7, top: 13, right: 67),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 140,
                                        height: 38,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Phone number",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  letterSpacing: 0.32,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "080 334 567 3434",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.secondaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 14),
                                        child: Text(
                                          "00564",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 66,
                                margin: EdgeInsets.only(left: 7, top: 9, right: 42),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 91,
                                        height: 66,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Address",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  letterSpacing: 0.32,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "High level",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.secondaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "Volume (kg)",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors.primaryText,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    letterSpacing: 0.32,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        margin: EdgeInsets.only(top: 3),
                                        child: Image.asset(
                                          "assets/images/icons8-qr-code-125px.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 7, top: 4),
                                  child: Text(
                                    "6",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 267,
                                  height: 1,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryElement,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 7, top: 13),
                                  child: Text(
                                    "Delivery method",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: 0.32,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 152,
                                  height: 18,
                                  margin: EdgeInsets.only(left: 6, top: 3),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          margin: EdgeInsets.only(top: 3),
                                          child: Image.asset(
                                            "assets/images/layer-1-8.png",
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Standard delivery ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.secondaryText,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 158,
                                  height: 39,
                                  margin: EdgeInsets.only(left: 6, top: 11),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 1),
                                        child: Text(
                                          "Receiving time (ETA)",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            letterSpacing: 0.32,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 115,
                                            margin: EdgeInsets.only(top: 2),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Container(
                                                    width: 16,
                                                    height: 16,
                                                    child: Image.asset(
                                                      "assets/images/layer-1-6.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 4),
                                                    child: Text(
                                                      "8am to 12pm",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: AppColors.secondaryText,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        Positioned(
                          left: 41,
                          top: 82,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "06/10/20 | 10:23am ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.accentText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 21),
                                  child: Text(
                                    "06/10/20 | 11:10am ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 202,
                          right: 28,
                          child: Text(
                            "Receipt Number",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 0.28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 324,
                      height: 45,
                      child: FlatButton(
                        onPressed: () => this.onGroup4Pressed(context),
                        color: AppColors.secondaryElement,
                        shape: RoundedRectangleBorder(
                          borderRadius: Radii.k7pxRadius,
                        ),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "Done",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
            Positioned(
              top: 18,
              child: Text(
                "Tracking Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}