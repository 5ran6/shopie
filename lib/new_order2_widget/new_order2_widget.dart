/*
*  new_order2_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/review_order_widget/review_order_widget.dart';
import 'package:shopie/values/values.dart';


class NewOrder2Widget extends StatelessWidget {
  
  void onGroup4Pressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewOrderWidget()));
  
  void onIconAwesomeArrowLPressed(BuildContext context) {
  
  }
  
  void onViewTwoPressed(BuildContext context) {
  
  }
  
  void onViewPressed(BuildContext context) {
  
  }
  
  void onStandardDeliveryPressed(BuildContext context) {
  
  }
  
  void onViewThreePressed(BuildContext context) {
  
  }
  
  void onViewFourPressed(BuildContext context) {
  
  }
  
  void onCustomDeliveryPressed(BuildContext context) {
  
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
                          left: 22,
                          top: 25,
                          child: FlatButton(
                            onPressed: () => this.onIconAwesomeArrowLPressed(context),
                            color: Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                            ),
                            textColor: Color.fromARGB(255, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/icon-awesome-arrow-left.png",),
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
                      ],
                    ),
                  ),
                  Container(
                    height: 504,
                    margin: EdgeInsets.only(left: 16, top: 47, right: 15),
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
                          left: 18,
                          top: 54,
                          right: 29,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(left: 11),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 143,
                                        height: 40,
                                        child: FlatButton(
                                          onPressed: () => this.onViewTwoPressed(context),
                                          color: Color.fromARGB(255, 238, 238, 238),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(9)),
                                          ),
                                          textColor: Color.fromARGB(255, 66, 9, 99),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Information",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 66, 9, 99),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 143,
                                        height: 40,
                                        child: FlatButton(
                                          onPressed: () => this.onViewPressed(context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(255, 255, 211, 26),
                                              width: 3,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          textColor: Color.fromARGB(255, 66, 9, 99),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Details",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 66, 9, 99),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 153,
                                  height: 19,
                                  margin: EdgeInsets.only(left: 1, top: 33),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          margin: EdgeInsets.only(top: 4),
                                          child: Image.asset(
                                            "assets/images/layer-1-8.png",
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 6),
                                          child: Text(
                                            "Delivery Methods",
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
                              Container(
                                height: 31,
                                margin: EdgeInsets.only(left: 1, top: 11, right: 17),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 135,
                                        height: 31,
                                        child: FlatButton(
                                          onPressed: () => this.onStandardDeliveryPressed(context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(255, 255, 211, 26),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: Radii.k7pxRadius,
                                          ),
                                          textColor: Color.fromARGB(255, 16, 16, 16),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Standard Delivery",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 135,
                                        height: 31,
                                        child: FlatButton(
                                          onPressed: () => this.onCustomDeliveryPressed(context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(255, 50, 50, 50),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: Radii.k7pxRadius,
                                          ),
                                          textColor: Color.fromARGB(255, 16, 16, 16),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Custom Delivery",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(top: 11),
                                  child: Text(
                                    "* Order will be delivered the same day\n* Order will only be delivered within city area",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 131,
                                  height: 19,
                                  margin: EdgeInsets.only(top: 25),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          margin: EdgeInsets.only(top: 3),
                                          child: Image.asset(
                                            "assets/images/layer-1-6.png",
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 6),
                                          child: Text(
                                            "Receiving Time",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              letterSpacing: 0.3,
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
                                  margin: EdgeInsets.only(left: 9, top: 48),
                                  child: Text(
                                    "* Estimated time of arrival (ETA)",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
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
                          "Continue",
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
              left: 35,
              top: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "New Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 186,
                      height: 31,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 91,
                              height: 31,
                              child: FlatButton(
                                onPressed: () => this.onViewThreePressed(context),
                                color: AppColors.primaryElement,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 255, 211, 26),
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: Radii.k7pxRadius,
                                ),
                                textColor: Color.fromARGB(255, 16, 16, 16),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  "8am to 12pm",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 88,
                              height: 31,
                              margin: EdgeInsets.only(left: 7),
                              child: FlatButton(
                                onPressed: () => this.onViewFourPressed(context),
                                color: AppColors.primaryElement,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 50, 50, 50),
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: Radii.k7pxRadius,
                                ),
                                textColor: Color.fromARGB(255, 16, 16, 16),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  "12pm to 6pm",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}