/*
*  sign_up_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shopie/login_widget/login_widget.dart';
import 'package:shopie/mobile_verification_widget/mobile_verification_widget.dart';
import 'package:shopie/values/values.dart';
import 'package:toast/toast.dart';

import '../constants.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  String password;
  String phone;
  String email;
  String name;

  bool _isLoading = false;

  void signUp(String email, String password, String name, String phone) async {
    Map data = {
      'name': name.trim(),
      'password': password.trim(),
      'phone': phone.trim(),
      'email': email.trim(),
    };

    var response = await http.post(
      Constants.domain + "create_user.php",
      body: data,
    );
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('got a response from server: ' + response.body);

      if (response.body == 'success') {
        print('success: ' + response.body);
        showToast('Registration Successful',
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

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginWidget()));
      }
      if (response.body == 'found') {
        print('failed: ' + response.body);
        setState(() {
          _isLoading = false;
        });
        showToast('User already registered',
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
      if (response.body == 'error') {
        print('failed: ' + response.body);
        setState(() {
          _isLoading = false;
        });
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
      }
    } else {
      try {
        print('failed: ' + response.body);
        if (response.statusCode == 422) {
          //user not found prompt
          setState(() {
            _isLoading = false;
            showToast('Something went wrong. Try again',
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
          });
        }
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        var error = 'Oops! Something went wrong.';
        setState(() {
          _isLoading = false;
        });
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

  void onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onGroup4Pressed(BuildContext context) {
    if (_nameController.text.isEmpty) {
      Toast.show("Input a name", context);
      return;
    }
    if (_emailController.text.isEmpty) {
      Toast.show("Input an email", context);
      return;
    }
    if (_phoneController.text.isEmpty) {
      Toast.show("Input a phone number", context);
      return;
    }
    if (_passwordController.text.isEmpty) {
      Toast.show("Input a password", context);
      return;
    }

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
        signUp(_emailController.text, _passwordController.text,
            _nameController.text, _phoneController.text);
      });
    }
  }

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
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // constraints: BoxConstraints.expand(),
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
                          fontFamily: 'SFNS',
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
                      border:
                      Border.fromBorderSide(Borders.secondaryBorder),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Enter name",
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
                    margin: EdgeInsets.only(left: 16, top: 36, right: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      border:
                      Border.fromBorderSide(Borders.secondaryBorder),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                      border:
                      Border.fromBorderSide(Borders.secondaryBorder),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
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
                              border: Border.fromBorderSide(
                                  Borders.secondaryBorder),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              //   keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "SFNS",
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
                            onPressed: () =>
                                this.onIconFeatherEyeOffPressed(context),
                            color: Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(0)),
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
          ],
        ),
      ),
    );
  }
}
