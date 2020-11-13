/*
*  review_order_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopie/order_successful_widget/order_successful_widget.dart';
import 'package:shopie/pay_for_order_widget/pay_for_order_widget.dart';
import 'package:shopie/values/values.dart';

import '../constants.dart';

class ReviewOrderWidget extends StatefulWidget {
  String name;
  String phone;
  String volume;
  String address;
  String address_id;
  String selectedTime;
  String amount;
  String paid_amount;
  String coupon_code;
  String paymentMethod;

  ReviewOrderWidget(
      @required this.name,
      @required this.phone,
      @required this.volume,
      @required this.address,
      @required this.address_id,
      @required this.selectedTime,
      @required this.amount,
      @required this.paid_amount,
      @required this.coupon_code,
      @required this.paymentMethod);

  @override
  _ReviewOrderWidgetState createState() => _ReviewOrderWidgetState();
}

class _ReviewOrderWidgetState extends State<ReviewOrderWidget> {
  // void onGroup4Pressed(BuildContext context) => Navigator.push(
  //     context, MaterialPageRoute(builder: (context) => PayForOrderWidget()));

  void onGroup4Pressed(BuildContext context) {
    if (widget.paymentMethod == "Offline") {
      setState(() {
        _isLoading = true;
      });

      makeOrder(
          widget.name,
          widget.phone,
          widget.volume,
          widget.address_id,
          widget.selectedTime,
          widget.amount,
          widget.paid_amount,
          widget.coupon_code,
          widget.paymentMethod);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PayForOrderWidget(
                  widget.name,
                  widget.phone,
                  widget.volume,
                  widget.address,
                  widget.selectedTime,
                  widget.amount,
                  widget.paid_amount,
                  widget.coupon_code,
                  widget.paymentMethod)));
    }
  }

  void onIconAwesomeArrowLPressed(BuildContext context) =>
      Navigator.pop(context);

  void onViewPressed(BuildContext context) {}

  void onAmTo12pmPressed(BuildContext context) {}

  void makeOrder(
      String name,
      String phone,
      String volume,
      String address,
      String receiveTime,
      String amount,
      String paidAmount,
      String couponCode,
      String paymentMethod) async {
    //getCategories
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = await sharedPreferences.get("user");
    Map data = {
      'user': email,
      'name': name,
      'volume': volume,
      'address_id': address,
//      'address': address,
      'phone': phone,
      'receive_time': receiveTime,
      'amount': amount,
      'paid_amount': paidAmount,
      'coupon_code': couponCode,
      'payment_method': paymentMethod
    };

    print(email +
        " " +
        name +
        " " +
        volume +
        " " +
        address +
        " " +
        receiveTime +
        " " +
        amount +
        " " +
        paidAmount +
        " " +
        couponCode +
        " " +
        paymentMethod);
    var jsonData;
    var response =
        await http.post(Constants.domain + "submit_gas_order.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      // jsonData = json.decode(response.body);
      print('success: ' + response.body);
      String orderId = "";

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => TrackingWidget()));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OrderSuccessfulWidget(orderId)));
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

  bool _isLoading = false;

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
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 504,
                          margin: EdgeInsets.only(left: 16, top: 20, right: 15),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 454,
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
                              ),
                              Positioned(
                                left: 23,
                                top: 54,
                                right: 30,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        widget.name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          letterSpacing: -1.19879,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 18,
                                      margin:
                                          EdgeInsets.only(top: 28, right: 2),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
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
                                          Spacer(),
                                          Opacity(
                                            opacity: 0,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Reciept number",
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
                                    Container(
                                      height: 18,
                                      margin:
                                          EdgeInsets.only(top: 2, right: 72),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              widget.phone,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.secondaryText,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Opacity(
                                            opacity: 0,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "34344",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color:
                                                      AppColors.secondaryText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 106,
                                      margin:
                                          EdgeInsets.only(top: 28, right: 34),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 91,
                                              height: 110,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "Address",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                        letterSpacing: 0.32,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 2),
                                                      child: Text(
                                                        widget.address,
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 18),
                                                      child: Text(
                                                        "Volume (kg)",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          letterSpacing: 0.32,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 4),
                                                      child: Text(
                                                        widget.volume,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 88,
                                              height: 91,
                                              margin: EdgeInsets.only(top: 2),
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.primaryBackground,
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 87, 239, 117),
                                                ),
                                                borderRadius: Radii.k7pxRadius,
                                              ),
                                              child: Container(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      margin: EdgeInsets.only(top: 28),
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
                                                "Payment Method",
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
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              margin: EdgeInsets.only(
                                                  top: 4, right: 6),
                                              child: Image.asset(
                                                "assets/images/layer-1-6.png",
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 2),
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
                                    Container(
                                      height: 32,
                                      margin:
                                          EdgeInsets.only(top: 9, right: 39),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 135,
                                              height: 31,
                                              margin: EdgeInsets.only(top: 1),
                                              child: FlatButton(
                                                onPressed: () =>
                                                    this.onViewPressed(context),
                                                color:
                                                    AppColors.secondaryElement,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      Radii.k7pxRadius,
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 16, 16, 16),
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  widget.paymentMethod ==
                                                          "Online"
                                                      ? "Card Payment"
                                                      : "Pay on delivery",
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
                                              width: 91,
                                              height: 31,
                                              child: FlatButton(
                                                onPressed: () => this
                                                    .onAmTo12pmPressed(context),
                                                color:
                                                    AppColors.secondaryElement,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      Radii.k7pxRadius,
                                                ),
                                                textColor: Color.fromARGB(
                                                    255, 16, 16, 16),
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  widget.selectedTime,
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
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 221,
                                right: 77,
                                child: Text(
                                  widget.paid_amount,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 186,
                                right: 74,
                                child: Text(
                                  "Price(₦)",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 178, 178, 178),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: 0.32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topCenter,
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
}
