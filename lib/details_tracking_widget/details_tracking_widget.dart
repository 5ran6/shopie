/*
*  details_tracking_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shopie/values/values.dart';

import '../constants.dart';

class Tracking2Widget extends StatefulWidget {
  String orderId;

  Tracking2Widget(this.orderId);

  @override
  _Tracking2WidgetState createState() => _Tracking2WidgetState();
}

class _Tracking2WidgetState extends State<Tracking2Widget> {
  void onIconAwesomeSearchPressed(BuildContext context) {}

  void onIconIonicMdMenuPressed(BuildContext context) {}

  void onGroup4Pressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  String fullName = "";
  String orderStatus = "";

  String phone = "";
  String address =
      "No 12, Thomas tundi street, High level, Makurdi, Benue State";
  String orderId = "";
  String volume = "";

  String paymentMethod = "";
  String receivingTime = "";
  String price = "";
  String eta = "";
  String status = "";

  bool _isLoading = true;

  List pending;
  List assigned;
  List onTheWay;
  List delivered;

  @override
  void initState() {
    super.initState();
    getDetails(widget.orderId);
  }

  void getDetails(String orderId) async {
    Map data = {'order_id': orderId};

    var jsonData;
    var response = await http
        .post(Constants.domain + "get_gas_order_details.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      print('success: ' + response.body);

      setState(() {
        fullName = jsonData['name'];
        phone = jsonData['phone'];
        volume = jsonData['volume'].toString();
        eta = jsonData['receive_time'];
        price = jsonData['amount'].toString();
        paymentMethod = jsonData['payment_method'];
        status = jsonData['status']['active'];

        // var values = {
        //   'state': jsonData['status']['pending']['state'] as bool,
        //   'date': jsonData['status']['pending']['date']
        // };
        //
        // pending.add(values);
        //
        pending = jsonData['status']['pending'] as List;
        // assigned  = jsonData['status']['assigned'];
        // onTheWay  = jsonData['status']['on_the_way'];
        // delivered  = jsonData['status']['delivered'];

        // address = jsonData['address'];
        this.orderId = orderId;
        _isLoading = false;
      });
    } else {
      try {
        // jsonData = json.decode(response.body);
        print('failed: ' + response.body);
        if (response.statusCode >= 400) {
          showToast('Something went wrong',
              context: context,
              animation: StyledToastAnimation.slideFromTop,
              reverseAnimation: StyledToastAnimation.slideToTop,
              position: StyledToastPosition.top,
              startOffset: Offset(0.0, -3.0),
              reverseEndOffset: Offset(0.0, -3.0),
              duration: Duration(seconds: 4),
              //Animation duration   animDuration * 2 <= duration
              animDuration: Duration(seconds: 1),
              curve: Curves.elasticOut,
              reverseCurve: Curves.fastOutSlowIn);
          Navigator.pop(context);
        }
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        Navigator.pop(context);
        showToast('Oops! Something went wrong!',
            context: context,
            animation: StyledToastAnimation.slideFromTop,
            reverseAnimation: StyledToastAnimation.slideToTop,
            position: StyledToastPosition.top,
            startOffset: Offset(0.0, -3.0),
            reverseEndOffset: Offset(0.0, -3.0),
            duration: Duration(seconds: 4),
            //Animation duration   animDuration * 2 <= duration
            animDuration: Duration(seconds: 1),
            curve: Curves.elasticOut,
            reverseCurve: Curves.fastOutSlowIn);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Scaffold(
              body: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Tracking Details",
                style: TextStyle(
                  color: Colors.purple[900],
                  fontFamily: 'SFNS',
                  fontWeight: FontWeight.w600,
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
                color: Color.fromARGB(255, 249, 249, 249),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 525,
                        margin: EdgeInsets.only(left: 8, top: 15, right: 7),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              //card
                              height: 504,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  Shadows.secondaryShadow,
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Container(),
                            ),
                            Positioned(
                              left: 19,
                              top: 20,
                              right: 26,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 300,
                                    margin: EdgeInsets.only(left: 7),
                                    child: Text(
                                      fullName,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        letterSpacing: -1.19879,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 160,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 140,
                                                height: 152,
                                                margin: EdgeInsets.only(top: 4),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            width: 14,
                                                            height: 14,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 3,
                                                                    top: 19),
                                                            child: Image.asset(
                                                              "assets/images/icon-ionic-ios-checkmark-circle.png",
                                                              fit: BoxFit.none,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Order received",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    letterSpacing:
                                                                        0.28,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "06/10/20 | 10:23am ",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .accentText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          width: 20,
                                                          height: 20,
                                                          child: Image.asset(
                                                            "assets/images/group-39.png",
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                        Alignment.topLeft,
                                                        child: Container(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "Assigned",
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    14,
                                                                    letterSpacing:
                                                                    0.28,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "06/10/20 | 11:10am ",
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: AppColors
                                                                        .accentText,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    12,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                    Row(children: [
                                                      Align(
                                                          alignment:
                                                          Alignment.topLeft,
                                                          child: Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                              "assets/images/group-39.png",
                                                              fit: BoxFit.none,
                                                            ),
                                                          )),
                                                      Align(
                                                        alignment:
                                                        Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(4.0),
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "On the way",
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    14,
                                                                    letterSpacing:
                                                                    0.28,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "06/10/20 | 11:10am ",
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style:
                                                                  TextStyle(
                                                                    color: AppColors
                                                                        .accentText,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    12,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                    Row(children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                              "assets/images/group-39.png",
                                                              fit: BoxFit.none,
                                                            ),
                                                          )),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Delivered",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    letterSpacing:
                                                                        0.28,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "06/10/20 | 11:10am ",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .accentText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 124,
                                            height: 124,
                                            child: Image.asset(
                                              status == 'Pending'
                                                  ? "assets/images/icons8-sync-125px.png"
                                                  : (status == 'Assigned'
                                                  ? "assets/images/handshake.png"
                                                  : (status == 'On the way'
                                                  ? "assets/images/icons8-paper-plane-125px-2.png"
                                                  : "assets/images/icons8-checked-125px.png")),
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
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryElement,
                                      ),
                                      child: Container(),
                                    ),
                                  ), //divider

                                  Container(
                                    height: 45,
                                    margin: EdgeInsets.only(
                                        left: 7, top: 13, right: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 150,
                                            height: 45,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Phone number",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      phone,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 100,
                                            height: 45,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "Order ID",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      orderId,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
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
                                  Container(
                                    height: 80,
                                    margin: EdgeInsets.only(
                                        left: 7, top: 9, right: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 250,
                                            height: 80,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Address",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      letterSpacing: 0.32,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      address,
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      "Volume (price)",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                        Opacity(
                                          opacity: 0,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: 35,
                                              height: 55,
                                              margin: EdgeInsets.only(top: 3),
                                              child: Image.asset(
                                                "assets/images/icons8-qr-code-125px.png",
                                                fit: BoxFit.none,
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
                                      margin: EdgeInsets.only(left: 7, top: 4),
                                      child: Text(
                                        volume + "Kg (@ ₦ $price)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontWeight: FontWeight.w600,
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
                                  ), //divider

                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: 7, top: 13),
                                          child: Text(
                                            "Payment method",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
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
                                          margin:
                                              EdgeInsets.only(left: 6, top: 3),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Image.asset(
                                                    "assets/images/layer-1-8.png",
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    paymentMethod == "Offline"
                                                        ? "Pay on Delivery"
                                                        : "Card Payment",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .secondaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                          margin:
                                              EdgeInsets.only(left: 6, top: 11),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 1),
                                                child: Text(
                                                  "Receiving time (ETA)",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontWeight: FontWeight.w600,
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
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
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
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 4),
                                                            child: Text(
                                                              eta,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                "Done",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
