/*
*  add_new_card_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/order_successful_widget/order_successful_widget.dart';
import 'package:shopie/values/values.dart';

class AddNewCardWidget extends StatelessWidget {
  String OrderId = "";

  void onContinuePressed(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OrderSuccessfulWidget(this.OrderId)));

  void onIconAwesomeArrowLPressed(BuildContext context) =>
      Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Card",
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
      ), body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 53,
                    margin: EdgeInsets.only(left: 16, top: 58, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter card Number",
                                contentPadding:
                                EdgeInsets.only(left: 15, top: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: ".SF NS",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 15,
                          child: Text(
                            "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.accentText,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 53,
                    margin: EdgeInsets.only(left: 16, top: 24, right: 69),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 156,
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Expiry Date",
                                contentPadding:
                                EdgeInsets.only(left: 15, top: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: ".SF NS",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 108,
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "CVV",
                                contentPadding:
                                EdgeInsets.only(left: 15, top: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: ".SF NS",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 53,
                    margin: EdgeInsets.only(left: 16, top: 24, right: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 239, 239),
                      boxShadow: [
                        Shadows.secondaryShadow,
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Name  on Card",
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: ".SF NS",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      autocorrect: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 110,
                      height: 20,
                      margin: EdgeInsets.only(left: 16, top: 21),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                              borderRadius: Radii.k7pxRadius,
                            ),
                            child: Container(),
                          ),
                          Spacer(),
                          Text(
                            "Save Card?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 59, 72, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
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
                      margin: EdgeInsets.only(top: 44),
                      child: FlatButton(
                        onPressed: () => this.onContinuePressed(context),
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

          ],
        ),
      ),
    );
  }
}
