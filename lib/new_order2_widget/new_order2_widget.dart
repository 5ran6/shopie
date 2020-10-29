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

class NewOrder2Widget extends StatefulWidget {
  @override
  _NewOrder2WidgetState createState() => _NewOrder2WidgetState();
}

class _NewOrder2WidgetState extends State<NewOrder2Widget> {
  void onGroup4Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ReviewOrderWidget()));

  void onIconAwesomeArrowLPressed(BuildContext context) {}

  void onViewTwoPressed(BuildContext context) {}

  void onViewPressed(BuildContext context) {}

  void onStandardDeliveryPressed(BuildContext context) {}

  void onViewThreePressed(BuildContext context) {}

  void onViewFourPressed(BuildContext context) {}

  void onCustomDeliveryPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Order",
          style: TextStyle(
            color: Colors.purple[900],
            fontFamily: 'SFNS',
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        leading: BackButton(
          color: Colors.yellow,
          onPressed: () => this.onIconAwesomeArrowLPressed(context),
        ),
      ),
      body: Container(
        //   constraints: BoxConstraints.expand(),
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
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 480,
                    margin: EdgeInsets.only(left: 16, top: 10, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 470,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackground,
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 15,
                          right: 19,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(left: 11),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 120,
                                        height: 40,
                                        child: FlatButton(
                                          onPressed: () =>
                                              this.onViewTwoPressed(context),
                                          color: Color.fromARGB(
                                              255, 238, 238, 238),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9)),
                                          ),
                                          textColor:
                                              Color.fromARGB(255, 66, 9, 99),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Information",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 9, 99),
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
                                        width: 120,
                                        height: 40,
                                        child: FlatButton(
                                          onPressed: () =>
                                              this.onViewPressed(context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 211, 26),
                                              width: 3,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          textColor:
                                              Color.fromARGB(255, 66, 9, 99),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Details",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 9, 99),
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
                                  width: 200,
                                  height: 19,
                                  margin: EdgeInsets.only(left: 1, top: 33),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                            "Payment Methods",
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
                                margin: EdgeInsets.only(
                                    left: 1, top: 11, right: 17),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 135,
                                        height: 31,
                                        child: FlatButton(
                                          onPressed: () => this
                                              .onStandardDeliveryPressed(
                                                  context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 211, 26),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: Radii.k7pxRadius,
                                          ),
                                          textColor:
                                              Color.fromARGB(255, 16, 16, 16),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Card Payment",
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
                                          onPressed: () => this
                                              .onCustomDeliveryPressed(context),
                                          color: AppColors.primaryElement,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 50, 50, 50),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: Radii.k7pxRadius,
                                          ),
                                          textColor:
                                              Color.fromARGB(255, 16, 16, 16),
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Pay on Delivery",
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
                                    "* Card payments will be processed online in-app \n* Payment on delivery will be given to the delivery agent at arrival",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ETA(BuildContext context, String hour) {
    return Container(
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
          "$hour",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
