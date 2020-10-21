/*
*  tracking_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:shopie/new_order_widget/new_order_widget.dart';
import 'package:shopie/values/values.dart';

class TrackingWidget extends StatelessWidget {
  void onIconAwesomeSearchPressed(BuildContext context) {}

  void onGroup34Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NewOrderWidget()));

  void onIconIonicMdMenuPressed(BuildContext context) {}

  void onLayer1ThreePressed(BuildContext context) {}

  void onLayer1TwoPressed(BuildContext context) {}

  void onLayer1FourPressed(BuildContext context) {}

  void onLayer1Pressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tracking",
          style: TextStyle(color: Colors.purple[900]),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                  color: Colors.yellow,
                ),
              )),
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(Icons.more_vert),
          //     )),
        ],
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
          },
          child: Icon(
            Icons.menu, color: Colors.yellow, // add custom icons also
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 260,
                      height: 157,
                      margin: EdgeInsets.only(top: 235, right: 60),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 134,
                            right: 0,
                            child: Text(
                              "You haven't made any orders",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              "assets/images/icons8-info-125px.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    margin: EdgeInsets.only(left: 80, top: 5, right: 60),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 34,
                          top: 0,
//                          right: 0,
                          child: Row(
                            children: [
                              Text(
                                "Click ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  letterSpacing: 0.32,
                                ),
                              ),
                              Image.asset(
                                "assets/images/group-35.png",
                                fit: BoxFit.none,
                              ),
                              Text(
                                " to place a new order",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  letterSpacing: 0.32,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 73,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 73,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(41, 0, 0, 0),
                                  offset: Offset(0, -2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/path-204.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 33,
                          right: 34,
                          bottom: 29,
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 21,
                                  height: 24,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onLayer1Pressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Image.asset(
                                      "assets/images/layer-1-9.png",
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 17,
                                  height: 24,
                                  margin: EdgeInsets.only(left: 46, bottom: 1),
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onLayer1TwoPressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Image.asset(
                                      "assets/images/layer-1-10.png",
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 20,
                                  height: 25,
                                  margin: EdgeInsets.only(right: 43),
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onLayer1ThreePressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Image.asset(
                                      "assets/images/layer-1.png",
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 19,
                                  height: 25,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onLayer1FourPressed(context),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: Image.asset(
                                      "assets/images/layer-1-3.png",
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
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () {},
                child: Image.asset(
                  "assets/images/group-34.png",
                  height: 130,
                  width: 130,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
