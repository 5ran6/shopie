/*
*  sign_up_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/mobile_verification_widget/mobile_verification_widget.dart';
import 'package:shopie/values/values.dart';

class SignUpWidget extends StatelessWidget {
  void onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onGroup4Pressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => MobileVerificationWidget()));

  void onIconFeatherEyeOffPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.purple[900]),
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
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 91),
                child: Text(
                  "Create new account ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(left: 16, top: 36, right: 15),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                border: Border.fromBorderSide(Borders.secondaryBorder),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter email",
                  contentPadding: EdgeInsets.only(left: 15),
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
            Container(
              height: 45,
              margin: EdgeInsets.only(left: 16, top: 22, right: 15),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                border: Border.fromBorderSide(Borders.secondaryBorder),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  contentPadding: EdgeInsets.only(left: 15),
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
            Container(
              height: 45,
              margin: EdgeInsets.only(left: 16, top: 22, right: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        border: Border.fromBorderSide(Borders.secondaryBorder),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.only(left: 15),
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
                    top: 0,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onIconFeatherEyeOffPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon-feather-eye-off.png",
                          ),
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 324,
                height: 45,
                margin: EdgeInsets.only(top: 114),
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
    );
  }
}
