/*
*  login_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/sign_up_widget/sign_up_widget.dart';
import 'package:shopie/values/values.dart';

class LoginWidget extends StatelessWidget {
  void onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onGroup4Pressed(BuildContext context) {}

  void onRegisterNowPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUpWidget()));

  void onIconFeatherEyeOffPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.purple[900]),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        leading: BackButton(
          color: Colors.yellow,
          onPressed: () => this.onIconAwesomeArrowLPressed(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 147,
                      height: 123,
                      margin: EdgeInsets.only(top: 72),
                      child: Image.asset(
                        "assets/images/undraw-welcome-3gvl.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 223,
                      height: 57,
                      margin: EdgeInsets.only(top: 7),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: Text(
                              "Welcome Back!!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 36,
                            child: Text(
                              "You have been missed!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 119, 119, 119),
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 16, top: 34, right: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      border: Border.fromBorderSide(Borders.secondaryBorder),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter email or phone number",
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
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
                              border:
                                  Border.fromBorderSide(Borders.secondaryBorder),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 3,
                          right: 0,
                          child: FlatButton(
                            onPressed: () =>
                                this.onIconFeatherEyeOffPressed(context),
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
                  Container(
                    height: 18,
                    margin: EdgeInsets.only(left: 26, top: 9, right: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Forgot password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 59, 72, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 102,
                            height: 18,
                            child: FlatButton(
                              onPressed: () => this.onRegisterNowPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 59, 72, 255),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Register now?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 72, 255),
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
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 324,
                      height: 45,
                      margin: EdgeInsets.only(top: 26),
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
          ],
        ),
      ),
    );
  }
}
