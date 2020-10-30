/*
*  new_order_widget.dart
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
import 'package:shopie/new_order2_widget/new_order2_widget.dart';
import 'package:shopie/values/values.dart';

import '../constants.dart';

class NewOrderWidget extends StatefulWidget {
  @override
  _NewOrderWidgetState createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  List categoryList = [];
  List tempCategoryList = [];

  TextEditingController _nameController = new TextEditingController();

  TextEditingController _phoneController = new TextEditingController();

  TextEditingController _addressController = new TextEditingController();
  TextEditingController _couponController = new TextEditingController();

  TextEditingController _priceController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = true;

  String total = "0", payable = "0";

  String price = "";
  String full_name;
  String phone;
  String address;
  String coupon;

  void onIconAwesomeArrowLPressed(BuildContext context) {}

  void onInformationPressed(BuildContext context) {}

  void onDetailsPressed(BuildContext context) {}

  void onLayer1Pressed(BuildContext context) {}

  void onGroup4Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NewOrder2Widget()));

  @override
  void initState() {
    super.initState();
    getDetails();
    getVolumePrice();
  }

  void getDetails() async {
    //getCategories
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = await sharedPreferences.get("user");
    Map data = {'user': email};

    var jsonData;
    var response =
        await http.post(Constants.domain + "get_user_details.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      print('success: ' + response.body);

      setState(() {
        full_name = jsonData['name'];
        phone = jsonData['phone'];
        address = jsonData['last_address'];

        _nameController.text = full_name;
        _phoneController.text = phone;
        _addressController.text = address;
      });

//      Toast.show(full_name + " " + phone, context);

/*
      //parse Category List
      Map<String, dynamic> categoriesFromApi = json.decode(response.body);
      List cat = categoriesFromApi['categories'];
      for (final i in cat) {
        var categoryMap = {'name': i['name'], 'value': i['id'].toString()};

        categoryList.add(categoryMap);
      }
      print('Category List: ' + categoryList.toString());
*/
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

  void getVolumePrice() async {
    var jsonData;
    var response =
        await http.post(Constants.domain + "user_gas_get_prices.php");
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      print('success: ' + response.body);

      //parse Category List
//      Map<String, dynamic> categoriesFromApi = json.decode(response.body);

      List cat = json.decode(response.body);
      var ca = {'name': "Select a volume of Gas", "value": ""};
      tempCategoryList.add(ca);

      for (final i in cat) {
        var categoryMap = {
          'name': i['volume'].toString() +
              " Kg \t - " +
              "₦" +
              i['payment_amount'].toString(),
          'value': i['payment_amount'].toString()
        };
        tempCategoryList.add(categoryMap);
      }
      print('Category List: ' + tempCategoryList.toString());

      setState(() {
        _isLoading = false;
        categoryList = tempCategoryList;
      });
    } else {
      try {
        // jsonData = json.decode(response.body);
        print('failed: ' + response.body);
        if (response.statusCode >= 400) {
          showToast('Couldn\'t get prices at this time. Refresh this page',
              context: context,
              animation: StyledToastAnimation.slideFromTop,
              reverseAnimation: StyledToastAnimation.slideToTop,
              position: StyledToastPosition.top,
              startOffset: Offset(0.0, -3.0),
              reverseEndOffset: Offset(0.0, -3.0),
              duration: Duration(seconds: 5),
              //Animation duration   animDuration * 2 <= duration
              animDuration: Duration(seconds: 1),
              curve: Curves.elasticOut,
              reverseCurve: Curves.fastOutSlowIn);
          Navigator.pop(context);
        }
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        var error = 'Oops! Something went wrong.';
        Navigator.pop(context);
        showToast('$error',
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
            key: _scaffoldKey,
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
//        constraints: BoxConstraints.expand(),
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            //this is the container before the "card view" container
                            height: 480,
                            margin:
                                EdgeInsets.only(left: 16, top: 10, right: 15),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    //the "card view" container
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
                                  child: new Form(
                                    key: _formKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 40,
                                          margin: EdgeInsets.only(
                                              left: 9, right: 10),
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
                                                        .onInformationPressed(
                                                            context),
                                                    color: AppColors
                                                        .primaryElement,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors
                                                              .yellowAccent,
                                                          width: 3,
                                                          style: BorderStyle
                                                              .solid),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  9)),
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                    onPressed: () => this
                                                        .onDetailsPressed(
                                                            context),
                                                    color: Color.fromARGB(
                                                        255, 238, 238, 238),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 355,
                                            height: 40,
                                            margin: EdgeInsets.only(top: 10),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryElement,
                                              border: Border.fromBorderSide(
                                                  Borders.secondaryBorder),
                                            ),
                                            child: TextFormField(
                                              validator: _validateName,
                                              controller: _nameController,
                                              autofocus: true,
                                              onSaved: (String value) {
                                                full_name = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Full name",
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, top: 0, right: 6),
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 1,
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              autocorrect: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
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
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 355,
                                            height: 40,
                                            margin: EdgeInsets.only(top: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryElement,
                                              border: Border.fromBorderSide(
                                                  Borders.secondaryBorder),
                                            ),
                                            child: TextFormField(
                                              validator: _validatePhone,
                                              controller: _phoneController,
                                              onSaved: (String value) {
                                                phone = value;
                                              },
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                hintText: "Enter phone Number",
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, top: 0, right: 6),
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 1,
                                              keyboardType: TextInputType.phone,
                                              textInputAction:
                                                  TextInputAction.next,
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
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 225,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color:
                                                  AppColors.primaryElement,
                                                  border: Border.fromBorderSide(
                                                      Borders.secondaryBorder),
                                                ),
                                                child: TextFormField(
                                                  validator: _validateAddress,
                                                  onSaved: (String value) {
                                                    address = value;
                                                  },
                                                  controller:
                                                      _addressController,
                                                  autofocus: true,
                                                  decoration: InputDecoration(
                                                    hintText: "Enter Address",
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15),
                                                    border: InputBorder.none,
                                                  ),
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 1,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  autocorrect: false,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 44,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[100],
//                                          color: AppColors.primaryBackground,
                                                    // boxShadow: [
                                                    //   Shadows.secondaryShadow,
                                                    // ],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: IconButton(
                                                    tooltip:
                                                        "Use google maps to select your location",
                                                    icon:
                                                        Icon(Icons.location_on),
                                                    onPressed: null,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            child: Text(
                                              "Volume",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 355,
                                            height: 40,
                                            margin: EdgeInsets.only(top: 8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    width: 290,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryElement,
                                                      border: Border
                                                          .fromBorderSide(Borders
                                                              .secondaryBorder),
                                                    ),
                                                    child:
                                                        DropdownButtonFormField(
                                                          decoration:
                                                          InputDecoration(
                                                            prefixIcon: Icon(
                                                                Icons
                                                                    .fireplace_outlined),
                                                            filled: true,
                                                            fillColor: Colors
                                                                .white,
                                                            errorStyle: TextStyle(
                                                                color:
                                                                Colors.yellow),
                                                          ),
                                                          value: categoryList[0]
                                                          ['value'],
                                                          // validator: (value) =>
                                                          //     value == null ||
                                                          //             value == ""
                                                          //         ? ''
                                                          //         : null,

                                                          // validator: (value) =>
                                                          //       _validateVolume(
                                                          //           price),
                                                          // onSaved: (value) => value ==
                                                          //             null ||
                                                          //         value == ""
                                                          //     ? _showSnackBar(
                                                          //         'Select a volume of gas')
                                                          //     : null,

//                                                      value: 0,
                                                          items: categoryList
                                                              .map((map) {
                                                            return DropdownMenuItem(
                                                              child:
                                                              Text(map['name']),
                                                              value: map['value'],
                                                            );
                                                          }).toList(),
                                                          onChanged:
                                                              (dynamic value) {
                                                            setState(() {
                                                              // Toast.show(
                                                              //     value +
                                                              //         " is value",
                                                              //     context);
                                                              _priceController
                                                                  .text = value;
                                                              price = value;
                                                            });
                                                          },
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
                                            margin: EdgeInsets.only(top: 13),
                                            child: Text(
                                              "Coupon (Optional)",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 355,
                                            height: 40,
                                            margin: EdgeInsets.only(top: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryElement,
                                              border: Border.fromBorderSide(
                                                  Borders.secondaryBorder),
                                            ),
                                            child: TextFormField(
                                              controller: _couponController,
                                              onSaved: (String value) {
                                                coupon = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Coupon code",
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, top: 0, right: 6),
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 1,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              autocorrect: false,
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
                          Center(
                              child: Text(
                            "Total: ₦ $total",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                          Center(
                              child: Text(
                            "Amount Payable: ₦ $payable",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 324,
                                height: 45,
                                child: FlatButton(
                                  onPressed: () => _validateInputs(),
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
                  ),
                ],
              ),
            ),
          );
  }

  String _validateName(String value) {
    if (value.length > 2) {
      return null;
    }

    return 'Please enter a Valid name';
  }

  String _validateAddress(String value) {
    if (value.length > 2) {
      return null;
    }

    return 'Please enter a Valid Address';
  }

  String _validateVolume(String value) {
    if (value != null || value != "") {
      return null;
    }

    final snackBar = new SnackBar(
      content: new Text("Select a valid gas volume"),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
    return ".";
  }

  String _validatePhone(String value) {
    if (value.length > 10 && value.length < 16) {
      return null;
    }
    return 'Enter a valid phone number';
  }

  void clearAllFields() {
    _formKey.currentState.reset();
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _validateInputs() {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Text forms has validated.
      // Every of the data in the form are valid at this point
      if (price.isNotEmpty && price != null) {
        form.save();
        onGroup4Pressed(context);
      } else {
        setState(() => _showSnackBar('Please, select a volume of gas'));
      }
    } else {
      setState(() => _showSnackBar('Please, fill all fields Chief'));
    }
  }
}
