/*
*  new_order_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/new_order2_widget/new_order2_widget.dart';
import 'package:shopie/values/values.dart';


class NewOrderWidget extends StatelessWidget {
  
  void onIconAwesomeArrowLPressed(BuildContext context) {
  
  }
  
  void onInformationPressed(BuildContext context) {
  
  }
  
  void onDetailsPressed(BuildContext context) {
  
  }
  
  void onLayer1Pressed(BuildContext context) {
  
  }
  
  void onGroup4Pressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrder2Widget()));
  
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
                                Image.asset("assets/images/icon-awesome-arrow-left-3.png",),
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
                          left: 20,
                          top: 55,
                          right: 19,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(left: 9, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 143,
                                        height: 40,
                                        child: FlatButton(
                                          onPressed: () => this.onInformationPressed(context),
                                          color: AppColors.primaryElement,
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
                                          onPressed: () => this.onDetailsPressed(context),
                                          color: Color.fromARGB(255, 238, 238, 238),
                                          shape: RoundedRectangleBorder(
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
                                  margin: EdgeInsets.only(top: 31),
                                  child: Text(
                                    "Receiver Name",
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
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 305,
                                  height: 40,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryElement,
                                    border: Border.fromBorderSide(Borders.secondaryBorder),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Full name",
                                      contentPadding: EdgeInsets.only(left: 15, top: 11, right: 6),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 13),
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
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 305,
                                  height: 40,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryElement,
                                    border: Border.fromBorderSide(Borders.secondaryBorder),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter phone Number",
                                      contentPadding: EdgeInsets.only(left: 15, top: 11, right: 6),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 14),
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
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 305,
                                  height: 40,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryElement,
                                    border: Border.fromBorderSide(Borders.secondaryBorder),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Address",
                                      contentPadding: EdgeInsets.only(left: 15, top: 11),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    textInputAction: TextInputAction.next,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 14),
                                  child: Text(
                                    "Volume",
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
                                  height: 40,
                                  margin: EdgeInsets.only(top: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 88,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryElement,
                                            border: Border.fromBorderSide(Borders.secondaryBorder),
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Enter Volume",
                                              contentPadding: EdgeInsets.only(left: 15, top: 11, right: 6),
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                            maxLines: 1,
                                            autocorrect: false,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 44,
                                          height: 39,
                                          margin: EdgeInsets.only(left: 20),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Image.asset(
                                                  "assets/images/color-outline-blue.png",
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                              Positioned(
                                                left: 13,
                                                top: 7,
                                                child: Text(
                                                  "Kg",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
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
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 31,
                          top: 320,
                          child: Text(
                            "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.accentText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 31,
                          top: 241,
                          child: Text(
                            "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.accentText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 165,
                          right: 35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 15,
                                  height: 18,
                                  margin: EdgeInsets.only(right: 1),
                                  child: FlatButton(
                                    onPressed: () => this.onLayer1Pressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/layer-1-5.png",),
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
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 13,
                                  height: 19,
                                  margin: EdgeInsets.only(top: 139),
                                  child: Image.asset(
                                    "assets/images/layer-1-4.png",
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
              top: 18,
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
          ],
        ),
      ),
    );
  }
}