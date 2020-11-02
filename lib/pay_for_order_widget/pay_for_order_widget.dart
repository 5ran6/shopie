/*
*  pay_for_order_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/add_new_card_widget/add_new_card_widget.dart';
import 'package:shopie/values/values.dart';

class PayForOrderWidget extends StatefulWidget {
  String name;
  String phone;
  String volume;
  String address;
  String selectedTime;
  String amount;
  String paid_amount;
  String coupon_code;
  String paymentMethod;

  PayForOrderWidget(
      @required this.name,
      @required this.phone,
      @required this.volume,
      @required this.address,
      @required this.selectedTime,
      @required this.amount,
      @required this.paid_amount,
      @required this.coupon_code,
      @required this.paymentMethod);

  @override
  _PayForOrderWidgetState createState() => _PayForOrderWidgetState();
}

class _PayForOrderWidgetState extends State<PayForOrderWidget> {
  void onGroup4Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddNewCardWidget()));

  void onAddNewPressed(BuildContext context) {}

  void onIconAwesomeArrowLPressed(BuildContext context) =>
      Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Method",
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
                          child: Image.asset(
                            "assets/images/icon-awesome-arrow-left-4.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 29),
                      child: Text(
                        "Choose your preferred\npayment option from the options available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 119, 119, 119),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(left: 26, top: 20, right: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Payment method",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              letterSpacing: -1.19879,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(top: 13, right: 5),
                            child: Image.asset(
                              "assets/images/icon-feather-plus.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 71,
                            height: 21,
                            margin: EdgeInsets.only(top: 4),
                            child: FlatButton(
                              onPressed: () => this.onAddNewPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 59, 72, 255),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Add new",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 72, 255),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 71,
                    margin: EdgeInsets.only(left: 16, top: 17, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 71,
                            decoration: BoxDecoration(
                              color: AppColors.ternaryBackground,
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 18,
                          right: 22,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    "assets/images/icons8-mastercard-logo-125px.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  margin: EdgeInsets.only(top: 7),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 239, 239, 239),
                                    border: Border.all(
                                      width: 1.5,
                                      color: Color.fromARGB(255, 66, 9, 99),
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.5)),
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
                  Container(
                    height: 71,
                    margin: EdgeInsets.only(left: 16, top: 23, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 71,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackground,
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 255, 211, 26),
                              ),
                              boxShadow: [
                                Shadows.secondaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 22,
                          top: 15,
                          right: 22,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 41,
                                  height: 41,
                                  child: Image.asset(
                                    "assets/images/icons8-visa-125px.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryElement,
                                    border: Border.all(
                                      width: 1.5,
                                      color: Color.fromARGB(255, 66, 9, 99),
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.5)),
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
                          "Confirm",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Payment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 160),
                      child: Text(
                        "Debit Card\n554 *** *** 2345",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Text(
                        "Debit Card\n554 *** *** 2345",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
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
          ],
        ),
      ),
    );
  }
}
