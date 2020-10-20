/*
*  registration_success_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/tracking_widget/tracking_widget.dart';
import 'package:shopie/values/values.dart';


class RegistrationSuccessWidget extends StatelessWidget {
  
  void onBackPressed(BuildContext context) => Navigator.pop(context);
  
  void onGroup4Pressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingWidget()));
  
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
              bottom: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 293,
                      height: 304,
                      margin: EdgeInsets.only(top: 137),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 293,
                              height: 304,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 0),
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(34)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                        //    top: 21,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Registration\nSuccess",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Great! you have successfully registered\nyour account. You can log in with\nyour phone number or email",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 119, 119, 119),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 125,
                                      height: 125,
                                      margin: EdgeInsets.only(top: 7),
                                      child: Image.asset(
                                        "assets/images/icons8-good-quality-125px-1.png",
                                        fit: BoxFit.none,
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
          ],
        ),
      ),
    );
  }
}