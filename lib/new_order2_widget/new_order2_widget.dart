/*
*  new_order2_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shopie/review_order_widget/review_order_widget.dart';
import 'package:shopie/values/values.dart';

class NewOrder2Widget extends StatefulWidget {
  @override
  _NewOrder2WidgetState createState() => _NewOrder2WidgetState();
}

class _NewOrder2WidgetState extends State<NewOrder2Widget> {
  String payment_method = "Card Payment";

  Color highlight = Color.fromARGB(255, 255, 211, 26);
  Color no_highlight = Color.fromARGB(255, 50, 50, 50);
  bool _isLoading = true;

  bool carded = true;
  bool _isTimeSelected = false;
  String selected_time = "";

  int time_index = 0;

  List relevant_times = [];

  void onGroup4Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ReviewOrderWidget()));

  void onIconAwesomeArrowLPressed(BuildContext context) {}

  void onViewTwoPressed(BuildContext context) {}

  void onViewPressed(BuildContext context) {}

  void onStandardDeliveryPressed(BuildContext context) {
    //add boarder decoration
    setState(() {
      payment_method = "Card Payment";
      carded = true;
//      print (payment_method);
    });
  }

  void onTimeSelectedPressed(BuildContext context, String option) {
    //add boarder decoration
    _isTimeSelected = true;
    setState(() {
      selected_time = option;
      print(selected_time);
    });
  }

  void onViewThreePressed(BuildContext context) {}

  void onViewFourPressed(BuildContext context) {}

  void onCustomDeliveryPressed(BuildContext context) {
    //add boarder decoration
    setState(() {
      payment_method = "Pay on Delivery";
      carded = false;
      //    print (payment_method);
    });
  }

  void getCurrentTime() {
    List times = [
      "8am - 9am",
      "9am - 10am",
      "10am - 11am",
      "11am - 12pm",
      "12pm - 1pm",
      "1pm - 2pm",
      "2pm - 3pm",
      "3pm - 4pm",
      "4pm - 5pm",
      "5pm - 6pm"
    ];

    //get current time
    DateTime now = DateTime.now();
    int hour = now.hour;
    print(hour.toString() + " hours into the day");
    //approximate starting index having to know it is 7 hours ahead 7<=x<=16

    if (hour >= 7 && hour <= 16) {
      int starting_index = hour - 7;
      for (int i = starting_index; i < times.length; i++) {
        relevant_times.add(times[i]);
      }

      setState(() {
        //set relevant array
        _isLoading = false;
      });
    } else {
      Navigator.pop(context);
      showToast("Sorry chief, we only deliver gas within 8am to 6pm.",
          context: context,
          animation: StyledToastAnimation.slideFromTop,
          reverseAnimation: StyledToastAnimation.slideToTop,
          position: StyledToastPosition.top,
          startOffset: Offset(0.0, -3.0),
          reverseEndOffset: Offset(0.0, -3.0),
          duration: Duration(seconds: 8),
          //Animation duration   animDuration * 2 <= duration
          backgroundColor: Colors.red,
          animDuration: Duration(seconds: 1),
          curve: Curves.elasticOut,
          reverseCurve: Curves.fastOutSlowIn);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentTime();
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                                onPressed: () => this
                                                    .onViewTwoPressed(context),
                                                color: Color.fromARGB(
                                                    255, 238, 238, 238),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(9)),
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 66, 9, 99),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 66, 9, 99),
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
                                        margin:
                                            EdgeInsets.only(left: 1, top: 33),
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
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                  "Payment Methods",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
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
                                                    color: carded
                                                        ? highlight
                                                        : no_highlight,
                                                    width: 2,
                                                    style: BorderStyle.solid,
                                                  ),
                                                  borderRadius:
                                                      Radii.k7pxRadius,
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 16, 16, 16),
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  "Card Payment",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
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
                                                    .onCustomDeliveryPressed(
                                                        context),
                                                color: AppColors.primaryElement,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: carded
                                                        ? no_highlight
                                                        : highlight,
                                                    width: 2,
                                                    style: BorderStyle.solid,
                                                  ),
                                                  borderRadius:
                                                      Radii.k7pxRadius,
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 16, 16, 16),
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  "Pay on Delivery",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
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
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                  "Receiving Time",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: relevant_times
                                          .map<Widget>(
                                            (option) => FlatButton(
                                              onPressed: () => this
                                                  .onTimeSelectedPressed(
                                                      context, option),
                                              color: AppColors.primaryElement,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: _isTimeSelected
                                                      ? highlight
                                                      : no_highlight,
                                                  width: 2,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: Radii.k7pxRadius,
                                              ),
                                              textColor: Color.fromARGB(
                                                  255, 16, 16, 16),
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                option,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 9, top: 48),
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
