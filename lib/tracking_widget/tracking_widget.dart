/*
*  tracking_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopie/details_tracking_widget/details_tracking_widget.dart';
import 'package:shopie/new_order_widget/new_order_widget.dart';
import 'package:shopie/values/values.dart';

import '../address_bottom_sheet.dart';
import '../constants.dart';

class TrackingWidget extends StatefulWidget {
  @override
  _TrackingWidgetState createState() => _TrackingWidgetState();
}

class _TrackingWidgetState extends State<TrackingWidget> {
  void onIconAwesomeSearchPressed(BuildContext context) {}

  void onGroup34Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NewOrderWidget()));

  // void onGroup34Pressed(BuildContext context) => bottomSheetAddress()
  //     .settingModalBottomSheet(
  //     context,
  //     times,
  //     'Some string');

  String address_id = '';
  Map<String, String> address = {};
  List monthList = [
    {'name': 'January', 'value': 'January'},
    {'name': 'February', 'value': 'January'},
    {'name': 'March', 'value': 'January'},
    {'name': 'April', 'value': 'January'},
    {'name': 'May', 'value': 'January'},
    {'name': 'June', 'value': 'January'},
    {'name': 'July', 'value': 'January'},
    {'name': 'August', 'value': 'January'},
    {'name': 'September', 'value': 'January'},
    {'name': 'October', 'value': 'January'},
    {'name': 'November', 'value': 'January'},
    {'name': 'December', 'value': 'January'}
  ];

  void onIconIonicMdMenuPressed(BuildContext context) {}

  void onLayer1ThreePressed(BuildContext context) {
    // address = bottomSheetAddress().settingModalBottomSheet(context, monthList);
  }

  Widget onLayer1TwoPressed(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.all(Radius.circular(16)),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onLayer1FourPressed(BuildContext context) {}

  void onLayer1Pressed(BuildContext context) {}

  Future getOrders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = await sharedPreferences.get("user");
    Map data = {'user': user};
    var response =
        await http.post(Constants.domain + "get_gas_orders.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        print('success: ' + response.body);
        list = json.decode(response.body);

        // list = orders as List;
        setState(() {
          if (list.length >= 1) {
            ordered = true;
          } else {
            ordered = false;
          }
        });
        return list;
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        //  Toast.show("Error while fetching data", context);
        showToast('Error while fetching data',
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
      setState(() {
        loaded = false;
      });
    } else {
      try {
        setState(() {
          loaded = false;
        });
//  Toast.show("Error while fetching data", context);
        showToast('Error while fetching data',
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
        print('failed: ' + response.body);
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
      }
    }
//    return Future.value("Data download successfully");
  }

  void checkOrderState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = await sharedPreferences.get("user");
    Map data = {'user': user};
    var response =
        await http.post(Constants.domain + "get_gas_orders.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        print('success: ' + response.body);
        list = json.decode(response.body);

        // list = orders as List;
        setState(() {
          if (list.length >= 1) {
            ordered = true;
          } else {
            ordered = false;
          }
        });
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        //  Toast.show("Error while fetching data", context);
        showToast('Error while fetching data',
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
      setState(() {
        loaded = false;
      });
    } else {
      try {
        setState(() {
          loaded = false;
        });
//  Toast.show("Error while fetching data", context);
        showToast('Error while fetching data',
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
        print('failed: ' + response.body);
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
      }
    }
//    return Future.value("Data download successfully");
  }

  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }

  bool loaded = false;
  bool ordered = false;

  List list;

  @override
  void initState() {
    super.initState();
    checkOrderState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
//            color: Color.fromARGB(255, 0, 0, 249),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ordered
                  ? FutureBuilder(
                  future: getOrders(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            )),
                      );
                    } else {
                          return ListView.builder(
                            //                                 shrinkWrap: fase,
                            itemCount: snapshot.data.length,
                            padding: EdgeInsets.all(4.0),
                            itemBuilder: (context, index) {
                              return orders(context, index);
                            },
                          );
                        }
                      })
                  : Column(
                      // THIS IS THE EMPTY BODY
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
                                    "You haven't made any orders ",
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
                      ],
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // THIS IS THE BOTTOM NAVBAR
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    //  Toast.show("Clicked", context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewOrderWidget()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/group-34.png",
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),

                  //     CircleAvatar(
                  //
                  //   radius: 30,
                  //   backgroundImage: ExactAssetImage(
                  //     "assets/images/group-34.png",
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orders(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          // Function is executed on tap.
          //  Toast.show("item $index was clicked", context);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Tracking2Widget(list[index]['order_id'])));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        list[index]['name'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: -0.99899,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text(
                          list[index]['order_id'] +
                              " -\t " +
                              list[index]['volume'].toString() +
                              ' Kg',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 28,
                      margin: EdgeInsets.only(left: 1, top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 95,
                              height: 25,
                              decoration: BoxDecoration(
                                color: list[index]['status'] == 'Pending'
                                    ? Color.fromARGB(255, 178, 178, 178)
                                    : (list[index]['status'] == 'On the way'
                                        ? Color.fromARGB(255, 200, 255, 200)
                                        : list[index]['status'] == 'Assigned'
                                            ? Color.fromARGB(255, 224, 234, 26)
                                            : Color.fromARGB(255, 77, 214, 26)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 13, right: 14),
                                    child: Text(
                                      list[index]['status'] == "None"
                                          ? "Delivered"
                                          : list[index]['status'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        letterSpacing: 0.24,
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
                            child: Text(
                              list[index]['date'] + " | " + list[index]['time'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
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
                left: 8,
                top: 33,
                child: Text(
                  "Order ID",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 21,
                child: Image.asset(
//                  "assets/images/icons8-sync-125px.png",
                  list[index]['status'] == 'Pending'
                      ? "assets/images/icons8-sync-125px.png"
                      : (list[index]['status'] == 'On the way'
                          ? "assets/images/icons8-paper-plane-125px-2.png"
                          : list[index]['status'] == 'Assigned'
                              ? "assets/images/handshake.png"
                              : "assets/images/icons8-checked-125px.png"),
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
